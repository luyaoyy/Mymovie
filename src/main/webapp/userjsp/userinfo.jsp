<%--
  Created by IntelliJ IDEA.
  User: 家全
  Date: 2022/7/14
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>个人中心</title>
    <link rel="Shortcut Icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon"/>
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
            margin: 0;
            padding: 0;
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
        #out {
            width: 900px;
            margin: 100px auto;
            box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.3);
            height: 700px;
        }

        #head {
            display: inline-block;
            margin-right: 100px;
            margin-left: 100px;

        }

        #head img {
            width: 140px;
            height: 140px;
        }

        #info {
            display: inline-block;
        }

        #dd {
            margin-bottom: 35px;
        }
        .xx{
            font-size: 22px;

        }
        .nn{
            margin: 30px auto;
            border-bottom: 1px solid black;
        }
        span{
            margin-right: 20px;
        }
        #info{
            margin-top: 100px;
        }
        .mm{
            font-size: 18px;
        }
        #change {
            text-decoration: none;
            font-size: 22px;

        }
        a{
            text-decoration: none;
        }
        a:hover{
            text-decoration: none;
            color: black;
        }
        #change{
            margin-top: 60px;
            margin-left: 500px;
        }
        #active {
            color: #d06e6e;
            border-radius: 4px;
            background: crimson;
        }
        #head{
            margin-left: 180px;
        }
    </style>
</head>
<body>
<nav>
    <ul>
        <li ><a href="/login/HomeServlet">首页</a></li>
        <li><a href="/login/selectMyorderServlet?uid=${sessionScope.user.uid}">我的订单</a></li>
        <li><a href="/login/SelectMyLoveMovieServlet?uid=${sessionScope.user.uid}">我的收藏</a></li>
        <li id="active"><a href="/login/UserInfoServlet">个人中心</a></li>
        <li style="width: 400px">
            <form action="/login/UserSelectByNameServlet"><input type="text" id="input" name="mname" value="${requestScope.mname}" style="opacity:0.3" placeholder="请输入要查询影片关键字">
                <input type="submit" id="sub" value="搜索" style="opacity:0.3;font-weight: bolder"></form>
        </li>
    </ul>
</nav>
<div id="out">
    <div id="head"><img src="${sessionScope.user.header}" alt=""></div>
    <div id="info">
        <div id="dd"><h3>基本信息</h3>
            <hr>
        </div>
        <div class="nn"><span class="xx">用户名:</span><span class="mm">${sessionScope.user.username}</span></div>
        <div class="nn"><span class="xx">性别:</span><span class="mm">${sessionScope.user.gender==1?"男":"女"}</span></div>
        <div class="nn"><span class="xx">注册时间:</span><span class="mm">${sessionScope.user.nickname}</span></div>
    </div>
    <div id="change"><a href="/login/userjsp/useredit.jsp">修改信息</a></div>
</div>
</body>
</html>
