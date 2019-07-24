
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>

    <link rel="stylesheet" href="../css/bootstrap.css">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/md5.js"></script>
    <script src="../js/signUp.js"></script>



    <script>
        function signUp() {
            let page = document.referrer;

            let password = document.getElementById("password");
            let realPassword = hex_md5(password.value);

            if (isNameLegal() && isPasswordLegal()) {
                if (document.getElementById("userName").value === "Admin"){
                    window.location.href="/signUp?name="+document.getElementById("userName").value+"&password="+
                        password.value + "&page=" + page;
                } else {
                    window.location.href="/signUp?name="+document.getElementById("userName").value+"&password="+
                        realPassword+"&page=" + page;
                }

            }else {
                show("error");
            }
        }
    </script>

    <title>用户登录</title>
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




    <%
        String error = request.getParameter("error");
        if (error != null){
    %>
    <script>
        alert("用户名或密码错误！");
    </script>
    <%
        }
    %>

</head>
<body>



<div class="container">
    <div class="row row-centered">
        <div class="col-md-6 col-centered">
            <h2 style="text-align: center">欢迎登录</h2>
                <div class="input-group input-group-md">
                    <span class="input-group-addon" id="sizing-addon1"><i class="glyphicon glyphicon-user" aria-hidden="true"></i></span>
                    <label for="userName"></label><input type="text" class="form-control" id="userName" name="userName" placeholder="请输入用户名"/>
                </div>
                <div class="input-group input-group-md">
                    <span class="input-group-addon" id="sizing-addon2"><i class="glyphicon glyphicon-lock"></i></span>
                    <label for="password"></label><input type="password" class="form-control" id="password" name="password" placeholder="请输入密码"/>
                </div>
                <br/>
                <text id="error" style="display: none">用户名或密码不能为空</text>
                <button type="submit" class="btn btn-primary btn-block" onclick="signUp()">登 录</button>
        </div>
    </div>
</div>


</body>
</html>
