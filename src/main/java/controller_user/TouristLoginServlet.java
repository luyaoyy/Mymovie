package controller_user;

import bean.Movie;
import service.MovieServiceImpl;
import utils.PagerResult;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/TouristLoginServlet")
public class TouristLoginServlet extends HttpServlet {

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
        HttpSession session=request.getSession();
        session.setAttribute("user",null);
        String search=request.getParameter("search");
        String pageIndexStr = request.getParameter("pageIndex");
        String pageCountStr = request.getParameter("pageCount");
        int pageCount=18; //默认每页显示12条
        int pageIndex=1; //默认第一页
        if(pageIndexStr!=null){
            pageIndex = Integer.parseInt(pageIndexStr);
        }
        if(pageCountStr!=null){
            pageCount=Integer.parseInt(pageCountStr);
        }
        MovieServiceImpl movieService=new MovieServiceImpl();
        PagerResult result= null;
        try {
            result = movieService.queryPager(search,pageIndex,pageCount);
            System.out.println();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("pageResult",result);
        request.setAttribute("movies",(List<Movie>)result.getData());





        request.getRequestDispatcher("/userjsp/home.jsp").forward(request,response);

    }

}
