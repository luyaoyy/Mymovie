package controller_user;

import bean.CommentAndUser;
import service.CommentAndUserServiceImpl;
import service.MovieServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

@WebServlet("/ShowMovieServlet")
public class ShowMovieServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码
        String mid_str=request.getParameter("mid");
        MovieServiceImpl movieService=new MovieServiceImpl();
        try {
            request.setAttribute("movie",movieService.selectMovieByid(Integer.valueOf(mid_str)));
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
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
        request.getRequestDispatcher("/userjsp/showmovie.jsp").forward(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
