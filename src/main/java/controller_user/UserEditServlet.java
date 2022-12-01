package controller_user;

import bean.Movie;
import bean.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;
import service.MovieServiceImpl;
import service.UserServiceImpl;
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

@WebServlet("/UserEditServlet")
public class UserEditServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码
        int uid = 0;
        UserServiceImpl userService = new UserServiceImpl();
        DiskFileItemFactory factory = new DiskFileItemFactory();
        File tempDir = new File("C:\\temp");
        factory.setRepository(tempDir);
        ServletFileUpload upload = new ServletFileUpload(factory);
        try {
            List<FileItem> fileItems = upload.parseRequest(request);
            User user = new User();
            String reaptpwd = "";
            for (FileItem item : fileItems) {
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    String value = item.getString("utf-8");
                    if ("username".equals(name)) {
                        user.setUsername(value);
                    } else if ("uid".equals(name)) {
                        uid = Integer.valueOf(value);
                        System.out.println(uid);
                    } else if ("password".equals(name)) {
                        user.setPassword(value);
                    } else if ("reapetpwd".equals(name)) {
                        reaptpwd = value;
                    } else if ("gender".equals(name)) {
                        user.setGender(Integer.valueOf(value));
                    }
                } else if (item.getSize() != 0) {
                    InputStream is = item.getInputStream();
                    String outputPath = request.getServletContext().getRealPath("/upload");
                    String fileName = UUID.randomUUID().toString();
                    String extName = item.getName().substring(item.getName().lastIndexOf("."));
                    FileOutputStream fos = new FileOutputStream(new File(outputPath + "/" + fileName + extName));
                    IOUtils.copy(is, fos);
                    user.setHeader("upload/" + fileName + extName);
                }
            }
            if (!user.getPassword().equals(reaptpwd)) {
                request.setAttribute("error","两次输入的密码不相同!");
                request.getRequestDispatcher("/userjsp/useredit.jsp").forward(request,response);
            } else {
                if (user.getHeader() != null) {
                    try {
                        int rows = new QueryRunner(Dbutils.getDateSource()).update("update user set username=?,password=?,gender=?,header=? where uid=?", user.getUsername(), user.getPassword(), user.getGender(), user.getHeader(), uid);
                        if (rows > 0) {
                            response.sendRedirect("/login/RemServlet");
                        }
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                } else {
                    int rows = new QueryRunner(Dbutils.getDateSource()).update("update user set username=?,password=?,gender=? where uid=?", user.getUsername(), user.getPassword(), user.getGender(), uid);
                    if (rows > 0) {
                        response.sendRedirect("/login/RemServlet");
                    }
                }
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
