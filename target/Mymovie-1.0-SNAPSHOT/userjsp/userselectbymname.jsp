<%--
  Created by IntelliJ IDEA.
  User: 家全
  Date: 2022/7/16
  Time: 11:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>搜索结果</title>
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


        #head img {
            width: 140px;
            height: 140px;
        }

        #tourist {
            position: absolute;
            right: 80px;
            top: 4px;
            font-size: 20px;
        }

        #tourist a {
            color: black;
        }

        #header img {
            display: inline-block;
            border-radius: 50%;
            width: 50px;
            height: 50px;
            margin-right: 10px;
            border: 2px solid black;
        }

        #header {
            width: 340px;
            height: 45px;
            position: absolute;
            right: 0;
            top: 0;
            margin-left: 20px;
            text-align: right;
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
            box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
            /* 阴影 */
            border-collapse: collapse;
            /* 取消表格边框 */
            letter-spacing: 1px;
            /* 文字缩进 */
        }

        table,
        th,
        tr,
        td {
            border-bottom: 1px solid #dedede;
            /* 表格横线 */
            padding: 15px;
            text-align: center;
        }

        th {
            font-size: 18px;
        }

        .result {
            font-size: 28px;
            color: red;
            font-weight: bolder;

        }

        #bottom {
            width: 400px;
            margin: 10px auto;
            font-size: 23px;
        }

        #num {
            margin: 30px auto;
            font-size: 25px;
            width: 500px;
            margin: 30px auto;
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

        #warn li {
            text-align: left;
            font-size: 20px;
        }

        #warn {
            width: 500px;
            margin: 0 auto;
        }

        h1 {
            width: 500px;
            margin: 0 auto;
        }
    </style>
</head>
<body>
<nav>
    <ul>
        <li><a href="/login/HomeServlet">首页</a></li>
        <li><a href="/login/selectMyorderServlet?uid=${sessionScope.user.uid}">我的订单</a></li>
        <li><a href="/login/SelectMyLoveMovieServlet?uid=${sessionScope.user.uid}">我的收藏</a></li>
        <li id="active"><a href="/login/UserInfoServlet">个人中心</a></li>
        <li style="width: 400px">
            <form action=""><input type="text" id="input" name="mname" value="${requestScope.mname}" style="opacity:0.3" placeholder="请输入要查询影片关键字" >
                <input type="submit" id="sub" value="搜索" style="opacity:0.3"></form>
        </li>
    </ul>
</nav>
<c:if test="${requestScope.movies.size()!=0&&requestScope.movies!=null}">
    <div id="num">以下为您找到与"<span class="result">${requestScope.mname}</span>"相关的影片有<span
            class="result">${requestScope.moviess.size()}</span>条
    </div>
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
                <td><img src="${movie.mimg}" width="120px"></td>
                <td>${movie.mname}</td>
                <td>${movie.mclass}</td>
                <td>${movie.mpeople}</td>
                <td>${movie.mnation}</td>
                <td>￥${movie.mprice}</td>
                <td>${movie.mtime}</td>
                <td>${movie.mgrade}</td>
                <td style="width: 120px">
                    <div id="buy"><a href="/login/ShowMovieServlet?mid=${movie.id}">购票</a></div>
                </td>
            </tr>
        </c:forEach>
    </table>
    <div id="bottom">
        <span>当前第${requestScope.pageResult.pageIndex}页/共${requestScope.pageResult.pageNum}页</span>
            <%--        <a href="/XinyuProject02/jsp/newsList.jsp?pageIndex=${pageResult.pageIndex-1}"<c:if test="${pageResult.pageIndex==1}">style="pointer-events: none;"</c:if>>上一页</a>--%>
        <c:choose>
            <c:when test="${requestScope.pageResult.pageIndex==1}">
                <a>上一页</a>
            </c:when>
            <c:otherwise>
                <a href="/login/UserSelectByNameServlet?pageIndex=${requestScope.pageResult.pageIndex-1}&mname=${requestScope.mname}">上一页</a>
            </c:otherwise>
        </c:choose>

        <c:forEach begin="1" end="${requestScope.pageResult.pageNum}" varStatus="status">
            <a href="/login/UserSelectByNameServlet?pageIndex=${status.index}&mname=${requestScope.mname}">${status.index}</a>
        </c:forEach>
            <%--        <a href="/XinyuProject02/jsp/newsList.jsp?pageIndex=${pageResult.pageIndex+1}" <c:if test="${pageResult.pageIndex==pageResult.pageNum}">style="pointer-events: none;"</c:if>>下一页</a>--%>
        <c:choose>
            <c:when test="${requestScope.pageResult.pageIndex==requestScope.pageResult.pageNum}">
                <a>下一页</a>
            </c:when>
            <c:otherwise>
                <a href="/login/UserSelectByNameServlet?pageIndex=${requestScope.pageResult.pageIndex+1}&mname=${requestScope.mname}">下一页</a>
            </c:otherwise>
        </c:choose>
    </div>
</c:if>
<c:if test="${requestScope.movies.size()==0||requestScope.movies==null}">
    <h1>很抱歉，没找到相关的影视剧</h1>
    <ul id="warn">
        <li><span style="color: red;font-size: 22px">建议您:</span></li>
        <li>1.请检查输入的关键词是否有误</li>
        <li>2.请缩短关键词</li>
    </ul>
</c:if>
</body>
</html>
