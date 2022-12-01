package controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/RemServlet")
public class RemServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码
        String username = null, pwd = null, remember = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                String nam = cookie.getName();
                if (nam.equals("aname")) {
                    username = cookie.getValue();
                } else if (nam.equals("apwd")) {
                    pwd = cookie.getValue();
                } else if (nam.equals("aremember")) {
                    remember = cookie.getValue();
                }
            }
        }
        request.setAttribute("aname", username);
        request.setAttribute("apwd", pwd);
        request.setAttribute("aremember", remember);

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                String nam = cookie.getName();
                if (nam.equals("uname")) {
                    username = cookie.getValue();
                } else if (nam.equals("pwd")) {
                    pwd = cookie.getValue();
                } else if (nam.equals("remember")) {
                    remember = cookie.getValue();
                }
            }
        }
        request.setAttribute("uname", username);
        request.setAttribute("pwd", pwd);
        request.setAttribute("remember", remember);
        request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码
        String username = null, pwd = null, remember = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                String nam = cookie.getName();
                if (nam.equals("aname")) {
                    username = cookie.getValue();
                } else if (nam.equals("apwd")) {
                    pwd = cookie.getValue();
                } else if (nam.equals("aremember")) {
                    remember = cookie.getValue();
                }
            }
        }
        request.setAttribute("aname", username);
        request.setAttribute("apwd", pwd);
        request.setAttribute("aremember", remember);
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                String nam = cookie.getName();
                if (nam.equals("uname")) {
                    username = cookie.getValue();
                } else if (nam.equals("pwd")) {
                    pwd = cookie.getValue();
                } else if (nam.equals("remember")) {
                    remember = cookie.getValue();
                }
            }
        }
        request.setAttribute("uname", username);
        request.setAttribute("pwd", pwd);
        request.setAttribute("remember", remember);
        request.getRequestDispatcher("/jsp/login.jsp").forward(request, response);
    }
}
