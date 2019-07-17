<%--
  Created by IntelliJ IDEA.
  User: Water
  Date: 2019/7/17
  Time: 11:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/login3.css">

    <title>Title</title>

</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-offset-3 col-md-6">
            <form class="form-horizontal">
                <span class="heading">用户登录</span>
                <div class="form-group">
                    <input type="email" class="form-control" id="inputEmail3" placeholder="用户名">
                    <i class="fa fa-user"></i>
                </div>
                <div class="form-group help">
                    <input type="password" class="form-control" id="inputPassword3" placeholder="密　码">
                    <i class="fa fa-lock"></i>
                    <a href="#" class="fa fa-question-circle"></a>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-default">登录</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
