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
    <script type="" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script type="" src="${pageContext.request.contextPath}/js/uploadjs.jsp"></script>
    <title>用户编辑</title>
    <link rel="Shortcut Icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon"/>
    <script>
        $(function () {
            var boo=false;
            $("#repwd").blur(function () {
                    $.ajax({
                        url:"http://localhost:8080/login/CheckPwdServlet",
                        data:{"pwd":$("#pwd").val(),"repwd":$("#repwd").val()},
                        type:"get",
                        dataType:"json",
                        success:function (resp) {
                            console.log(resp);
                            if(resp.success==false){
                                $("#msg").text(resp.message);
                                $("#msg").css({color:"red"});
                                boo=false;
                            }else{
                                $("#msg").text(resp.message);
                                $("#msg").css({color:"green"});
                                boo=true;
                            }
                        },
                    });
            });
            $("form").submit(function(){
                if(boo==false){
                    alert("请检查输入信息");
                    return false; //阻止默认事件
                }
            });
        });
    </script>
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

        .head {
            display: inline-block;
            margin-right: 110px;
            margin-left: 210px;
            text-align: center;
            font-size: 22px;

        }

        .head img {
            width: 140px;
            height: 140px;
            margin-bottom: 44px;
        }

        #info {
            display: inline-block;
            margin-top: 100px;
        }

        #dd {
            margin-bottom: 35px;
        }

        .xx {
            font-size: 22px;

        }

        .nn {
            margin: 20px auto;
        }
        .nn input{
            width: 200px;
            height: 29px;
            font-size: 21px;
        }

        span {
            margin-right: 20px;
        }
        #msg{
            font-size: 18px;
        }

    </style>
</head>
<body>
<nav>
    <ul>
        <li id="active"><a href="/login/HomeServlet">首页</a></li>
        <li><a href="/login/selectMyorderServlet?uid=${sessionScope.user.uid}">我的订单</a></li>
        <li><a href="/login/SelectMyLoveMovieServlet?uid=${sessionScope.user.uid}">我的收藏</a></li>
        <li><a href="/login/UserInfoServlet">个人中心</a></li>
        <li style="width: 400px">
            <form action="/login/UserSelectByNameServlet"><input type="text" id="input" name="mname" value="${requestScope.mname}" style="opacity:0.3" placeholder="请输入要查询影片关键字">
                <input type="submit" id="sub" value="搜索" style="opacity:0.3"></form>
        </li>
    </ul>
</nav>
<div id="out">
    <label for="userface">
        <div class="head" ><img id="ImgPr" src="${pageContext.request.contextPath}/${sessionScope.user.header}" alt=""><br>请选择头像</div>
    </label>

    <div id="info">
        <div id="dd"><h3>基本信息</h3>
            <hr>
        </div>
        <form action="/login/UserEditServlet" method="post" enctype="multipart/form-data">
            <input type="text" value="${sessionScope.user.uid}" name="uid" hidden>
            <div class="nn"><span class="xx">用户名:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><input type="text" name="username"
                                                               value="${sessionScope.user.username}"></div>
            <div class="nn"><span class="xx">性别:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                <select name="gender" style="width: 60px;height: 35px;font-size: 21px">
                <option ${sessionScope.user.gender==1?"selected":""} value="1">男</option>
                <option ${sessionScope.user.gender==2?"selected":""} value="2">女</option>
            </select>
            </div>
            <div class="nn"><span class="xx">密码:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><input type="password" name="password" id="pwd"></div>
            <div class="nn"><span class="xx">确认密码:&nbsp;</span><input type="password" name="reapetpwd" id="repwd"></div><span id="msg"></span>
            <input id="userface" type="file" onchange="preview(this)" hidden name="header" >
           <span style="color: red">${requestScope.error}</span>
            <input type="submit" value="保存修改" style="width: 90px;height: 35px;font-size: 20px">
        </form>
    </div>
</div>
<script>
    $("#userface").uploadPreview({Img: "ImgPr", Width: 120, Height: 120});
</script>
</body>
</html>
