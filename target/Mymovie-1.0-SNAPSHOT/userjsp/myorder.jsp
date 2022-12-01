<%--
  Created by IntelliJ IDEA.
  User: 家全
  Date: 2022/7/17
  Time: 22:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>我的订单</title>
    <link rel="Shortcut Icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon"/>
    <style>
        body {
            padding: 0;
            margin: 0;
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
            text-decoration: none;
        }

        #tourist {
            position: absolute;
            right: 250px;
            top: 4px;
            font-size: 20px;
        }

        #tourist a {
            color: black;
        }

        ul {
            list-style: none;
        }
        #active {
            color: #d06e6e;
            border-radius: 4px;
            background: crimson;
        }

        table {
            margin: 0 auto;
            width: 80%;
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

        #img {
            width: 95px;
            height: 138px;
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
        #detail1 {
            text-align: center;
            width: 80px;
            border: 1px solid #d06e6e;
            border-radius: 10px;
            background-color: #d06e6e;
            margin: 8px auto;
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
        #detail1 a {
            font-size: 18px;
            color: white;
            text-decoration: none;
            line-height: 35px;
        }
        .td{
            font-size: 21px;
        }

        a {
            color: white;
        }
        img:hover{
            transform:scale(1.2) ;
        }
        #tip{
            font-size: 17px;
            color: red;
        }
    </style>
</head>
<body>
<nav>
    <ul>
        <li><a href="HomeServlet">首页</a></li>
        <li id="active"><a href="/login/selectMyorderServlet?uid=${sessionScope.user.uid}">我的订单</a></li>
        <li><a href="/login/SelectMyLoveMovieServlet?uid=${sessionScope.user.uid}">我的收藏</a></li>
        <li><a href="/login/UserInfoServlet">个人中心</a></li>
        <li style="width: 400px">
            <form action="/login/UserSelectByNameServlet"><input type="text" id="input" name="mname"
                                                                 value="${requestScope.mname}" style="opacity:0.3"
                                                                 placeholder="请输入要查询影片关键字">
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
<div style="padding-bottom: 80px">
    <table>
        <tr>
            <th>序号</th>
            <th>海报</th>
            <th>影片名</th>
            <th>放映厅</th>
            <th>位置</th>
            <th>下单时间</th>
            <th>总计</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${requestScope.tickets}" var="ticket" varStatus="statu">
            <tr>
                <td class="td">${statu.index+1}</td>
                <td class="td"><a href="/login/MovieDetailServlet?mid=${ticket.movid}"><img src="${ticket.mimg}" alt="" id="img"></a></td>
                <td class="td">${ticket.mname}</td>
                <td class="td">${ticket.room}</td>
                <td class="td">${ fn:substring(((ticket.seat)/10),0,fn:indexOf(((ticket.seat)/10), '.'))+1}排${ticket.seat%10}列</td>
                <td class="td">${ticket.buytime}</td>
                <td style="font-size: 24px;color: red">￥${ticket.mprice}</td>
                <td width="200px">
                    <div>
                        <c:if test="${ticket.status==0}"><div id="detail"><a href="/login/userjsp/paymoney.jsp?tid=${ticket.tid}&money=${ticket.tprice}&tid=${ticket.tid}&uid=${sessionScope.user.uid}">支付</a></div></c:if>
                        <c:if test="${ticket.status==1}"><div><span id="tip">订单已支付，请及时观影</span></div>
                            <div id="detail1" style="background-color: green"><a href="/login/DeleteTicketServlet?uid=${sessionScope.user.uid}&mid=${ticket.movid}&seat=${ticket.seat}" onclick="return confirm('期待您的下次光临,是否确认删除订单?')">我已观影</a></div></c:if>
                        <c:if test="${ticket.status==0}">
                            <div id="cancel"><a
                                    href="/login/DeleteTicketServlet?uid=${sessionScope.user.uid}&mid=${ticket.movid}&seat=${ticket.seat}"
                                    onclick="return confirm('是否确认取消订单?')">取消订单</a></div>
                        </c:if>
<%--                        <c:if test="${ticket.status==1}">--%>
<%--                            <div id="cancel" style="background-color: cornflowerblue;"><a style="font-size: 15px"--%>
<%--                                    href="#">请及时观影</a></div>--%>
<%--                        </c:if>--%>
                    </div>
                </td>
            </tr>
        </c:forEach>
    </table>

    <h2 style="position: absolute;right: 300px;margin: 30px 0 80px 0">订单总价格:<span style="color: red;font-size: 35px">${requestScope.sum}￥</span></h2>
    <h2 style="position: absolute;right: 300px;margin: 80px 0 80px 0;background-color: crimson;border-radius: 7px"><a href="/login/userjsp/payallmoney.jsp?uid=${sessionScope.user.uid}&money=${requestScope.sum}" style="color: white ;text-decoration: none">去支付</a></h2>
</div>
</body>
</html>
