<%--
  Created by IntelliJ IDEA.
  User: 家全
  Date: 2022/7/30
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="utf-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<img src="${pageContext.request.contextPath}/${sessionScope.user.header}">
</body>
</html>
