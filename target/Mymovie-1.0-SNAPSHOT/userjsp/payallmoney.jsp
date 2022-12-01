<%@ page import="java.util.List" %>
<%@ page import="bean.Ticket" %><%--
  Created by IntelliJ IDEA.
  User: 家全
  Date: 2022/7/20
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="utf-8" %>
<html>
<head>
    <title>订单支付</title>
    <link rel="Shortcut Icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon"/>
    <style>
        body{
            padding: 0;
            margin: 0;
            background: url("${pageContext.request.contextPath}/img/paybk.jpg") no-repeat;
            background-attachment: fixed;
            background-size: 100% 100%;
            opacity: 0.7;
        }
        h1,h3{
            color: white;
        }
        #out{

            width: 1200px;
            margin: 0 auto;
            margin-top: 100px;
            text-align: center;
        }
        img{
            width: 300px;
            height: 409px;
        }
        span{
            font-size: 45px;
            color: red;
        }
        input{
            width: 120px;
            height: 40px;
            font-size: 25px;
            text-align: center;
            color: white;
        }
        form{
            margin-top: 35px;
        }

    </style>
</head>
<%
    String money=request.getParameter("money");
    String uid=request.getParameter("uid");
    pageContext.setAttribute("money",money);
    pageContext.setAttribute("uid",uid);
%>
<body>
<div id="out">
    <h1>请选择支付方式</h1>
    <h3>在线支付<span>${pageScope.money}￥</span></h3>
    <div id="code">
        <img src="${pageContext.request.contextPath}/img/weixin.png" style="margin-right: 12px">
        <img src="${pageContext.request.contextPath}/img/zfb.jpg" style="margin-left: 12px">
    </div>
    <form>
        <input type="text" value="${pageScope.uid}" name="uid" hidden>
        <input type="submit" id="sub" value="取消支付" formaction="/login/CancelServlet" formmethod="post" style="background-color: crimson;margin-right: 12px" onclick="return confirm('支付失败')">
        <input type="submit" id="cancel" value="我已支付" formaction="/login/PayAllMoneyServlet" formmethod="get" style="background-color: cornflowerblue;margin-left: 12px" onclick="return confirm('支付成功,祝您观影愉快')">
    </form>
</div>
</body>
</html>
