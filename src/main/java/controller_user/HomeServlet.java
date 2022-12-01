package controller_user;

import bean.Movie;
import dao.MovieDaoImpl;
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

@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码
        String search=request.getParameter("search");
        String pageIndexStr = request.getParameter("pageIndex");
        String pageCountStr = request.getParameter("pageCount");
        MovieServiceImpl movieService=new MovieServiceImpl();
        MovieDaoImpl movieDao=new MovieDaoImpl();
        int pageCount=12; //默认每页显示12条
        int pageIndex=1; //默认第一页
        try {
            int sumpage=movieDao.selectCount(null)%pageCount==0?movieDao.selectCount(null)/pageCount:movieDao.selectCount(null)/pageCount+1;
            if(pageIndexStr!=null){
                if(Integer.parseInt(pageIndexStr)<=0){
                    pageIndex=1;
                }else {
                    pageIndex = Integer.parseInt(pageIndexStr)>sumpage?sumpage:Integer.parseInt(pageIndexStr);
                }
            }
            if(pageCountStr!=null){
                pageCount=Integer.parseInt(pageCountStr);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        PagerResult result= null;
        try {
            result = movieService.queryPager(search,pageIndex,pageCount);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("pageResult",result);
        request.setAttribute("movies",(List<Movie>)result.getData());




        request.getRequestDispatcher("/userjsp/home.jsp").forward(request,response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
