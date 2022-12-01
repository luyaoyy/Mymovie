<%--
  Created by IntelliJ IDEA.
  User: 家全
  Date: 2022/7/7
  Time: 11:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="utf-8" %>
<html>
<head>
    <script type="" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script type="" src="${pageContext.request.contextPath}/js/uploadjs.jsp"></script>
    <title>上传影片</title>
    <link rel="Shortcut Icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon"/>
    <style>
        body{
            background: url("${pageContext.request.contextPath}/img/yun.jpg") no-repeat;
            background-attachment: fixed;
            background-size: 100% 100%;

        }
        textarea{
            background: transparent;
        }
        img{
            opacity: 1;
        }

        #form_out {
            position: relative;
            width: 500px;
            left: 720px;
            top: 125px;
            text-align: center;
            border:2px solid black;
            border-radius: 10px;
            box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
        }

        .inp {
            border: none;
            border-bottom: 1px solid black;
            font-size: 15px;
            background: transparent;
        }

        .inp:focus {
            outline: none;
        }
        #form_out div{
            margin:15px auto ;
        }
        span{
            font-size: 20px ;
            font-weight: 600;
        }
        textarea{
            border-left: none;
            border-right: none;
            width: 500px;
            height: 150px;
        }
        #picture{
            position: absolute;
            right: 420px;
            top: 150px;
        }

    </style>
</head>
<body>
    <div id="form_out">
        <form action="/login/UploadMovieServlet" method="post" enctype="multipart/form-data">
            <h1>上传影片</h1>
            <div><span>名称:</span><input type="text" name="mname" class="inp" > </div>
            <div><span>类别:</span><input type="text" name="mclass" class="inp"> </div>
            <div><span>导演:</span><input type="text" name="mpeople" class="inp"></div>
            <div><span>国家:</span><input type="text" name="mnation" class="inp"> </div>
            <div><span>票价:</span><input type="text" name="mprice" class="inp"></div>
            <div><span>上映时间:</span><input type="text" name="mtime" class="inp"> </div>
            <div><span>豆瓣评分:</span><input type="text" name="mgrade" class="inp"></div>
            <div><span>影片简介:</span><textarea name="mintroduce"></textarea></div>
            <div><span>电影海报:</span><input id="userface" type="file" onchange="preview(this)" name="mimg"><br/></div>
            <input type="submit" value="上传" style="font-size: 22px">
        </form>
    </div>
<div id="picture"><img src="" id="ImgPr" width="235px" height="330px"></div>
    <script>
        $("#userface").uploadPreview({Img: "ImgPr", Width: 120, Height: 120});
    </script>
</body>

</html>
