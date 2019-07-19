<%--
  Created by IntelliJ IDEA.
  User: Water
  Date: 2019/7/17
  Time: 18:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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


</head>

<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="container">
    <div class="row row-centered">
        <div class="col-md-6 col-centered">
            <h2 style="text-align: center">用户注册</h2>
            <form action="/login" method="post" role="form" name="login">
                <div class="input-group input-group-md">
                    <span class="input-group-addon" id="sizing-addon1"><i class="glyphicon glyphicon-user" aria-hidden="true"></i></span>
                    <input type="text" class="form-control" id="userName" name="userName" placeholder="请输入用户名"/>
                </div>
                <text id="nameError">用户名长度4至15位，包含4和15</text>

                <div class="input-group input-group-md">
                    <span class="input-group-addon" id="sizing-addon2"><i class="glyphicon glyphicon-lock"></i></span>
                    <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码"/>
                </div>
                <text>密码必须包含数字和大小写字母，长度6至10位，包含6和10</text>
                <div class="input-group input-group-md">
                    <span class="input-group-addon" id="sizing-addon3"><i class="glyphicon glyphicon-lock"></i></span>
                    <input type="password" class="form-control" id="rePassword" name="rePassword" placeholder="确定密码"/>
                </div>

                <div class="input-tip">
                    <i class="i-status">请再次输入密码</i>
                    <span class="tip"></span>
                </div>

                <div class="input-group input-group-md">
                    <span class="input-group-addon" id="sizing-addon4"><i class="glyphicon glyphicon-envelope"></i></span>
                    <input type="text" class="form-control" id="emailAddress" name="emailAddress" placeholder="请输入邮箱"/>
                </div>
                <div class="input-group input-group-md">
                    <span class="input-group-addon" id="sizing-addon5"><i class="glyphicon glyphicon-star"></i></span>
                    <input type="text"  class="form-control" id="verifyCode" name="verifyCode" placeholder="验证码"/>
                </div>
                <img class="verifyImage center-block"  height="30" alt="验证码"
                     onclick="this.src='/defaultKaptcha?d='+new Date()*1" src="img/1.png">

                <label>
                    <input type="checkbox" name="power">
                </label>管理员
                <br/>
                <button type="submit" class="btn btn-primary btn-block">注 册</button>
            </form>
        </div>
    </div>
</div>

<script src="../js/register.js"></script>


<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
