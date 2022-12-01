<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 家全
  Date: 2022/7/12
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="utf-8" %>
<html>
<head>
    <title>影片详情</title>
    <link rel="Shortcut Icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon"/>
    <style>
        body {
            padding: 0;
            margin: 0;

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

        #mid {
            width: 850px;
            margin: 0px auto;
            text-align: center;

        }

        #img img {
            width: 255px;
            height: 365px;
            border: 8px solid white;
        }

        #img {
            margin-right: 40px;

        }

        #img, #info {
            display: inline-block;
        }

        #big {
            background: url("${pageContext.request.contextPath}/img/showbk.jpg") no-repeat;
            background-size: 100% 100%;
            margin: 0 auto;
        }

        #price {
            font-size: 40px;
            color: #E56A2A;
        }

        #like {
            width: 140px;
            height: 45px;
            text-align: center;
            font-size: 24px;
            line-height: 45px;
        }

        #buy {
            width: 140px;
            height: 45px;
            text-align: center;
            font-size: 24px;
            line-height: 45px;
        }

        .cont {
            font-size: 22px;
            font-weight: 500;

        }

        #introduce {
            /*position: absolute;*/
            width: 600px;
            height: auto;
            /*left: 660px;*/
            /*top: 500px;*/
            margin: 0 auto;

        }

        #introduce p {
            font-size: 20px;
            text-indent: 2em;
            clear: both;
        }

        #comment {
            position: relative;
            width: 850px;
            margin: 20px auto;
            left: 124px;
        }

        #headerAndname img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: inline-block;

        }

        #headerAndname {
            height: 50px;
            line-height: 50px;

        }

        #name {
            height: 25px;
            padding: 0;
            margin: 0;
        }

        #time {
            height: 25px;
            padding: 0;
            margin: 0;
            display: inline-block;
        }

        #content {
            margin-top: 25px;
            margin-left: 60px;
        }

        textarea {
            width: 850px;
            height: 200px;
            font-size: 25px;
        }

        #submit {

            margin-bottom: 100px;
        }

        #submit input {
            width: 70px;
            height: 35px;
            text-align: center;
            font-size: 25px;
            margin-top: 20px;
        }

        #del {
            display: inline-block;
            margin-left: 20px;
        }
        #del a{
            background-color: crimson;
            display: inline-block;
            color: white;
            width: 48px;
            height: 25px;
            border-radius: 5px;
            text-decoration: none;
            line-height: 27px;
            text-align: center;
        }
    </style>
</head>
<body>
<nav>
    <ul>
        <li id="active"><a href="/login/HomeServlet">首页</a></li>
        <li><a href="/login/selectMyorderServlet?uid=${sessionScope.user.uid}">我的订单</a></li>
        <li><a
                <c:if test="${sessionScope.user!=null}">href="/login/SelectMyLoveMovieServlet?uid=${sessionScope.user.uid}"</c:if>
                <c:if test="${sessionScope.user==null}">href="/login/RemServlet" onclick="return alert('请您登入!')"</c:if>>我的收藏</a>
        </li>
        <li><a
                <c:if test="${sessionScope.user!=null}">href="/login/UserInfoServlet"</c:if>
                <c:if test="${sessionScope.user==null}">href="/login/RemServlet" onclick="return alert('请您登入!')"</c:if>>个人中心</a>
        </li>
        <li style="width: 400px">
            <form action="/login/UserSelectByNameServlet"><input type="text" id="input" name="mname" value="${requestScope.mname}">
                <input type="submit" id="sub" value="搜索"></form>
        </li>
    </ul>
</nav>
<div id="big">
    <div id="mid">
        <div id="img"><img src="${requestScope.movie.mimg}" title="${requestScope.movie.mname}"></div>
        <div id="info">
            <h1>${requestScope.movie.mname}</h1>
            <hr>
            <span>导演:</span>&nbsp;&nbsp;<span class="cont">${requestScope.movie.mpeople}</span><br><br>
            <span>价格:</span>&nbsp;&nbsp;<span id="price">￥${requestScope.movie.mprice}</span><br><br>
            <span>电影类型:</span>&nbsp;&nbsp;<span class="cont">${requestScope.movie.mclass}</span><br><br>
            <span>首映:</span>&nbsp;&nbsp;<span class="cont">${requestScope.movie.mtime}</span><br><br><br>
            <form>
                <input type="text" value="${requestScope.movie.id}" name="mid" hidden>
                <input type="text" value="${sessionScope.user.uid}" name="uid" hidden>
                <input type="submit" value="加入收藏" formmethod="get" id="like"
                       <c:if test="${sessionScope.user!=null}">formaction="/login/AddMyLoveMovieServlet"</c:if>
                       <c:if test="${sessionScope.user==null}">formaction="/login/RemServlet"
                       onclick="return alert('请您登入!')" </c:if>>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <input type="submit" value="购票" formmethod="get" id="buy"
                       <c:if test="${sessionScope.user!=null}">formaction="/login/selectTicketServlet"</c:if>
                       <c:if test="${sessionScope.user==null}">formaction="/login/RemServlet"
                       onclick="return alert('请您登入!')" </c:if>>
            </form>
            <br>
        </div>
    </div>
</div>
<div id="introduce">
    <h1 style="float: left">剧情简介</h1>
    <p>${requestScope.movie.mintroduce}</p>
</div>
<div id="comment">
    <h2>用户评论</h2>
    <c:choose>
        <c:when test="${requestScope.comments!=null}">
            <div>
                <c:forEach items="${requestScope.comments}" var="comment">
                    <div id="headerAndname"><img src="${comment.header}" alt="">&nbsp;&nbsp;
                        <div style="display: inline-block;line-height: 50px;height: 50px">
                            <div id="name">${comment.username}</div>
                            <div id="time">${comment.time}</div>

                        <c:if test="${comment.userid==sessionScope.user.uid}">
                            <div id="del"><a
                                    href="/login/DelMyCommentServlet?cid=${comment.cid}&mid=${requestScope.movie.id}"
                                    onclick="return confirm('是否确认删除该评论?')"
                            >删除</a></div>
                        </c:if>
                    </div>
                    </div>
                    <div id="content">${comment.content}</div>
                    <hr>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <div>
                <h2>暂无评论，快来抢沙发吧</h2>
            </div>
        </c:otherwise>
    </c:choose>
    <div id="submit">
        <span style="color: red;font-size: 25px">${error}</span>
        <form action="/login/AddCommentServlet" method="post">
            <textarea name="text"></textarea>
            <input type="text" value="${requestScope.movie.id}" hidden name="mid">
            <input type="text" value="${sessionScope.user.uid}" hidden name="uid"><br>
            <input type="submit" value="发表" style="margin-left: 410px">
        </form>
    </div>
</div>
<script>
    var errori = "${requestScope.error}"
    var row = "${requestScope.row}"
    var res = "${requestScope.result}"
    console.log(errori)
    if (errori == '请输入内容') {
        alert("请输入内容!");
    }
    if (row == "1") {
        alert("加入收藏成功!")
    } else if (row == "-1") {
        alert("您不能重复收藏该影片!")
    }
    if (res == '1') {
        alert("提交订单成功!")
    }

</script>

</body>
</html>
