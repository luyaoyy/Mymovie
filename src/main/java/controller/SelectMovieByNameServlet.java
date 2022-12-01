package controller;

import bean.Movie;
import dao.MovieDaoImpl;
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

@WebServlet("/SelectMovieByNameServlet")
public class SelectMovieByNameServlet extends HttpServlet {

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
            MovieDaoImpl movieDao=new MovieDaoImpl();
            MovieServiceImpl movieService=new MovieServiceImpl();
            int pageCount=3; //默认每页显示12条
            int pageIndex=1; //默认第一页
            try {
                System.out.println(movieDao.selectCount(mname));
                int sumpage=movieDao.selectCount(mname)%pageCount==0?movieDao.selectCount(mname)/pageCount:movieDao.selectCount(mname)/pageCount+1;
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
            request.setAttribute("movies",(List<Movie>)result.getData());
        }
        request.getRequestDispatcher("/jsp/selectmoviebyname.jsp").forward(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);

    }
}
