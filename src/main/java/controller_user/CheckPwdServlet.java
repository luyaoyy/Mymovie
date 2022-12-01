package controller_user;

import bean.User;
import com.google.gson.Gson;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import utils.Dbutils;
import utils.ResponseResult;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/CheckPwdServlet")
public class CheckPwdServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码
        String pwd=request.getParameter("pwd");
        String repwd=request.getParameter("repwd");
        boolean success;
        String message;
        if(!pwd.equals(repwd)){
            success=false;
            message="两次输入密码不一致";
        }else {
            success=true;
            message="";
        }
        ResponseResult result = new ResponseResult(success,message);
        Gson gson = new Gson();
        String str=gson.toJson(result);
        PrintWriter out = response.getWriter();
        out.println(str);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
