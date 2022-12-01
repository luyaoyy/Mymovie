package controller_user;

import bean.CommentAndUser;
import bean.MyLoveMovieAndMovie;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import service.CommentAndUserServiceImpl;
import service.MovieServiceImpl;
import service.MyLoveMovieServiceImpl;
import utils.Dbutils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

@WebServlet("/AddMyLoveMovieServlet")
public class AddMyLoveMovieServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码
        String mid_str = request.getParameter("mid");
        String uid_str = request.getParameter("uid");
        QueryRunner run = new QueryRunner(Dbutils.getDateSource());
        MyLoveMovieAndMovie myLoveMovieAndMovie = new MyLoveMovieAndMovie();
        ResultSetHandler<MyLoveMovieAndMovie> h = new BeanHandler<>(MyLoveMovieAndMovie.class);
        try {
            myLoveMovieAndMovie = run.query("select * from mylovemovie where userid=? and movieid=?", h, Integer.valueOf(uid_str), Integer.valueOf(mid_str));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        int row = 0;
        if (myLoveMovieAndMovie != null) {
            request.setAttribute("row", -1);
            MovieServiceImpl movieService = new MovieServiceImpl();
            MyLoveMovieServiceImpl myLoveMovieService = new MyLoveMovieServiceImpl();
            CommentAndUserServiceImpl commentAndUserService=new CommentAndUserServiceImpl();
            try {
                List<CommentAndUser> comments=commentAndUserService.queryBymid(Integer.valueOf(mid_str));
                if(comments.size()==0){
                    request.setAttribute("comments", null);
                }else {
                    Collections.reverse(comments);
                    request.setAttribute("comments", comments);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            try {
                request.setAttribute("movie", movieService.selectMovieByid(Integer.valueOf(mid_str)));
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            request.getRequestDispatcher("/userjsp/showmovie.jsp").forward(request, response);
        } else {
            MovieServiceImpl movieService = new MovieServiceImpl();
            MyLoveMovieServiceImpl myLoveMovieService = new MyLoveMovieServiceImpl();
            CommentAndUserServiceImpl commentAndUserService=new CommentAndUserServiceImpl();
            try {
                List<CommentAndUser> comments=commentAndUserService.queryBymid(Integer.valueOf(mid_str));
                if(comments.size()==0){
                    request.setAttribute("comments", null);
                }else {
                    Collections.reverse(comments);
                    request.setAttribute("comments", comments);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            try {
                request.setAttribute("movie", movieService.selectMovieByid(Integer.valueOf(mid_str)));
                row = myLoveMovieService.insertintoMyLovemovie(Integer.valueOf(uid_str), Integer.valueOf(mid_str));
                if (row > 0) {
                    request.setAttribute("row", row);
                    request.getRequestDispatcher("/userjsp/showmovie.jsp").forward(request, response);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
