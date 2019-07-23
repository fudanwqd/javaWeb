<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/font-awesome.css">
    <link rel="stylesheet" href="../css/AdminLTE.css">
    <script src="../js/bootstrap.js"></script>
    <script src="../js/adminlte.js"></script>
    <script src="../js/bootstrap-table.js"></script>
    <script src="../js/bootstrap-table-zh-CN.js"></script>
    <script src="../js/bootstrap-table-treegrid.js"></script>
    <script src="../js/jquery.treegrid.min.js"></script>
    <script src="../js/bootstrap-tab.js"></script>
    <script type="text/javascript" src="../js/swiper.min.js"></script>
    <script src="../js/login.js"></script>


    <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="../js/md5.js"></script>

    <title>添加用户</title>

    <script>
        function add() {
            if(isAlllegal()){
                let obj = document.getElementsByName("power");
                let power;
                for(let i=0; i<obj.length; i ++){
                    if(obj[i].checked){
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
<body >
<%
    String error = request.getParameter("error");
    if (error != null){
%>
<script>
    alert("该用户名已存在，请换一个！");
</script>
<%
    }
%>

<div class="container-fluid panel-body" style="padding-bottom:0px">

    <div class="panel panel-default" style="margin-bottom: 0px">
        <h4 class="panel panel-heading h4font">
            添加用户
        </h4>
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


        <label>
            <input type="radio" name="power" value="admin">
        </label>管理员
        <label>
            <input type="radio" name="power" value="user" checked="checked">
        </label>普通用户
        <text style="display: none" id="page">2</text>
        <br/>
        <button class="btn btn-primary btn-block" onclick="add()">确 定</button>
        <a href="/JSP/UserManage.jsp"><button class="btn btn-primary btn-block">返 回</button></a>
    </div>
</div>
</body>
</html>
