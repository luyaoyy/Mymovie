package controller_user;

import bean.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;
import utils.Dbutils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@WebServlet("/UploadUserServlet")
public class UploadUserServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("/WEB-INF/upfile.jsp").forward(request, response);
        request.setCharacterEncoding("utf-8");//解决请求中的中文乱码
        response.setCharacterEncoding("utf-8");//解决响应中文乱码
        response.setContentType("text/html;charset=utf8");//解决响应中文乱码
    }

    /**
     * 解析上传的图片路径 图片的信息
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // 1)创建磁盘文件工厂类；
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // 2）指定临时文件路径；factory.setRepository()
        File tempDir = new File("C:\\temp");
        factory.setRepository(tempDir);
        // 3）创建上传文件的管理类：ServletFileUpload
        ServletFileUpload upload = new ServletFileUpload(factory);
        try {
            // 4)将请求转换成FileItem的集合；
            List<FileItem> fileItems = upload.parseRequest(request);
            // -=========================================
            // 必须在循环外部创建user对象
            User user = new User();
            // 5）通过IO流将FileItem => 指定的文件当中
            for (FileItem item : fileItems) {
                // 判断是否为正常的表单字段
                if (item.isFormField()) {
                    // 是正常表单字段
                    String name = item.getFieldName();
                    String value = item.getString("utf-8");
                    // -=========================================
                    // 将普通的字段设置到user对象当中
                    if ("username".equals(name)) {
                        user.setUsername(value);
                    } else if ("password".equals(name)) {
                        user.setPassword(value);
                    } else if ("gender".equals(name)) {
                        user.setGender(Integer.parseInt(value));
                    }
                } else {
                    // 是文件上传
                    // 通过IO 字节流拷贝
                    // 输入流
                    InputStream is = item.getInputStream();
                    // 输出流
                    String outputPath = request.getServletContext().getRealPath("/upload");
                    String fileName = UUID.randomUUID().toString();
                    String extName = item.getName().substring(item.getName().lastIndexOf("."));
                    FileOutputStream fos = new FileOutputStream(new File(outputPath + "/" + fileName + extName));
                    // 拷贝
                    IOUtils.copy(is, fos);
                    // -=========================================
                    // 文件上传完成之后，我们需要将上传的路径保存到user对象当中
                    user.setHeader("upload/" + fileName + extName);
                }
            }
            // -=========================================
            // 在for循环之后，将对象保存到数据库
            try {
                long s = new Date().getTime();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                Date date = new Date(s);
                String time=sdf.format(date);


                int rows = new QueryRunner(Dbutils.getDateSource()).update(
                        "insert into user(username, password, gender, nickname, header) values(?, ?, ?, ?, ?)",
                        user.getUsername(), user.getPassword(), user.getGender(), time, user.getHeader());
                if (rows > 0) {
                    // 跳转登录
                    response.sendRedirect("/login/UserRemServlet");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
    }
}