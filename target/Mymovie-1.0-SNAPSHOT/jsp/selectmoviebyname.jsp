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
    <title>主页</title>
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

        #p2 strong {
            color: red;
            font-weight: bold;
            margin-right: 15px;
        }

        td {
            text-align: center;
        }

        img {
            width: 139px;
            height: 193px;
            box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
        }

        #ahead {
            position: absolute;
            width: 60px;
            height: 60px;
            border-radius: 50%;
            right: 200px;
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

        #edit, #dele {
            display: inline-block;
        }

        #edit {
            width: 50px;
            float: left;
            border: 1px solid #d06e6e;
            border-radius: 10px;
            background-color: #d06e6e;
        }

        #dele {
            float: right;
            width: 50px;
            border: 1px solid #d06e6e;
            border-radius: 10px;
            background-color: #d06e6e;
        }

        #edit a {
            font-size: 18px;
            color: white;
            text-decoration: none;
        }

        #dele a {
            font-size: 18px;
            color: white;
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

        .bar6 {
            margin: 20px auto;
        }

        .bar6 input {
            border: 2px solid #c5464a;
            border-radius: 5px;
            background: transparent;
            width: 400px;
            height: 40px;
            top: 0;
            right: 0;
        }

        .bar6 button {
            background: #c5464a;
            border-radius: 0 5px 5px 0;
            width: 80px;
            height: 40px;
            top: 0;
            right: 0;
        }

        .bar6 button:before {
            content: "搜索";
            font-size: 13px;
            color: #F9F0DA;
        }
        .result{
            font-size: 28px;
            color: red;
            font-weight: bolder;
        }
        #pagenum {
            width: 30px;
            height: 30px;
            margin: 0 10px;
            font-size: 17px;
            border: none;
            border-bottom: 1px solid;
        }
        #pagenum:focus{
            outline: none;
        }
    </style>
</head>
<%
    String mid_str = request.getParameter("mid");
    if (mid_str != null) {
        MovieServiceImpl movieService = new MovieServiceImpl();
        int row = movieService.deletemovieByid(Integer.valueOf(mid_str));
        if (row > 0) {
            session.setAttribute("movies", movieService.queryAllMovie());
            response.sendRedirect("/login/H1Servlet");
        }
    }
%>
<body>
<div style="height: 60px">
    <div id="top">
        <p id="p1">影院后台管理系统Admin</p>
        <a href="/login/H4Servlet"><img src="${sessionScope.admin.aheader}" alt="" id="ahead"></a>
        <p id="p2">欢迎您!&nbsp;<strong>${sessionScope.admin.aname}</strong> &nbsp;&nbsp;<a href="/login/RemServlet"
                                                                                         style="color: black">注销</a></p>
    </div>
</div>
<div id="left">
    <ul>
        <li id="active"><a href="/login/H1Servlet">影片管理</a></li>
        <li><a href="/login/H2Servlet">类别管理</a></li>
        <li><a href="/login/H3Servlet">用户管理</a></li>
        <li><a href="/login/H4Servlet">个人中心</a></li>
    </ul>
</div>
<div id="right">
    <div class="search bar6">
        <form action="/login/SelectMovieByNameServlet" method="get">
            <input type="text" placeholder="请输入您要搜索的内容..." name="mname" value="${requestScope.mname}" id="mname">
            <button type="submit" id="a"></button>
        </form>
    </div>
    <c:if test="${requestScope.movies.size()!=0&&requestScope.movies!=null}">
        <div style="margin: 30px auto;font-size: 25px">以下为您找到与"<span class="result">${requestScope.mname}</span>"相关的影片有<span class="result">${requestScope.moviess.size()}</span>条</div>
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
                        <div>
                            <div id="edit"><a href="/login/EditMovieGetMovieServlet?id=${movie.id}">编辑</a></div>
                            <div id="dele"><a href="/login/jsp/selectmoviebyname.jsp?mid=${movie.id}"
                                              onclick="return confirm('是否确认将此电影下架?')">下架</a></div>
                        </div>
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
                    <label for="a"><a href="/login/SelectMovieByNameServlet?pageIndex=${requestScope.pageResult.pageIndex-1}&mname=${requestScope.mname}" >上一页</a></label>
                </c:otherwise>
            </c:choose>

            <c:forEach begin="1" end="${requestScope.pageResult.pageNum}" varStatus="status">
                <a href="/login/SelectMovieByNameServlet?pageIndex=${status.index}&mname=${requestScope.mname}">${status.index}</a>
            </c:forEach>
                <%--        <a href="/XinyuProject02/jsp/newsList.jsp?pageIndex=${pageResult.pageIndex+1}" <c:if test="${pageResult.pageIndex==pageResult.pageNum}">style="pointer-events: none;"</c:if>>下一页</a>--%>
            <c:choose>
                <c:when test="${requestScope.pageResult.pageIndex==requestScope.pageResult.pageNum}">
                    <a>下一页</a>
                </c:when>
                <c:otherwise>
                    <label for="a"><a href="/login/SelectMovieByNameServlet?pageIndex=${requestScope.pageResult.pageIndex+1}&mname=${requestScope.mname}">下一页</a></label>
                </c:otherwise>
            </c:choose>
            <form action="/login/SelectMovieByNameServlet" method="get">
                <input type="text" value="${requestScope.mname}" hidden name="mname">
                跳到第<input type="text" name="pageIndex" id="pagenum">页&nbsp;&nbsp;
                <input type="submit" value="确认" style="font-size: 20px">
            </form>
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
</div>
</body>
</html>
