package controller_user;

import org.apache.commons.dbutils.QueryRunner;
import utils.Dbutils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/DeleteTicketServlet")
public class DeleteTicketServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码
        String uid=request.getParameter("uid");
        String mid=request.getParameter("mid");
        String seat=request.getParameter("seat");
        QueryRunner run= new QueryRunner(Dbutils.getDateSource());
        try {
            int r=run.update("delete from ticket where movid=? and useid=? and seat=?",mid,uid,seat);
            if(r>0){
                request.setAttribute("uid",uid);
                request.getRequestDispatcher("selectMyorderServlet").forward(request,response);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
