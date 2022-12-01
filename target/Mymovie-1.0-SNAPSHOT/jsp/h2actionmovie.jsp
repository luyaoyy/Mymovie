<%@ page import="service.MovieServiceImpl" %><%--
  Created by IntelliJ IDEA.
  User: 家全
  Date: 2022/7/5
  Time: 19:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>动作影片</title>
    <link rel="Shortcut Icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon"/>
    <style>
        body {
            margin: 0;
            padding: 0;
        }

        ul {
            list-style: none;
        }

        #left li {
            margin: 10px 0;
            margin: 20px auto;
        }

        #left a {
            text-decoration: none;
            color: white;
        }

        #active {
            background-color: #00A5A5;
            color: white;
        }

        #left ul {
            padding: 0;
            margin: 0;
            text-align: center;
        }

        #left {
            width: 350px;
            height: auto;
            float: left;
            position: absolute;
            left: 0;
            width: 15%;
            background-color: #32323A;
            height: 100%;
        }

        #right {
            /*background-color: gray;*/
            height: 100%;
            position: absolute;
            width: 85%;
            right: 0;
            text-align: center;
        }
        #ahead{
            position: absolute;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            right: 200px;
        }

        #top {
            background-color: #00A5A5;
            height: 60px;
            width: 100%;
            margin: 0;
            padding: 0;
            position: fixed;
            z-index: 20;
            /*position: relative;*/
        }

        #p1 {
            display: inline-block;
            color: white;
            font-size: 25px;
            position: absolute;
            top: -12px;
            margin-left: 10px;
        }

        #p2 {
            display: inline-block;
            font-size: 15px;
            color: white;
            position: absolute;
            right: 10px;
            margin-right: 20px;
        }
        #p2 strong{
            color: red;
            font-weight: bold;
            margin-right: 15px;
        }
        #movie_card{
            display: inline-block;
            float: left;
            margin:10px;
        }
        #movie_card img {
            width: 150px;
            height: 193px;
            margin-bottom: 8px;
        }
        #movie_card img:hover{
            transform: scale(1.1);
        }
        #out{
            width: 900px;
            margin:20px auto ;
            text-align: center;
        }
        #mname{
            width: 151px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            display: inline-block;
        }
        #nav{
            margin:15px auto ;
            height: 50px;
        }
        #nav ul {
            list-style: none;
        }
        #nav li{
            display: inline-block;
            margin:0 20px ;
            line-height: 50px;
            width: 50px;
        }
        #nav a{
            text-decoration: none;

        }
        #now{
            background-color: crimson;
            color: white;
            border-radius: 50%;
        }
        #out{
            width: 900px;
            margin:20px auto ;
            text-align: center;
        }
        #add{
            display: inline-block;
            margin-left: 60px;
            background-color: cornflowerblue;
            width: 80px;
            height: 50px;
            border-radius: 8px;
            line-height: 50px;
        }
        #add a{
            font-size: 20px;
        }
        #edit,#dele{
            display: inline-block;
        }
        #edit{
            margin-left: 35px;
            width: 50px;
            float: left;
            border: 1px solid #d06e6e;
            border-radius: 10px;
            background-color: #d06e6e;
        }
        #dele{
            float: right;
            width: 50px;
            margin-right: 35px;
            border: 1px solid #d06e6e;
            border-radius: 10px;
            background-color: #d06e6e;
        }
        #edit a{
            font-size: 18px;
            color: white;
            text-decoration: none;
        }
        #dele a{
            font-size: 18px;
            color: white;
            text-decoration: none;
        }
    </style>
</head>
<%
    MovieServiceImpl movieService=new MovieServiceImpl();
    String mid_str=request.getParameter("mid");
    if (mid_str!=null){
        int row=movieService.deletemovieByid(Integer.valueOf(mid_str));
        if (row>0){
            session.setAttribute("movies",movieService.queryAllMovie());
            response.sendRedirect("/login/SelectActionMovieServlet");
        }
    }
%>
<body>
<div style="height: 60px">
    <div id="top">
        <p id="p1">影院后台管理系统Admin</p>
        <a href="/login/H4Servlet"><img src="${sessionScope.admin.aheader}" alt="" id="ahead"></a>
        <p id="p2">欢迎您!&nbsp;<strong>${sessionScope.admin.aname}</strong> &nbsp;&nbsp;<a href="/login/ZhuxiaoServlet" style="color: black">注销</a></p>
    </div>
</div>
<div id="left">
    <ul>
        <li ><a href="/login/H1Servlet">影片管理</a></li>
        <li id="active"><a href="/login/H2Servlet">类别管理</a></li>
        <li><a href="/login/H3Servlet">用户管理</a></li>
        <li><a href="/login/H4Servlet">个人中心</a></li>
    </ul>
</div>
<div id="right">
    <nav id="nav">
        <ul>
            <li ><a href="/login/H2Servlet">全部</a></li>
            <li id="now"><a href="/login/SelectActionMovieServlet?mclass=动作">动作</a></li>
            <li><a href="/login/SelectComedyMovieServlet?mclass=动作">喜剧</a></li>
            <li><a href="/login/SelectScienceMovieServlet?mclass=科幻">科幻</a></li>
            <li ><a href="/login/SelectLoveMovieServlet?mclass=爱情">爱情</a></li>
            <li><a href="/login/SelectTerrorMovieServlet?mclass=恐怖">恐怖</a></li>
            <li><a href="/login/SelectCartoonMovieServlet?mclass=动画">动画</a></li>
            <div id="add"><a href="/login/jsp/upmovie.jsp">添加影片</a></div>
        </ul>
    </nav>
    <div id="out">
        <c:forEach items="${sessionScope.actionmovie}" var="movie">
            <div id="movie_card">
                <img src="${movie.mimg}" width="30%">
                <p style="margin:0 ;padding: 0; font-weight: bold;font-size: 25px"><span id="mname">${movie.mname}</span>&nbsp;<span style="font-size: 18px;color: cornflowerblue;font-weight: inherit">${movie.mnation}</span></p>
                <span>导演:${movie.mpeople}</span><br>
                <span>豆瓣评分:<span style="font-weight: bold;font-size: 20px ;color: deepskyblue">${movie.mgrade}</span></span><br>
                <p style="margin:0 ;padding: 0;">票价<span style="font-size: 25px;color: red">￥${movie.mprice}</span></p>
                <div><div id="edit"><a href="/login/EditMovieGetMovieServlet?id=${movie.id}">编辑</a></div><div id="dele"><a href="/login/jsp/h2actionmovie.jsp?mid=${movie.id}" onclick="return confirm('是否确认将此电影下架?')">下架</a></div></div>
            </div>
        </c:forEach>
    </div>
</div>
<script>
    var w=document.getElementById("right").offsetHeight
    var l=document.getElementById("left")
    l.style.height=w+'px'

</script>
</body>
</html>
