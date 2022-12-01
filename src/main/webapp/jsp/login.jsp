<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" pageEncoding="utf-8" %>
<meta http-equiv='Content-Security-Policy' content='block-all-mixed-content'>
<html>
<head>
    <title>欢迎光临星光影院</title>
    <link rel="Shortcut Icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon"/>
    <style>

        * {
            /* 初始化 */
            margin: 0;
            padding: 0;
        }

        body {
            /* 100%窗口高度 */
            height: 100vh;
            /* 弹性布局 水平+垂直居中 */
            display: flex;
            justify-content: center;
            align-items: center;
            /* 渐变背景 */
            background: linear-gradient(200deg, #f3e7e9, #e3eeff);
        }

        .container {
            background-color: #fff;
            width: 750px;
            height: 515px;
            border-radius: 5px;
            /* 阴影 */
            box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.1);
            /* 相对定位 */
            position: relative;
        }

        .form-box {
            /* 绝对定位 */
            position: absolute;
            top: -5%;
            left: 0%;
            background-color: #d3b7d8;
            width: 420px;
            height: 570px;
            border-radius: 5px;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 2;
            /* 动画过渡 加速后减速 */
            transition: 0.5s ease-in-out;
        }

        .register-box,
        .login-box {
            /* 弹性布局 垂直排列 */
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
            text-align: center;
        }

        .hidden {
            display: none;
            transition: 0.5s;
        }

        h1 {
            text-align: center;
            margin-bottom: 25px;
            /* 大写 */
            text-transform: uppercase;
            color: #fff;
            /* 字间距 */
            letter-spacing: 5px;
        }

        input {
            background-color: transparent;
            width: 70%;
            color: #fff;
            border: none;
            /* 下边框样式 */
            border-bottom: 1px solid rgba(255, 255, 255, 0.4);
            padding: 10px 0;
            text-indent: 10px;
            margin: 8px 0;
            font-size: 14px;
            letter-spacing: 2px;
        }

        input::placeholder {
            color: #fff;
        }

        input:focus {
            color: #a262ad;
            outline: none;
            border-bottom: 1px solid #a262ad80;
            transition: 0.5s;
        }

        input:focus::placeholder {
            opacity: 0;
        }

        .form-box button {
            width: 70%;
            margin-top: 35px;
            background-color: #f6f6f6;
            outline: none;
            border-radius: 8px;
            padding: 13px;
            color: #a262ad;
            letter-spacing: 2px;
            border: none;
            cursor: pointer;
        }

        .form-box button:hover {
            background-color: #a262ad;
            color: #f6f6f6;
            transition: background-color 0.5s ease;
        }

        .con-box {
            width: 50%;
            /* 弹性布局 垂直排列 居中 */
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            /* 绝对定位 居中 */
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
        }

        .con-box.left {
            left: -2%;
        }

        .con-box.right {
            right: -2%;
        }

        .con-box h2 {
            color: #8e9aaf;
            font-size: 25px;
            font-weight: bold;
            letter-spacing: 3px;
            text-align: center;
            margin-bottom: 4px;
        }

        .con-box p {
            font-size: 12px;
            letter-spacing: 2px;
            color: #8e9aaf;
            text-align: center;
        }

        .con-box span {
            color: #d3b7d8;
        }

        .con-box img {
            width: 150px;
            height: 150px;
            opacity: 0.9;
            margin: 40px 0;
        }

        .con-box button {
            margin-top: 3%;
            background-color: #fff;
            color: #a262ad;
            border: 1px solid #d3b7d8;
            padding: 6px 10px;
            border-radius: 5px;
            letter-spacing: 1px;
            outline: none;
            cursor: pointer;
        }

        .con-box button:hover {
            background-color: #d3b7d8;
            color: #fff;
        }

        .rem {
            width: 150px;
            margin-left: 50px;
        }
        img{
            border-radius: 50%;
        }
        .error{
            color: red;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="form-box">
        <!-- 注册 -->
        <div class="register-box hidden">
            <h1>管理员登入</h1>
            <form>
                <input type="text"  placeholder="用户名" name="aname" value="${aname}">
                <input type="password"  placeholder="密码" name="apwd" value="${apwd}">
                <div class="rem"><input type="checkbox" style="width: 20px;height: 20px;margin-right: 10px;"
                                        name="aremember" ${aremember == "on"?"checked":""}> <span>记住密码</span></div>
                <div class="error"><strong>${error2}</strong></div>
                <button type="submit" formaction="/login/LoginServlet" formmethod="post">登入</button>
            </form>
        </div>
        <!-- 登录 -->
        <div class="login-box">
            <h1>用户登入</h1>
            <form>
                <input type="text"  placeholder="用户名" name="uname" value="${uname}">
                <input type="password"  placeholder="密码" name="pwd" value="${pwd}">
                <div class="rem"><input type="checkbox" style="width: 20px;height: 20px;margin-right: 10px; "
                                        name="remember"
                ${remember == "on"?"checked":""}> <span>记住密码</span></div>
                <div class="error"><strong>${error1}</strong></div>
                <button formaction="/login/UserLoginServlet" formmethod="post">登入</button>
                <button name="register" formaction="/login/userjsp/uploaduser.jsp" formmethod="post">没有账号?点击注册</button>
                <button formaction="/login/TouristLoginServlet" formmethod="post"> 游客登入</button>
            </form>
        </div>
    </div>
    <div class="con-box left">
        <h2>欢迎来到<span>星光影院</span></h2>
        <img src="${pageContext.request.contextPath}/img/logn.jpg" >
        <p>请选择身份</p>
        <button id="login">我是用户</button>
    </div>
    <div class="con-box right">
        <h2>欢迎来到<span>星光影院</span></h2>
        <img src="${pageContext.request.contextPath}/img/star1.jpeg">
        <p>请选择身份</p>
        <button id="register">我是管理员</button>
    </div>
</div>
<script>
    // 要操作到的元素
    let login = document.getElementById('login');
    let register = document.getElementById('register');
    let form_box = document.getElementsByClassName('form-box')[0];
    let register_box = document.getElementsByClassName('register-box')[0];
    let login_box = document.getElementsByClassName('login-box')[0];
    // 去注册按钮点击事件
    register.addEventListener('click', () => {
        form_box.style.transform = 'translateX(80%)';
        login_box.classList.add('hidden');
        register_box.classList.remove('hidden');
    })
    // 去登录按钮点击事件
    login.addEventListener('click', () => {
        form_box.style.transform = 'translateX(0%)';
        register_box.classList.add('hidden');
        login_box.classList.remove('hidden');
    })
</script>
</body>
</html>

