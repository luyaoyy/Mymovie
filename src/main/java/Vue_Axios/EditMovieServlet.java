package Vue_Axios;

import bean.Movie;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import service.MovieServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/EditMovieServlet")
public class EditMovieServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload servletFileUpload = new ServletFileUpload();
        servletFileUpload.setFileItemFactory(factory);
        Movie movie=new Movie();
        MovieServiceImpl movieService=new MovieServiceImpl();
        try {
            List<FileItem> items = servletFileUpload.parseRequest(request);
            for (FileItem item:items){
                if(item.isFormField()){
                    String name = item.getFieldName();
                    String value = item.getString("utf-8");
                    if ("mname".equals(name)) {
                        movie.setMname(value);
                    } else if ("mclass".equals(name)) {
                        movie.setMclass(value);
                    } else if ("mpeople".equals(name)) {
                        movie.setMpeople(value);
                    } else if ("mnation".equals(name)) {
                        movie.setMnation(value);
                    } else if ("mprice".equals(name)) {
                        movie.setMprice(value);
                    } else if ("id".equals(name)) {
                        movie.setId(Integer.valueOf(value)) ;
                    } else if ("mtime".equals(name)) {
                        movie.setMtime(value);
                    } else if ("mgrade".equals(name)) {
                        movie.setMgrade(value);
                    } else if ("mintroduce".equals(name)) {
                        movie.setMintroduce(value);
                    } else if ("mactor".equals(name)) {
                        movie.setMactor(value);
                    } else if ("mduration".equals(name)) {
                        movie.setMduration(value);
                    }
                }
            }
        }catch (FileUploadException e) {
            throw new RuntimeException(e);
        }
        try {
            int row=movieService.updateMovieById(movie);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

}
