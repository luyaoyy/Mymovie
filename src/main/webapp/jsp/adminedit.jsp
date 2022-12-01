<%--
  Created by IntelliJ IDEA.
  User: 家全
  Date: 2022/7/7
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="utf-8" %>
<html>
<head>
    <script type="" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script type="" src="${pageContext.request.contextPath}/js/uploadjs.jsp"></script>
    <link rel="Shortcut Icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon"/>
    <title>信息编辑</title>
    <style>
        #content {

            width: 600px;
            margin: 0 auto;
            border: 1px solid black;
            text-align: center;
            margin-top: 150px;
        }

        span {
            font-size: 22px;

        }

        .in {
            width: 200px;
            height: 30px;
            font-size: 20px;
        }

        span {
            display: inline-block;
            width: 100px;
            text-align: left;
        }

        #hhh {
            position: absolute;
            border: 1px solid black;
            width: 180px;
            height: 180px;
            right: 400px;
            top: 190px;
        }

        img {
            width: 180px;
            height: 180px;
        }
    </style>
</head>
<body>
<div id="content">
    <h3>编辑信息</h3>
    <hr>
    <form action="/login/AdminEditServlet" method="post" enctype="multipart/form-data">
        <input type="text" value="${sessionScope.admin.aid}" name="aid" hidden>
        <input id="userface" type="file" onchange="preview(this)" name="mimg" hidden><br><br>
        <span>用户名:</span><input type="text" name="aname" value="${sessionScope.admin.aname}" class="in"><br><br>
        <span>性别:</span><input type="text" name="agender" value="${sessionScope.admin.agender}" class="in"><br><br>
        <span>年龄:</span><input type="text" name="aage" value="${sessionScope.admin.aage}" class="in"><br><br>
        <span>联系方式:</span><input type="text" name="aphone" value="${sessionScope.admin.aphone}" class="in"><br><br>
        <span>邮箱:</span><input type="text" name="aemail" value="${sessionScope.admin.aemail}" class="in"><br><br>
        <span></span><input type="file" name="mimg" hidden> <br/>
        <input type="submit" value="确认" onclick="return confirm('是否确认修改?')"
               style="width: 60px;height: 30px;font-size: 20px">
    </form>
</div>
<label for="userface">
    <div id="hhh"><img id="ImgPr" src="${requestScope.admin.aheader}"/></div>
</label>
<script>
    $("#userface").uploadPreview({Img: "ImgPr", Width: 120, Height: 120});
</script>
</body>
</html>
