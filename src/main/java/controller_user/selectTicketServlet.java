package controller_user;

import bean.Ticket;
import service.MovieServiceImpl;
import service.TicketServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/selectTicketServlet")
public class selectTicketServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码
        String mid=request.getParameter("mid");
        TicketServiceImpl ticketService=new TicketServiceImpl();
        MovieServiceImpl movieService=new MovieServiceImpl();
        try {
            List<Ticket> tickets=ticketService.selectTicketBymid(Integer.valueOf(mid));
            request.setAttribute("tickets",tickets);
            request.setAttribute("movie",movieService.selectMovieByid(Integer.valueOf(mid)));

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.getRequestDispatcher("/userjsp/buyticket.jsp").forward(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
