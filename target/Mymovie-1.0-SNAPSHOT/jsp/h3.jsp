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
    <title>用户管理</title>
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
            height: auto;
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

        #p2 strong {
            color: red;
            font-weight: bold;
            margin-right: 15px;
        }
        #img{
            width: 80px;
            height: 80px;
            border-radius: 50%;
        }

        table {
            margin:0 auto ;
            width: 70%;
            box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
            border-collapse: collapse;
            letter-spacing: 1px;
        }

        table,
        th,
        tr,
        td {
            border-bottom: 1px solid #dedede;
            padding: 29px;
            text-align: center;
        }
        #del{
            background-color: crimson;
            color: white;
            text-decoration: none;
            width: 75px;
            height: 27px;
            display: inline-block;
            border-radius: 9px;
            text-align: center;
            line-height: 27px;
        }
    </style>
</head>
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
        <li><a href="/login/H1Servlet">影片管理</a></li>
        <li><a href="/login/H2Servlet">类别管理</a></li>
        <li id="active"><a href="/login/H3Servlet">用户管理</a></li>
        <li><a href="/login/H4Servlet">个人中心</a></li>
    </ul>
</div>
<div id="right">
    <table>
        <tr>
            <th>序号</th>
            <th>头像</th>
            <th>用户名</th>
            <th>性别</th>
            <th>注册时间</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${sessionScope.users}" var="user" varStatus="statu">
            <tr>
                <td>${statu.index+1}</td>
                <td><img src="${user.header}" id="img"></td>
                <td>${user.username}</td>
                <td><c:choose><c:when test="${user.gender==1}">男</c:when><c:otherwise>女</c:otherwise></c:choose></td>
                <td>${user.nickname}</td>
                <td><a href="/login/DeleteUserServlet?uid=${user.uid}" onclick="return confirm('是否确认将此用户注销?')" id="del">注销用户</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
<script>
    var w=document.getElementById("right").offsetHeight
    var l=document.getElementById("left")
    l.style.height=w+'px'

</script>
</body>
</html>
