<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" pageEncoding="utf-8" %>
<meta http-equiv='Content-Security-Policy' content='block-all-mixed-content'>

<html>
<script type="" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
<script type="" src="${pageContext.request.contextPath}/js/uploadjs.jsp"></script>
<title>用户注册</title>
<link rel="Shortcut Icon" href="${pageContext.request.contextPath}/img/favicon.ico" type="image/x-icon"/>
<style>
    body {
        background: url("${pageContext.request.contextPath}/img/regist.jpg") no-repeat;
        background-attachment: fixed;
        background-size: 100% 100%;
        opacity: 0.7;
    }

    #out {
        position: relative;
        top: 130px;
        width: 550px;
        height: 450px;
        margin: 0 auto;
        text-align: center;
        background-color: rgba(58, 37, 64, 0.7);
        border-radius: 20px;
        box-shadow: 5px 5px 50px 15px rgba(0, 255, 235, 0.3);
    }

    #form_title {
        padding: 0;
        font-size: 35px;
        color: white;
        font-weight: 800;
        margin-bottom: 55px;
    }

    #name input {
        border: none;
        border-bottom: 2px solid white;
        font-size: 23px;
        background-color: transparent;
        color: white;
    }

    .password input {
        border: none;
        border-bottom: 2px solid white;
        font-size: 23px;
        background-color: transparent;
        color: white;
    }

    input:focus {
        outline: none;
    }

    #name {
        margin: 10px 0 30px 0;
    }

    .password {
        margin: 10px 0 30px 0;
    }

    #sub {
        width: 170px;
        height: 40px;
        opacity: 0.7;
        border-radius: 15px;
        background: linear-gradient(to right, #ADBAF3, #E6818B);
        font-size: 17px;
        font-weight: bolder;
    }

    #rem a {
        display: inline-block;
        text-decoration: none;
        color: black;
        margin-left: 75px;
    }

    strong {
        color: red;
    }

    #log {
        margin: 0 auto;
        margin-top: 25px;
        width: 190px;
        height: 60px;
        font-size: 25px;
    }
    #form{
        text-align: center;
    }
    form{
        text-align: center;
    }


    #reg input {
        width: 170px;
        height: 40px;
        opacity: 0.7;
        border-radius: 15px;
        background: linear-gradient(to right, #ADBAF3, #E6818B);
        font-size: 17px;
        font-weight: bolder;
    }

    #change input {
        width: 170px;
        height: 40px;
        opacity: 0.7;
        border-radius: 15px;
        background: linear-gradient(to right, #ADBAF3, #E6818B);
        font-size: 17px;
        font-weight: bolder;
    }

    #error {
        color: red;
    }

    #sel {
        width: 160px;
        height: 32px;
        font-size: 21px;
        background-color: transparent;
        color: white;
    }
    .op{
        background-color: #252437;
        color: white;
    }
    #head{
        width: 180px;
        height: 180px;
        text-align: center;
        vertical-align: middle;
        border: 2px solid white;
        position: absolute;
        right: -210px;
        top: 80px;

    }
    #head img{
        width: 180px;
        height: 180px;
        opacity: 1;
    }
    #msg{
        color: red;
    }
    select{
        width: 60px;
        height: 35px;
    }
</style>
<script>
    $(function () {
        var boo=false;
        // 失去焦点事件
        $("#username").blur(function () {
            if($(this).val()==""){
                $("#msg").text("用户名不能为空");
                $("#msg").css({color:"red"});
                boo=false;
            }else{
                //发送异步请求，判断用户名是否存在
                $.ajax({
                    url:"http://localhost:8080/login/CheckUserNameServlet",
                    data:{"username":$("#username").val()},
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
            }
        });
        $("#repwd").blur(function () {
                //发送异步请求，判断用户名是否存在
                $.ajax({
                    url:"http://localhost:8080/login/CheckPwdServlet",
                    data:{"pwd":$("#pwd").val(),"repwd":$("#repwd").val()},
                    type:"get",
                    dataType:"json",
                    success:function (resp) {
                        console.log(resp);
                        if(resp.success==false){
                            $("#msg1").text(resp.message);
                            $("#msg1").css({color:"red"});
                            boo=false;
                        }else{
                            $("#msg1").text(resp.message);
                            $("#msg1").css({color:"green"});
                            boo=true;
                        }
                    },
                });
        });
        $("form").submit(function(){
            if(boo==false){
                alert("输入信息有误");
                return false; //阻止默认事件
            }
        });
    });
</script>
<body>
<div id="big">
    <div id="out">
        <p id="form_title">用户注册</p>
        <div id="form">
            <form action="/login/UploadUserServlet" method="post" enctype="multipart/form-data">
                <div style="display: inline-block;text-align: left">
                    <div id="name"><input type="text" placeholder="请输入用户名" name="username" id="username"><span id="msg"></span></div>
                    <div class="password"><input type="password" placeholder="请输入密码" name="password" id="pwd"></div>
                    <div class="password"><input type="password" placeholder="请再次输入密码" name="repassword" id="repwd"></div><span id="msg1"></span>
                    <div style="width: 295px;text-align: left;margin:0 auto;">
                        <select name="gender" id="sel">
                            <option selected value="1" class="op">请选择性别</option>
                            <option value="1" class="op">男</option>
                            <option value="2" class="op">女</option>
                        </select>
                    </div>
                </div>
                <input id="userface" type="file" onchange="preview(this)" name="header" hidden> <br/>

                <div id="log"><input type="submit" id="sub" value="确认注册"></div>
            </form>
        </div>
        <label for="userface">
            <div id="head">
                <img src="" alt="" id="ImgPr">
                <span style="font-size: 20px;color: white">请选择头像</span>
            </div>
        </label>

    </div>
</div>
<script>
    $("#userface").uploadPreview({Img: "ImgPr", Width: 120, Height: 120});
</script>
</body>
</html>


