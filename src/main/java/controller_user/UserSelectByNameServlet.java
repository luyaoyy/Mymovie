package controller_user;

import bean.Movie;
import service.MovieServiceImpl;
import utils.PagerResult;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/UserSelectByNameServlet")
public class UserSelectByNameServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码
        String mname=request.getParameter("mname");
        if(mname.equals("")){
            request.setAttribute("movies",null);
        }else {
            request.setAttribute("mname",mname);
            String pageIndexStr = request.getParameter("pageIndex");
            String pageCountStr = request.getParameter("pageCount");
            int pageCount=3; //默认每页显示4条
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
                result = movieService.queryPager(mname,pageIndex,pageCount);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            request.setAttribute("pageResult",result);
            try {
                request.setAttribute("moviess",movieService.selectMovidBymname(mname));
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            request.setAttribute("mname",mname);
            request.setAttribute("movies",(List<Movie>)result.getData());
        }
        request.getRequestDispatcher("/userjsp/userselectbymname.jsp").forward(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
