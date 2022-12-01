<%--
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
    <title>个人中心</title>
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

        #top {
            background-color: #00A5A5;
            height: 60px;
            width: 100%;
            margin: 0;
            padding: 0;
            position: fixed;
            z-index: 20;
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
        #info{
            width: 400px;
            border: 1px dashed black;
            text-align: center;
            margin:0 auto;
        }
        #info div{
            margin:15px auto;
            border-bottom: 1px solid black;
        }
    </style>
</head>
<body>
<div style="height: 60px">
    <div id="top">
        <p id="p1">影院后台管理系统Admin</p>
        <p id="p2">欢迎您!&nbsp;<strong>${sessionScope.admin.aname}</strong> &nbsp;&nbsp;<a href="/login/ZhuxiaoServlet" style="color: black">注销</a></p>
    </div>
</div>
<div id="left">
    <ul>
        <li ><a href="/login/H1Servlet">影片管理</a></li>
        <li><a href="/login/H2Servlet">类别管理</a></li>
        <li><a href="/login/H3Servlet">用户管理</a></li>
        <li id="active"><a href="/login/H4Servlet">个人中心</a></li>
    </ul>
</div>
<div id="right">
    <h2>管理员信息</h2>
    <div style="width: 150px;margin: 20px auto">
        <img src="${sessionScope.admin.aheader}" width="100px" style=" border: 1px black solid;border-radius: 50%">
    </div>
    <div id="info">
        <h3>基本信息</h3>
        <hr>
        <div>id:&nbsp;&nbsp;${sessionScope.aid}</div>
        <div>姓名:&nbsp;&nbsp;${sessionScope.admin.aname}</div>
        <div>性别:&nbsp;&nbsp;${sessionScope.admin.agender}</div>
        <div>年龄:&nbsp;&nbsp;${sessionScope.admin.aage}</div>
        <div>联系方式:&nbsp;&nbsp;${sessionScope.admin.aphone}</div>
        <div>邮箱:&nbsp;&nbsp;${sessionScope.admin.aemail}</div>
    </div>
    <h2><a href="/login/GetAdminServlet?aid=${sessionScope.admin.aid}">编辑信息</a></h2>
</div>
</body>
</html>
