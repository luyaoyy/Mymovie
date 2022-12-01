package controller_user;

import service.MovieServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/UserSelectMovieByNameServlet")
public class UserSelectMovieByNameServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码
        String name=request.getParameter("mclass");
        MovieServiceImpl movieService=new MovieServiceImpl();
        if(name==null){
            response.sendRedirect("/login/HomeServlet");
        }else if (name.equals("动作")){
            try {
                request.setAttribute("movies",movieService.selectMovieBymclass(name));
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            request.getRequestDispatcher("/userjsp/action.jsp").forward(request,response);
        } else if (name.equals("喜剧")) {
            try {
                request.setAttribute("movies",movieService.selectMovieBymclass(name));
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            request.getRequestDispatcher("/userjsp/comedy.jsp").forward(request,response);
            
        } else if (name.equals("科幻")) {
            try {
                request.setAttribute("movies",movieService.selectMovieBymclass(name));
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            request.getRequestDispatcher("/userjsp/science.jsp").forward(request,response);
            
        } else if (name.equals("爱情")) {
            try {
                request.setAttribute("movies",movieService.selectMovieBymclass(name));
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            request.getRequestDispatcher("/userjsp/love.jsp").forward(request,response);
            
        } else if (name.equals("恐怖")) {
            try {
                request.setAttribute("movies",movieService.selectMovieBymclass(name));
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            request.getRequestDispatcher("/userjsp/terror.jsp").forward(request,response);
            
        } else if (name.equals("动画")) {
            try {
                request.setAttribute("movies",movieService.selectMovieBymclass(name));
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            request.getRequestDispatcher("/userjsp/cartoon.jsp").forward(request,response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
