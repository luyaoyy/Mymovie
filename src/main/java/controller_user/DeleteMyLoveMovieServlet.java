package controller_user;

import dao.MyLoveMovieDaoImple;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/DeleteMyLoveMovieServlet")
public class DeleteMyLoveMovieServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码
        String lid_str=request.getParameter("lid");
        String uid_str=request.getParameter("uid");
        MyLoveMovieDaoImple myLoveMovieDaoImple=new MyLoveMovieDaoImple();
        try {
            if(myLoveMovieDaoImple.deleteMyLovemovieBylid(Integer.valueOf(lid_str))>0){
                request.setAttribute("movies",myLoveMovieDaoImple.selectLoveMovieByUid(Integer.valueOf(uid_str)));
                request.getRequestDispatcher("/userjsp/mylovemovie.jsp").forward(request,response);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
