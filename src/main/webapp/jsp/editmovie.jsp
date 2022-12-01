<%--
  Created by IntelliJ IDEA.
  User: 家全
  Date: 2022/7/13
  Time: 19:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="utf-8" %>
<html>
<head>
    <script type="" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script type="" src="${pageContext.request.contextPath}/js/uploadjs.jsp"></script>
    <title>编辑影片</title>
    <link rel="Shortcut Icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon"/>
    <style>
        body {
            margin: 0;
            padding: 0;
            background: url("${pageContext.request.contextPath}/img/movieedit.jpg") no-repeat;
            background-attachment: fixed;
            background-size: 100% 100%;
        }

        #out {
            position: absolute;
            left: 950px;
            top: 40px;
        }

        img {
            width: 235px;
            height: 330px;
            display: inline-block;
            position: absolute;
            left: 670px;
            top: 40px;
            border: 6px solid white;
            z-index: 10;
            clear: both;
        }

        #big {
            width: 100%;
            height: 400px;
            background-size: 100% 100%;
            margin-top: 34px;

        }
        textarea{
            background: transparent;
            border: 1px solid black;
        }

        .inp input {
            border: none;
            font-size: 17px;
            color: white;
            background-color: transparent;;
        }

        .name input {
            font-size: 32px;
            width: 350px;
        }

        .inp input:focus {
            outline: none;
            border-bottom: 1px solid white;
        }

        .inp {
            margin: 20px auto;
        }

        form {
            display: inline-block;
        }

        #text {
            width: 765px;
            height: 200px;
            position: relative;
            right: 300px;
        }

        textarea {
            width: 765px;
            height: 150px;
            font-size: 17px;
        }

        span {
            font-size: 20px;
            color: white;
        }

        #ImgPr:hover {
            cursor: pointer;
        }

    </style>
</head>
<body>
<div id="big">

</div>
<label for="userface">
    <div><img id="ImgPr" src="${requestScope.movie.mimg}"/></div>
</label>
<div id="out">
    <form action="/login/EditMovieSendMovieServlet" method="post" enctype="multipart/form-data">
        <input id="userface" type="file" onchange="preview(this)" name="mimg" hidden>
        <input name="id" value="${requestScope.movie.id}" hidden>
        <div class="inp name"><input type="text" name="mname" value="${requestScope.movie.mname}"></div>
        <div class="inp"><span>分类:&nbsp;&nbsp;</span><input type="text" name="mclass"
                                                            value="${requestScope.movie.mclass}"></div>
        <div class="inp"><span>导演:&nbsp;&nbsp;</span><input type="text" name="mpeople"
                                                            value="${requestScope.movie.mpeople}"></div>
        <div class="inp"><span>地区:&nbsp;&nbsp;</span><input type="text" name="mnation"
                                                            value="${requestScope.movie.mnation}"></div>
        <div class="inp"><span>票价(元):&nbsp;&nbsp;</span><input type="text" name="mprice"
                                                               value="${requestScope.movie.mprice}"></div>
        <div class="inp"><span>首映时间:&nbsp;&nbsp;</span><input type="text" name="mtime"
                                                              value="${requestScope.movie.mtime}"></div>
        <div class="inp grade"><span>豆瓣评分:</span>&nbsp;&nbsp;<input type="text" name="mgrade"
                                                                    value="${requestScope.movie.mgrade}"></div>
        <br><br>
        <div id="text">
            <h1>剧情简介</h1>
            <textarea name="mintroduce">${requestScope.movie.mintroduce}</textarea>
        </div>
        <br><br><br>
        <input type="submit" value="保存修改" style="font-size: 20px">
    </form>
</div>
<script>
    $("#userface").uploadPreview({Img: "ImgPr", Width: 120, Height: 120});
</script>
</body>
</html>
