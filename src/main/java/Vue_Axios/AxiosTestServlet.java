package Vue_Axios;

import bean.Movie;
import bean.User;
import com.google.gson.Gson;
import dao.MovieDaoImpl;
import service.MovieServiceImpl;
import service.UserServiceImpl;
import utils.ResponseResult;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/AxiosTestServlet")
public class AxiosTestServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码
        UserServiceImpl userService=new UserServiceImpl();
        String name=request.getParameter("name");
        String pwd=request.getParameter("pwd");
        String inputCode=request.getParameter("inputCode");
        String code= (String) request.getSession().getAttribute("checkcode");
        try {
            User user=userService.loginUserBypassword(name,pwd);
            if (user!=null&&inputCode.equals(code)){
                ResponseResult result=new ResponseResult(true,"成功",user);
                Gson gson = new Gson();
                String str=gson.toJson(result);
                PrintWriter out = response.getWriter();
                out.println(str);
            }else if (user!=null&&!inputCode.equals(code)){
                ResponseResult result=new ResponseResult(false,"验证码有误!",null);
                Gson gson = new Gson();
                String str=gson.toJson(result);
                PrintWriter out = response.getWriter();
                out.println(str);
            }else if (user==null){
                ResponseResult result=new ResponseResult(false,"用户名或密码错误!",null);
                Gson gson = new Gson();
                String str=gson.toJson(result);
                PrintWriter out = response.getWriter();
                out.println(str);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
