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
    <title>我的收藏</title>
    <link rel="Shortcut Icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <style>
        body {
            padding: 0;
            margin: 0;
            background: url("${pageContext.request.contextPath}/img/back.jpg") repeat;
            background-attachment: fixed;
            background-size: 100% 100%;
        }

        button {
            margin: 0;
            padding: 0;
            border: 0;
            outline: 0;
            font-size: 100%;
            vertical-align: baseline;
            background: transparent;
        }

        ul {
            list-style: none;
        }

        nav a {
            text-decoration: none;
            color: white;

        }

        nav {
            padding: 0;
            margin: 0;
            height: 50px;
            background-color: cornflowerblue;
            text-align: center;
            margin-bottom: 2px;
        }

        nav ul li {
            display: inline-block;
            line-height: 50px;
            width: 150px;
            margin: 0 15px;
            font-size: 20px;
        }

        #input {
            width: 260px;
            height: 40px;
            font-size: 17px;
            margin-bottom: 6px;
            border-radius: 15px;
        }

        #sub {
            width: 55px;
            height: 40px;
            border-radius: 10px;
            font-size: 15px;
            line-height: normal;
        }

        #header img {
            display: inline-block;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            margin-right: 10px;
        }

        #header {
            width: 340px;
            height: 45px;
            position: absolute;
            right: 25px;
            top: 0;
            margin-left: 20px;
        }

        #header span {
            margin-right: 20px;
            font-size: 25px;
            color: red;
        }

        #header a {
            color: black;
            font-size: 17px;
        }

        td {
            text-align: center;
        }

        table img {
            width: 139px;
            height: 193px;
            box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
        }

        h2 {
            margin-top: 70px;
            margin-left: 300px;
            margin-bottom: 20px;
        }

        table {
            margin: 20px auto;
            font-size: 18px;
        }

        td {
            text-align: center;
        }

        table {
            margin: 0 auto;
            width: 70%;
            box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.3);
            border-collapse: collapse;
            letter-spacing: 1px;
        }

        table,
        th,
        tr,
        td {
            border-bottom: 1px solid gray;
            /* 表格横线 */
            padding: 15px;
            text-align: center;
        }

        th {
            font-size: 18px;
        }

        #active {
            background: crimson;
            color: #d06e6e;
            border-radius: 4px;
        }

        #cancel, #detail {
            display: inline-block;
            height: 35px;
        }

        #cancel {
            width: 80px;
            float: left;
            border: 1px solid #d06e6e;
            border-radius: 10px;
            background-color: #d06e6e;
        }

        #detail {
            float: right;
            width: 80px;
            border: 1px solid #d06e6e;
            border-radius: 10px;
            background-color: #d06e6e;
        }

        #cancel a {
            font-size: 18px;
            color: white;
            text-decoration: none;
            line-height: 35px;
        }

        #detail a {
            font-size: 18px;
            color: white;
            text-decoration: none;
            line-height: 35px;
        }
        a{
            color: white;
        }
        a:hover{
            text-decoration: none;
            color: black;
        }
        h1{
            width: 800px;
            margin: 80px auto;
        }
        a{
            text-decoration: none;
        }
    </style>
</head>
<body>
<nav>
    <ul>
        <li><a href="HomeServlet">首页</a></li>
        <li><a href="/login/selectMyorderServlet?uid=${sessionScope.user.uid}">我的订单</a></li>
        <li id="active"><a href="/login/SelectMyLoveMovieServlet?uid=${sessionScope.user.uid}">我的收藏</a></li>
        <li><a href="/login/UserInfoServlet">个人中心</a></li>
        <li style="width: 400px"><form action="/login/UserSelectByNameServlet"><input type="text" id="input" name="mname" value="${requestScope.mname}" style="opacity:0.3" placeholder="请输入要查询影片关键字">
            <input type="submit" id="sub" value="搜索" style="opacity:0.3"></form>
        </li>
    </ul>
</nav>
<div>
    <div id="header"><img src="${sessionScope.user.header}"> 欢迎您!&nbsp;<span>${sessionScope.user.username}</span>&nbsp;&nbsp;<a
            href="/login/UserRemServlet">注销</a></div>
</div>
<h2>我的收藏</h2>
<div id="right">
    <c:if test="${requestScope.movies.size()!=0&&requestScope.movies!=null}">
        <table width="800px">
            <tr>
                <th>电影海报</th>
                <th>名称</th>
                <th>类型</th>
                <th>导演</th>
                <th>国家</th>
                <th>票价</th>
                <th>上映时间</th>
                <th>豆瓣评分</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${requestScope.movies}" var="movie">
                <tr>
                    <td><a href="/login/MovieDetailServlet?mid=${movie.id}"><img src="${movie.mimg}" width="120px"></a></td>
                    <td>${movie.mname}</td>
                    <td>${movie.mclass}</td>
                    <td>${movie.mpeople}</td>
                    <td>${movie.mnation}</td>
                    <td>￥${movie.mprice}</td>
                    <td>${movie.mtime}</td>
                    <td>${movie.mgrade}</td>
                    <td style="width: 220px">
                        <div>
                            <div id="detail"><a href="/login/MovieDetailServlet?mid=${movie.id}">查看详情</a></div>
                            <div id="cancel"><a href="/login/DeleteMyLoveMovieServlet?lid=${movie.lid}&uid=${sessionScope.user.uid}"
                                                onclick="return confirm('是否确认取消收藏?')">取消收藏</a></div>
                        </div>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <c:if test="${requestScope.movies.size()==0||requestScope.movies==null}">
        <h1>您暂未收藏任何影片，快去添加吧!</h1>
    </c:if>
</div>
</body>
</html>
