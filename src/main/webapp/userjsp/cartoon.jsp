<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 家全
  Date: 2022/7/11
  Time: 20:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="utf-8" %>
<html>
<head>
    <title>动画影片</title>
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
            line-height:normal;
        }


        #header img {
            display: inline-block;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            margin-right: 10px;
            border: 2px solid black;
            vertical-align: middle;
            margin-bottom: 10px;
        }

        #header {
            width: 340px;
            height: 50px;
            position: absolute;
            right: 0;
            top: 0;
            margin-left: 20px;
            text-align: right;
            line-height: 50px;
        }

        #header span {
            margin-right: 20px;
            font-size: 25px;
            color: red;
        }

        #header a {
            color: black;
            font-size: 17px;
            margin-right: 15px;
        }
        .carousel-inner img {
            width: 1400px;
            height: 500px;
        }

        #out {
            margin: 0 auto;
            width: 1400px;
            border: 10px solid #655;
            border-top: none;
            border-bottom: none;
            text-align: center;
            overflow: hidden;
        }

        #nav {
            margin: 15px auto;
            height: 50px;
        }

        #nav ul {
            list-style: none;
        }

        #nav li {
            display: inline-block;
            margin: 0 20px;
            line-height: 60px;
            width: 60px;
        }

        #nav a {
            text-decoration: none;
            font-size: 25px;
        }

        .now {
            background-color: crimson;
            color: white;
            border-radius: 50%;
        }

        #movie_card {
            display: inline-block;
            float: left;
            margin: 10px;
        }

        #movie_card img {
            width: 150px;
            height: 193px;
        }

        #mname {
            width: 151px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            display: inline-block;
        }

        #show {
            margin-left: 60px;
            overflow: hidden;
        }

        #buy {
            width: 65px;
            height: 35px;
            background-color: crimson;
            border-radius: 7px;
            text-align: center;
            display: inline-block;
        }

        #buy a {
            display: inline-block;
            color: white;
            line-height: 35px;
            font-size: 20px;
            text-decoration: none;
        }

        #demo {
            text-align: center;
        }

        #active {
            color: #d06e6e;
            border-radius: 4px;
            background: crimson;
        }

        a:hover{
            text-decoration: none;
            color: black;
        }
        #tourist{
            position: absolute;
            right: 250px;
            top: 4px;
            font-size: 20px;

        }
        #tourist a{
            color: black;
        }
        #bottom{
            width: 400px;
            margin: 10px auto;
            font-size: 23px;
        }
        ul {
            margin: 0;
            padding: 0;

        }

        .name {
            color: white;
            font-weight: 900;
            text-align: left;


        }

        .name ul li {
            list-style: none;
            line-height: 50px;
            height: 50px;
            margin: 10px auto;
            text-align: right;
            cursor: default;
        }

        .current {
            font-size: 38px;
            color: #FF5C38;
        }

        .item {
            display: none;
        }

        .img_content {
            width: 1420px;
            height: 485px;
            margin: 0 auto;
        }

        .img_content img {
            width: 1420px;
            height: 485px;
        }

        .name {
            position: absolute;
            right: 300px;
        }
    </style>
</head>
<body>
<nav>
    <ul>
        <li id="active"><a href="/login/HomeServlet">首页</a></li>
        <li><a href="/login/selectMyorderServlet?uid=${sessionScope.user.uid}">我的订单</a></li>





        <li><a <c:if test="${sessionScope.user!=null}">href="/login/SelectMyLoveMovieServlet?uid=${sessionScope.user.uid}"</c:if> <c:if test="${sessionScope.user==null}">href="/login/RemServlet" onclick="return alert('请您登入!')"</c:if>>我的收藏</a></li>





        <li><a <c:if test="${sessionScope.user!=null}">href="/login/UserInfoServlet"</c:if> <c:if test="${sessionScope.user==null}">href="/login/RemServlet" onclick="return alert('请您登入!')"</c:if>>个人中心</a></li>






        <li style="width: 400px">
            <form action="/login/UserSelectByNameServlet"><input type="text" id="input" name="mname" value="${requestScope.mname}" style="opacity:0.3" placeholder="请输入要查询影片关键字">
                <input type="submit" id="sub" value="搜索" style="opacity:0.3"></form>
        </li>
    </ul>
</nav>
<div>
    <c:if test="${sessionScope.user!=null}">
        <div id="header"><img src="${sessionScope.user.header}"> 欢迎您!&nbsp;<span>${sessionScope.user.username}</span>&nbsp;&nbsp;<a
                href="/login/RemServlet">注销</a></div>
    </c:if>
    <c:if test="${sessionScope.user==null}">
        <div id="tourist"><a href="/login/RemServlet">请登入</a></div>
    </c:if>
</div>
<%--<h3>正在上映</h3>--%>
<div class="name">
    <ul>
        <li class="li current">人生大事</li>
        <li class="li">暗恋:橘生淮南</li>
        <li class="li">君の名は。</li>
        <li class="li">月球陨落</li>
        <li class="li">烈探</li>
        <li class="li">纸钞屋</li>
        <li class="li">纸钞屋</li>
    </ul>
</div>
<div class="img_content">
    <div class="item" style="display: block;"><a href="/login/ShowMovieServlet?mid=132"><img src="${pageContext.request.contextPath}/img/人生大事.jpg" alt=""></a></div>
    <div class="item"><a href="/login/ShowMovieServlet?mid=169"><img src="${pageContext.request.contextPath}/img/暗恋.jpg" alt=""></a></div>
    <div class="item"><a href="/login/ShowMovieServlet?mid=130"><img src="${pageContext.request.contextPath}/img/你的名字.jpeg" alt=""></a></div>
    <div class="item"><a href="/login/ShowMovieServlet?mid=186"><img src="${pageContext.request.contextPath}/img/月球陨落.jpg" alt=""></a></div>
    <div class="item"><a href="/login/ShowMovieServlet?mid=185"><img src="${pageContext.request.contextPath}/img/烈探.jpg" alt=""></a></div>
    <div class="item"><a href="/login/ShowMovieServlet?mid="><img src="${pageContext.request.contextPath}/img/暗恋.jpg" alt=""></a></div>
    <div class="item"><a href="/login/ShowMovieServlet?mid="><img src="${pageContext.request.contextPath}/img/暗恋.jpg" alt=""></a></div>
</div>
<div id="out">
    <div id="content">
        <div id="nav">
            <ul>
                <li><a href="/login/UserSelectMovieByNameServlet">全部</a></li>
                <li ><a href="/login/UserSelectMovieByNameServlet?mclass=动作">动作</a></li>
                <li><a href="/login/UserSelectMovieByNameServlet?mclass=喜剧">喜剧</a></li>
                <li><a href="/login/UserSelectMovieByNameServlet?mclass=科幻">科幻</a></li>
                <li><a href="/login/UserSelectMovieByNameServlet?mclass=爱情">爱情</a></li>
                <li><a href="/login/UserSelectMovieByNameServlet?mclass=恐怖">恐怖</a></li>
                <li class="now"><a href="/login/UserSelectMovieByNameServlet?mclass=动画">动画</a></li>
            </ul>
        </div>
        <div id="show">
            <c:forEach items="${requestScope.movies}" var="movie">
                <div id="movie_card">
                    <img src="${movie.mimg}" width="30%">
                    <p style="margin:0 ;padding: 0; font-weight: bold;font-size: 25px"><span
                            id="mname">${movie.mname}</span>&nbsp;<span
                            style="font-size: 18px;color: cornflowerblue;font-weight: inherit">${movie.mnation}</span>
                    </p>
                    <span>导演:${movie.mpeople}</span><br>
                    <span>豆瓣评分:<span
                            style="font-weight: bold;font-size: 20px ;color: deepskyblue">${movie.mgrade}</span></span><br>
                    <p style="margin:0 ;padding: 0;">票价<span style="font-size: 25px;color: red">￥${movie.mprice}</span>
                    </p>
                    <div id="buy"><a href="/login/ShowMovieServlet?mid=${movie.id}">购票</a></div>
                </div>
            </c:forEach>
        </div>

    </div>
</div>
<script>
    var lis = document.querySelectorAll(".li")
    var items = document.querySelectorAll(".item")
    console.log(items.length)
    for (var i = 0; i < lis.length; i++) {
        lis[i].setAttribute('index', i);
        lis[i].onmouseover = function () {
            for (var i = 0; i < lis.length; i++) {
                lis[i].className = '';
            }
            this.className = 'current';
            var index = this.getAttribute('index');
            for (var i = 0; i < items.length; i++) {
                items[i].style.display = 'none';
            }
            items[index].style.display = 'block';
        }
    }
</script>
</body>
</html>
