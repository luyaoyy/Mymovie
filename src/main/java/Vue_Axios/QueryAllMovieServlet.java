package Vue_Axios;

import bean.Movie;
import com.google.gson.Gson;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import utils.Dbutils;
import utils.ResponseResult;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/QueryAllMovieServlet")
public class QueryAllMovieServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码
        QueryRunner runner = new QueryRunner(Dbutils.getDateSource());
        ResultSetHandler<List<Movie>> h = new BeanListHandler<>(Movie.class);
        try {
            List<Movie> movies = runner.query("select * from mymovie order by id asc ", h);
            ResponseResult result=new ResponseResult(true,"sss",movies);
            Gson gson = new Gson();
            String str=gson.toJson(result);
            response.getWriter().println(str);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
