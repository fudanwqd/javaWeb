<%--
  Created by IntelliJ IDEA.
  User: Water
  Date: 2019/7/14
  Time: 13:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/bootstrapValidator.min.css">


    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/bootstrapValidator.min.js"></script>


    <title>添加用户</title>
</head>
<body >
<div class="container-fluid panel-body" style="padding-bottom:0px">
    <form class="form-horizontal" id="formAdd" action="#" method="post">

        <div class="panel panel-default" style="margin-bottom: 0px">
            <h4 class="panel panel-heading h4font">
                添加用户
                <small>（*星号是必填项）</small>
            </h4>

            <div class="panel-body">
                <div class="form-group">
                    <label class="col-sm-1 control-label"><span style="color: red;font-weight: bold">＊</span>用户名:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="name" placeholder="用户名" >
                    </div>
                    <label class="control-label">（输入类型是
                        字母、数字、下划线或它们的组合，最长16位）</label>
                </div>

                <div class="form-group">
                    <label class="col-sm-1 control-label"><span style="color: red;font-weight: bold">＊</span>密码:</label>
                    <div class="col-sm-4">
                        <input type="password" class="form-control" name="userName" placeholder="密码">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-1 control-label"><span style="color: red;font-weight: bold">＊</span>电子邮箱:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="userName" placeholder="电子邮箱">
                    </div>
                </div>
            </div>
        </div>

        <br>

        <div class="form-group">
            <div class="col-sm-offset-5 col-sm-1">
                <button type="submit" class="btn btn-primary"  href="Person.jsp">保 存</button>
            </div>

            <div class="col-sm-1">
                <a href="Person.jsp" class="btn btn-primary">返 回</a>
            </div>
        </div>
    </form>
</div>
</body>
</html>
