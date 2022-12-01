package Vue_Axios;

import bean.Movie;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;

@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码
        //数据流获取信息
        String str=request.getParameter("mname");
//        StringBuilder sb = new StringBuilder();
//        BufferedReader reader = request.getReader();
//        System.out.println(reader);
//        char[] buf = new char[1024];
//        int len;
//        while ((len = reader.read(buf)) != -1){
//            sb.append(buf,0,len);
//        }

        //转json
//        String str = sb.toString();
        System.out.println(str+" "+"111");
        response.getWriter().println(str);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
