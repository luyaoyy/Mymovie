package controller;

import bean.Admin;
import service.AdminServiceImpl;
import service.MovieServiceImpl;
import service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码
        String name=request.getParameter("aname");
        String pwd=request.getParameter("apwd");
        String rem=request.getParameter("aremember");
        AdminServiceImpl adminService=new AdminServiceImpl();
        Admin admin=new Admin(name,pwd);
        try {
            if(adminService.loginAdminBypassword(admin)!=null){
                if (rem==null){
                    Cookie namecookie=new Cookie("aname","");
                    Cookie pwdcookie=new Cookie("apwd","");
                    Cookie remcookie=new Cookie("aremember","");
                    response.addCookie(namecookie);
                    response.addCookie(pwdcookie);
                    response.addCookie(remcookie);
                }else {
                    Cookie namecookie = new Cookie("aname", name);
                    Cookie pwdcookie = new Cookie("apwd", pwd);
                    Cookie remcookie = new Cookie("aremember", rem);
                    namecookie.setMaxAge(3600*24*7);//在添加时设置时长（秒），即使关闭浏览器打开后cookie仍然存在
                    pwdcookie.setMaxAge(3600*24*7);
                    remcookie.setMaxAge(3600*24*7);
                    response.addCookie(namecookie);
                    response.addCookie(pwdcookie);
                    response.addCookie(remcookie);
                }
                UserServiceImpl userService=new UserServiceImpl();
                HttpSession session= request.getSession();
                session.setAttribute("users",userService.queryAllUser());
                session.setAttribute("admin",adminService.loginAdminBypassword(admin));
                session.setAttribute("aid",adminService.loginAdminBypassword(admin).getAid());
                request.getRequestDispatcher("/H1Servlet").forward(request,response);
            }else{
                request.setAttribute("error2","用户名或密码错误!");
                request.getRequestDispatcher("/jsp/login.jsp").forward(request,response);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
