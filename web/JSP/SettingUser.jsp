<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/bootstrapValidator.min.css">


    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/bootstrapValidator.min.js"></script>
    <title>修改信息</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="container-fluid panel-body" style="padding-bottom:0px">
    <form class="form-horizontal" id="formAdd" action="/setUser" method="post">
        <div class="panel panel-default" style="margin-bottom: 0px">
            <h4 class="panel panel-heading h4font">
                修改个人信息
            </h4>

            <div class="panel-body">
                <div class="form-group">
                    <label class="col-sm-1 control-label">用户名:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="name" placeholder="" >
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-1 control-label">邮箱:</label>
                    <div class="col-sm-4">
                        <input type="email" class="form-control" name="emailAddress" placeholder="">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-1 control-label">个性签名:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="signature" placeholder="">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">验证密码(密码正确才能修改其他信息):</label>
                    <div class="col-sm-4">
                        <input type="password" class="form-control" name="password" placeholder="">
                    </div>
                </div>
            </div>
        </div>
        <br>
        <div class="form-group">
            <div class="col-sm-offset-5 col-sm-1">
                <button type="submit" class="btn btn-primary" href="Person.jsp" >保 存</button>
            </div>
            <div class="col-sm-1">
                <a href="User.jsp" class="btn btn-primary">返 回</a>
            </div>
        </div>
    </form>
</div>
</body>
</html>
