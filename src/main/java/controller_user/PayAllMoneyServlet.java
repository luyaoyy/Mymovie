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

@WebServlet("/PayAllMoneyServlet")
public class PayAllMoneyServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码
        String uid=request.getParameter("uid");
        QueryRunner run=new QueryRunner(Dbutils.getDateSource());
        try {
            int row=run.update("update ticket set status=1 where useid=?",uid);
            if(row>0){
                request.setAttribute("uid",uid);
                request.getRequestDispatcher("/selectMyorderServlet").forward(request,response);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
