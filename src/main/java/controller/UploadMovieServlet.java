package controller;

import bean.Movie;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;
import service.MovieServiceImpl;
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

@WebServlet("/UploadMovieServlet")
public class UploadMovieServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码
        DiskFileItemFactory factory = new DiskFileItemFactory();
        File tempDir = new File("C:\\temp");
        factory.setRepository(tempDir);
        ServletFileUpload upload = new ServletFileUpload(factory);
        try {
            List<FileItem> fileItems = upload.parseRequest(request);
            Movie movie = new Movie();
            for (FileItem item : fileItems) {
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    String value = item.getString("utf-8");
                    if ("mname".equals(name)) {
                        movie.setMname(value);
                    } else if ("mclass".equals(name)) {
                        movie.setMclass(value);
                    } else if ("mnation".equals(name)) {
                        movie.setMnation(value);
                    } else if ("mprice".equals(name)) {
                        movie.setMprice(value);
                    } else if ("mtime".equals(name)) {
                        movie.setMtime(value);
                    } else if ("mgrade".equals(name)) {
                        movie.setMgrade(value);
                    } else if ("mintroduce".equals(name)) {
                        movie.setMintroduce(value);
                    } else if ("mpeople".equals(name)) {
                        movie.setMpeople(value);
                    }
                } else {
                    InputStream is = item.getInputStream();
                    String outputPath = request.getServletContext().getRealPath("/upload");
                    String fileName = UUID.randomUUID().toString();
                    String extName = item.getName().substring(item.getName().lastIndexOf("."));
                    FileOutputStream fos = new FileOutputStream(new File(outputPath + "/" + fileName + extName));
                    IOUtils.copy(is, fos);
                    movie.setMimg("upload/" + fileName + extName);
                }
            }
            try {
                int rows = new QueryRunner(Dbutils.getDateSource()).update(
                        "insert into mymovie(mname, mclass,mpeople, mnation,mprice, mtime, mgrade,mintroduce,mimg) values(?, ?, ?, ?,?, ?,?,?,?)", movie.getMname(), movie.getMclass(),movie.getMpeople(), movie.getMnation(),movie.getMprice(), movie.getMtime(), movie.getMgrade(),movie.getMintroduce(), movie.getMimg());
                if (rows > 0) {
                    // 跳转登录
                    MovieServiceImpl moviceService=new MovieServiceImpl();
                    HttpSession session=request.getSession();
                    session.setAttribute("movies",moviceService.queryAllMovie());
                    response.sendRedirect("/login/H2Servlet");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
    }
}
