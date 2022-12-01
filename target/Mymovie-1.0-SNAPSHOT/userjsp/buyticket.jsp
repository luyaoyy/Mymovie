<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 家全
  Date: 2022/7/17
  Time: 9:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="utf-8" %>
<html>
<head>
    <title>购票中心</title>
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

        #subm {
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
        #out{
            width: 1200px;
            margin: 20px auto;
        }
        .d {
            display: inline-block;
            color: white;
            width: 30px;
            height: 25px;
            margin: 10px 10px;
            text-align: center;
            line-height: 20px;
            background-color: #B9DEA0;
            vertical-align: middle;
            border-radius: 4px;
        }

        .now {
            display: inline-block;
            width: 30px;
            height: 25px;
            color: white;
            margin: 10px 10px;
            text-align: center;
            line-height: 20px;
            background-color: red;
            vertical-align: middle;
            border-radius: 4px;
        }

        #seat {
            text-align: center;
            border-right: 1px solid;
            display: inline-block;
            padding-right: 50px;
        }

        h3 {
            display: inline-block;
            background-color: #F0F0F0;
            width: 400px;
            text-align: center;
            margin-left: 45px;
        }

        .d:hover {
            cursor: pointer;
        }

        .now:hover {
            cursor: not-allowed;
        }

        #buy {
            display: inline-block;
            margin-left: 50px;
        }

        #buy img {
            display: inline-block;
            width: 135px;
            height: 178px;
            vertical-align: middle;
        }

        #buy h2 {
            display: inline-block;
            padding: 0;
            margin: 0;
            margin-top: 20px;
        }

        #buy span {
            font-size: 20px;
        }

        select {
            font-size: 20px;
            width: 100px;

        }

        #sub {
            margin-top: 100px;
            margin-left: 50px;
        }

        #sub input {
            font-size: 22px;
        }
        .lie{
            display: inline-block;
            width: 30px;
            height: 25px;
            margin: 10px 10px;
            text-align: center;
            line-height: 20px;
            vertical-align: middle;
            border-radius: 4px;
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
                <input type="submit" id="subm" value="搜索" style="opacity:0.3"></form>
        </li>
    </ul>
</nav>
<div>
    <c:if test="${sessionScope.user!=null}">
        <div id="header"><img src="${sessionScope.user.header}"> 欢迎您!&nbsp;<span>${sessionScope.user.username}</span>&nbsp;&nbsp;<a
                href="/login/ZhuxiaoServlet">注销</a></div>
    </c:if>
    <c:if test="${sessionScope.user==null}">
        <div id="tourist"><a href="/login/RemServlet">请登入</a></div>
    </c:if>
</div>
<div id="out">
    <div id="seat">
        <h3>电影屏幕</h3><br>
        <div class="lie" style="margin-left: 58px">1</div>
        <div class="lie">2</div>
        <div class="lie">3</div>
        <div class="lie">4</div>
        <div class="lie">5</div>
        <div class="lie">6</div>
        <div class="lie">7</div>
        <div class="lie">8</div>
        <div class="lie">9</div>
        <div class="lie">10</div>
        <br>
        第一排
        <div class="d">1</div>
        <div class="d">2</div>
        <div class="d">3</div>
        <div class="d">4</div>
        <div class="d">5</div>
        <div class="d">6</div>
        <div class="d">7</div>
        <div class="d">8</div>
        <div class="d">9</div>
        <div class="d">10</div>
        <br>
        第二排
        <div class="d">11</div>
        <div class="d">12</div>
        <div class="d">13</div>
        <div class="d">14</div>
        <div class="d">15</div>
        <div class="d">16</div>
        <div class="d">17</div>
        <div class="d">18</div>
        <div class="d">19</div>
        <div class="d">20</div>
        <br>
        第三排
        <div class="d">21</div>
        <div class="d">22</div>
        <div class="d">23</div>
        <div class="d">24</div>
        <div class="d">25</div>
        <div class="d">26</div>
        <div class="d">27</div>
        <div class="d">28</div>
        <div class="d">29</div>
        <div class="d">30</div>
        <br>
        第四排
        <div class="d">31</div>
        <div class="d">32</div>
        <div class="d">33</div>
        <div class="d">34</div>
        <div class="d">35</div>
        <div class="d">36</div>
        <div class="d">37</div>
        <div class="d">38</div>
        <div class="d">39</div>
        <div class="d">40</div>
        <br>
        <div style="font-size: 20px;font-weight: bold">过道</div>
        第五排
        <div class="d">41</div>
        <div class="d">42</div>
        <div class="d">43</div>
        <div class="d">44</div>
        <div class="d">45</div>
        <div class="d">46</div>
        <div class="d">47</div>
        <div class="d">48</div>
        <div class="d">49</div>
        <div class="d">50</div>
        <br>
        第六排
        <div class="d">51</div>
        <div class="d">52</div>
        <div class="d">53</div>
        <div class="d">54</div>
        <div class="d">55</div>
        <div class="d">56</div>
        <div class="d">57</div>
        <div class="d">58</div>
        <div class="d">89</div>
        <div class="d">60</div>
        <br>
        第七排
        <div class="d">61</div>
        <div class="d">62</div>
        <div class="d">63</div>
        <div class="d">64</div>
        <div class="d">65</div>
        <div class="d">66</div>
        <div class="d">67</div>
        <div class="d">68</div>
        <div class="d">69</div>
        <div class="d">70</div>
        <br>
        第八排
        <div class="d">71</div>
        <div class="d">72</div>
        <div class="d">73</div>
        <div class="d">74</div>
        <div class="d">75</div>
        <div class="d">76</div>
        <div class="d">77</div>
        <div class="d">78</div>
        <div class="d">79</div>
        <div class="d">80</div>
        <br>
        第九排
        <div class="d">81</div>
        <div class="d">82</div>
        <div class="d">83</div>
        <div class="d">84</div>
        <div class="d">85</div>
        <div class="d">86</div>
        <div class="d">87</div>
        <div class="d">88</div>
        <div class="d">89</div>
        <div class="d">90</div>
        <br>
        第十排
        <div class="d">91</div>
        <div class="d">92</div>
        <div class="d">93</div>
        <div class="d">94</div>
        <div class="d">95</div>
        <div class="d">96</div>
        <div class="d">97</div>
        <div class="d">98</div>
        <div class="d">99</div>
        <div class="d">100</div>
        <div style="margin-top: 30px">
            <div class="d"></div>
            可选
            <div class="now"></div>
            已售出
        </div>
    </div>
    <div id="buy">
        <img src="${requestScope.movie.mimg}" alt="">
        <div style="display: inline-block ">
            <h2>${requestScope.movie.mname}</h2><br>
            类型:<span>${requestScope.movie.mclass}</span><br><br>
            票价:<span style="color: red;font-size: 22px">￥${requestScope.movie.mprice}/张</span><br>
        </div>
        <div style="margin: 80px 0 10px 0">
            <span>影院:星光影院</span><br>
            <span>版本:国语3D</span>
        </div>
        <div>
            <form action="/login/AddTrickServlet" method="get">
                <input type="text" value="${requestScope.movie.id}" hidden>
                <input name="tprice" value="${requestScope.movie.mprice}" hidden>
                <input name="mid" value="${requestScope.movie.id}" hidden>
                <input name="uid" value="${sessionScope.user.uid}" hidden>
                <div>可选放映厅:
                    <select name="room" style="width: 150px">
                        <option value="一号放映厅">一号放映厅</option>
                        <option value="二号放映厅">二号放映厅</option>
                        <option value="三号放映厅">三号放映厅</option>
                        <option value="四号放映厅">四号放映厅</option>
                    </select>
                </div>
                <br>
                <div><span style="color: red">场次:今天&nbsp;7月21日&nbsp;15:30</span><br><br>
                    <span>请选择位置:</span>&nbsp;
                    <select name="row">
                        <option value="1">一排</option>
                        <option value="2">二排</option>
                        <option value="3">三排</option>
                        <option value="4">四排</option>
                        <option value="5">五排</option>
                        <option value="6">六排</option>
                        <option value="7">七排</option>
                        <option value="8">八排</option>
                        <option value="9">九排</option>
                        <option value="10">十排</option>
                    </select>
                    <select name="col">
                        <option value="1">一列</option>
                        <option value="2">二列</option>
                        <option value="3">三列</option>
                        <option value="4">四列</option>
                        <option value="5">五列</option>
                        <option value="6">六列</option>
                        <option value="7">七列</option>
                        <option value="8">八列</option>
                        <option value="9">九列</option>
                        <option value="10">十列</option>
                    </select>
                </div>
                <div id="sub">
                    <input type="submit" value="提交订单">
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    var ds = document.querySelectorAll(".d")
    <c:forEach items="${tickets}" var="ticket">
    ds[${ticket.seat}-1].className = 'now'
    </c:forEach>
</script>
<script>
    var error=${requestScope.error};
    if(error=='-1')
        alert("该位置已经有人啦!请重新选择位置")
</script>
</body>
</html>
