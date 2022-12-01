package controller_user;

import bean.Ticket;
import service.TicketServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/selectMyorderServlet")
public class selectMyorderServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码
        String uid=request.getParameter("uid");
        TicketServiceImpl ticketService=new TicketServiceImpl();
        try {
            List<Ticket> tickets=ticketService.selectMyTicket(Integer.valueOf(uid));
            int sum=0;
            for (Ticket ticket:tickets){
                if(ticket.getStatus()==0){
                    sum+=Integer.valueOf(ticket.getMprice());
                }
            }
            request.setAttribute("sum",sum);
            request.setAttribute("tickets",tickets);
            request.setAttribute("tickets",tickets);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.getRequestDispatcher("/userjsp/myorder.jsp").forward(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
