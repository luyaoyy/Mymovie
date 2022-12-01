package controller;

import bean.Admin;
import bean.Movie;
import dao.AdminDaoImpl;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;
import service.AdminServiceImpl;
import utils.Dbutils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

@WebServlet("/AdminEditServlet")
public class AdminEditServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码
        int aid = 0;
        DiskFileItemFactory factory = new DiskFileItemFactory();
        File tempDir = new File("C:\\temp");
        factory.setRepository(tempDir);
        ServletFileUpload upload = new ServletFileUpload(factory);
        try {
            List<FileItem> fileItems = upload.parseRequest(request);
            Admin admin = new Admin();
            for (FileItem item : fileItems) {
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    String value = item.getString("utf-8");
                    if ("aname".equals(name)) {
                        admin.setAname(value);
                    } else if ("agender".equals(name)) {
                        admin.setAgender(value);
                    } else if ("aage".equals(name)) {
                        admin.setAage(value);
                    } else if ("aphone".equals(name)) {
                        admin.setAphone(value);
                    } else if ("aemail".equals(name)) {
                        admin.setAemail(value);
                    }else if ("aid".equals(name)){
                       aid=Integer.valueOf(value);
                    }
                } else if (item.getSize()!=0){
                    InputStream is = item.getInputStream();
                    String outputPath = request.getServletContext().getRealPath("/upload");
                    String fileName = UUID.randomUUID().toString();
                    String extName = item.getName().substring(item.getName().lastIndexOf("."));
                    System.out.println(outputPath + "/" + fileName + extName);
                    FileOutputStream fos = new FileOutputStream(new File(outputPath + "/" + fileName + extName));
                    IOUtils.copy(is, fos);
                    admin.setAheader("upload/" + fileName + extName);
                }
            }
            if(admin.getAheader()!=null){
                try {
                    int rows = new QueryRunner(Dbutils.getDateSource()).update(
                            "update admin set aname=?,agender=?,aage=?,aphone=?,aemail=?,aheader=?", admin.getAname(), admin.getAgender(), admin.getAage(), admin.getAphone(), admin.getAemail(), admin.getAheader());
                    if (rows > 0) {
                        HttpSession session=request.getSession();
                        AdminServiceImpl adminService=new AdminServiceImpl();
                        session.setAttribute("admin",adminService.queryAdminByaid(aid));
                        response.sendRedirect("/login/H4Servlet");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }else {
                int rows = new QueryRunner(Dbutils.getDateSource()).update(
                        "update admin set aname=?,agender=?,aage=?,aphone=?,aemail=?", admin.getAname(), admin.getAgender(), admin.getAage(), admin.getAphone(), admin.getAemail());
                if (rows > 0) {
                    HttpSession session=request.getSession();
                    AdminServiceImpl adminService=new AdminServiceImpl();
                    session.setAttribute("admin",adminService.queryAdminByaid(aid));
                    response.sendRedirect("/login/H4Servlet");
                }
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
