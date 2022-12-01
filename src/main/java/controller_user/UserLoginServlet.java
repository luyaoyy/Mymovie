package controller_user;

import bean.Admin;
import bean.User;
import service.AdminServiceImpl;
import service.MovieServiceImpl;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码
        String name=request.getParameter("uname");
        String pwd=request.getParameter("pwd");
        String rem=request.getParameter("remember");
       UserServiceImpl userService=new UserServiceImpl();
        User user= null;
        try {
            user = userService.loginUserBypassword(name,pwd);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        Admin admin=new Admin(name,pwd);
            if(user!=null){
                if (rem==null){
                    Cookie namecookie=new Cookie("uname","");
                    Cookie pwdcookie=new Cookie("pwd","");
                    Cookie remcookie=new Cookie("remember","");
                    response.addCookie(namecookie);
                    response.addCookie(pwdcookie);
                    response.addCookie(remcookie);
                }else {
                    Cookie namecookie = new Cookie("uname", name);
                    Cookie pwdcookie = new Cookie("pwd", pwd);
                    Cookie remcookie = new Cookie("remember", rem);
                    namecookie.setMaxAge(3600*24*7);//在添加时设置时长（秒），即使关闭浏览器打开后cookie仍然存在
                    pwdcookie.setMaxAge(3600*24*7);
                    remcookie.setMaxAge(3600*24*7);
                    response.addCookie(namecookie);
                    response.addCookie(pwdcookie);
                    response.addCookie(remcookie);
                }
                HttpSession session= request.getSession();
                session.setAttribute("user",user);
                response.sendRedirect("/login/HomeServlet");
            }else{
                request.setAttribute("error1","用户名或密码错误!");
                request.getRequestDispatcher("/jsp/login.jsp").forward(request,response);
            }
    }
}
