package controller_user;

import bean.CommentAndUser;
import bean.Movie;
import org.apache.commons.dbutils.QueryRunner;
import service.CommentAndUserServiceImpl;
import service.MovieServiceImpl;
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

@WebServlet("/AddCommentServlet")
public class AddCommentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码
        String mid_str = request.getParameter("mid");
        String uid_str = request.getParameter(("uid"));
        String text = request.getParameter("text");
        if (uid_str == null||uid_str.equals("")) {
            PrintWriter pw=response.getWriter();
            pw.print("<script language='javascript'>alert('请您登入后评论!');window.location.href='RemServlet';</script>");
            //设置弹窗
        } else {
            if (text.equals("") || text == null) {
                MovieServiceImpl movieService = new MovieServiceImpl();
                request.setAttribute("error", "请输入内容");
                try {
                    request.setAttribute("movie", movieService.selectMovieByid(Integer.valueOf(mid_str)));
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                CommentAndUserServiceImpl commentAndUserService = new CommentAndUserServiceImpl();
                try {
                    List<CommentAndUser> comments=commentAndUserService.queryBymid(Integer.valueOf(mid_str));
                    if(comments.size()==0){
                        request.setAttribute("comments", null);
                    }else {
                        Collections.reverse(comments);
                        request.setAttribute("comments", comments);
                    }
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                request.getRequestDispatcher("/userjsp/showmovie.jsp").forward(request, response);
            } else {
                QueryRunner run = new QueryRunner(Dbutils.getDateSource());
                long s = new Date().getTime();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                Date date = new Date(s);
                try {
                    int row = run.update("insert into comment(userid,movieid,content,time) values(?,?,?,?)", Integer.valueOf(uid_str), Integer.valueOf(mid_str), text, sdf.format(date));
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                request.setAttribute("mid", Integer.valueOf(mid_str));
                request.getRequestDispatcher("/ShowMovieServlet").forward(request, response);
            }
        }
    }
}
