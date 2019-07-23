<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>用户注册</title>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <style>
        .container{
            display:table;
            height:100%;
        }

        .row{
            display: table-cell;
            vertical-align: middle;
        }

        .row-centered {
            text-align:center;
        }
        .col-centered {
            display:inline-block;
            float:none;
            text-align:left;
            margin-right:-4px;
        }
    </style>


    <script type="text/javascript" src="../js/login.js"></script>
    <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="../js/md5.js"></script>
    <script>
        function login() {
            if(isAlllegal()&&isCodeLegal()){
                let obj = document.getElementsByName("power");
                let power;
                for (let i = 0; i < obj.length; i++) {
                    if (obj[i].checked) {
                        power = obj[i].value;
                        break;
                    }
                }
                let password = document.getElementById("password");
                let realPassword = hex_md5(password.value);

                window.location.href = "/login?name=" + document.getElementById("userName").value + "&password=" +
                    realPassword +
                    "&email=" + document.getElementById("emailAddress").value + "&power=" + power + "&page=" + document.getElementById("page").innerText;
            }
        }
    </script>

</head>

<body>

<%
    if (request.getParameter("error") != null){
%>
    <script>
        alert("该用户名已存在，请换一个！");
    </script>

<%
    }
%>

<div class="container">
    <div class="row row-centered">
        <div class="col-md-6 col-centered">
            <h2 style="text-align: center">用户注册</h2>
                <div class="input-group input-group-md">
                    <span class="input-group-addon" id="sizing-addon1"></span>
                    <label for="userName"></label><input type="text" class="form-control" id="userName" name="userName" placeholder="请输入用户名">
                </div>
                <p id="nameNull" style="display: none;">用户名不能为空</p>
                <p id="nameLength" style="display: none;">用户名长度应在4到15之间（包含4和15）</p>

                <div class="input-group input-group-md">
                    <span class="input-group-addon" id="sizing-addon2"></span>
                    <label for="password"></label><input type="password" class="form-control" id="password" name="password" placeholder="请输入密码"/>
                </div>
                <p id="passwordError" style="display: none;">密码必须包含数字和大小写字母</p>
                <p id="passwordLength" style="display: none;">密码长度应在6到10之间（包含6和10）</p>
                <p id="passwordNull" style="display: none;">密码不能为空</p>

                <div class="input-group input-group-md">
                    <span class="input-group-addon" id="sizing-addon3"><i class="glyphicon glyphicon-lock"></i></span>
                    <label for="rePassword"></label><input type="password" class="form-control" id="rePassword" name="rePassword" placeholder="确定密码"/>
                </div>
                <p id="rePasswordError" style="display: none;">两次密码不一致</p>

                <div class="input-group input-group-md">
                    <span class="input-group-addon" id="sizing-addon4"><i class="glyphicon glyphicon-envelope"></i></span>
                    <label for="emailAddress"></label><input type="email" class="form-control" id="emailAddress" name="emailAddress" placeholder="请输入邮箱"/>
                </div>
                <p id="emailError" style="display: none">邮箱格式错误</p>
                <p id="emailNull" style="display: none">邮箱不能为空</p>

                <div class="input-group input-group-md">
                    <span class="input-group-addon" id="sizing-addon5"><i class="glyphicon glyphicon-star"></i></span>
                    <label for="verifyCode"></label><input type="text" class="form-control" id="verifyCode" name="verifyCode" placeholder="验证码"/>
                </div>
                <p id="code">9999</p><button  onclick="change()">改变验证码</button>
                <p id="codeError" style="display: none;">验证码错误</p>
                <p id="codeNull" style="display: none;">验证码不能为空</p>

                <label>
                    <input type="radio" name="power" value="admin">
                </label>管理员
            <label>
                <input type="radio" name="power" value="user" checked="checked">
            </label>普通用户
            <text style="display: none" id="page">1</text>
                <br/>
                <button class="btn btn-primary btn-block" onclick="login()">注 册</button>
        </div>
    </div>
</div>



</body>
</html>
