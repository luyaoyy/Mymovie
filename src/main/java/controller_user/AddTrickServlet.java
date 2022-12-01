package controller_user;

import bean.CommentAndUser;
import bean.Ticket;
import dao.CommentAndUserDaoImpl;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import service.CommentAndUserServiceImpl;
import service.MovieServiceImpl;
import service.TicketServiceImpl;
import utils.Dbutils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;

@WebServlet("/AddTrickServlet")
public class AddTrickServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码
        String time="今天15:00";
        String room=request.getParameter("room");
        String row=request.getParameter("row");
        String col=request.getParameter("col");
        String tprice=request.getParameter("tprice");
        String  mid=request.getParameter("mid");
        String uid=request.getParameter("uid");
        int seat=(Integer.valueOf(row)-1)*10+Integer.valueOf(col);
        Ticket ticket=new Ticket();
        QueryRunner run=new QueryRunner(Dbutils.getDateSource());
        ResultSetHandler<Ticket> h=new BeanHandler<>(Ticket.class);
        try {
            ticket=run.query("select * from ticket where movid=? and seat=?",h,mid,seat);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        if(ticket!=null){
            request.setAttribute("mid",mid);
            request.setAttribute("error",-1);
            request.getRequestDispatcher("selectTicketServlet").forward(request,response);
        }else {
            long s = new Date().getTime();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date = new Date(s);
            TicketServiceImpl ticketService=new TicketServiceImpl();
            MovieServiceImpl movieService=new MovieServiceImpl();
            CommentAndUserServiceImpl commentAndUserService=new CommentAndUserServiceImpl();
            int r= 0;
            try {
                r = ticketService.addTrice(Integer.valueOf(mid),Integer.valueOf(uid),time,seat,room,tprice,sdf.format(date));
                request.setAttribute("movie",movieService.selectMovieByid(Integer.valueOf(mid)));
                List<CommentAndUser> comments=commentAndUserService.queryBymid(Integer.valueOf(mid));
                if(comments.size()==0){
                    request.setAttribute("comments", null);
                }else {
                    Collections.reverse(comments);
                    request.setAttribute("comments", comments);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            if (r>0){
                request.setAttribute("result",r);
                request.getRequestDispatcher("/userjsp/showmovie.jsp").forward(request,response);

            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
