<%--
  Created by IntelliJ IDEA.
  User: Water
  Date: 2019/7/14
  Time: 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en"
      xmlns="http://www.w3.org/1999/xhtml"
>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/bootstrapValidator.min.js"></script>

    <title>用户管理</title>
    <style>
        .divBorder{
            border: solid 1px rgba(12,24,255,0.15);
            padding-top: 15px;
            padding-bottom: 15px;
            margin-top: 5px;
            border-radius: 5px;
        }
        .left20{
            margin-left: 15px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="divBorder">
        <div class="form-inline">
            <div class="input-group">
                <a href="addUser.jsp" class="btn left20" role="button">
                    <span class=" glyphicon glyphicon-plus" aria-hidden="true" style="margin-right: 5px"></span>添 加</a>
            </div>
        </div>
        <div>
            <table class="table table-hover table-striped table-bordered text-center">
                <thead>
                <tr class="info">
                    <th>用户ID</th>
                    <th>用户身份</th>
                    <th>用户名</th>
                    <th>邮箱</th>
                    <th>最近登录</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <tr >
                    <td>1</td>
                    <td>用户</td>
                    <td>张三</td>
                    <td>zhangsan@126.com</td>
                    <td>2018-01-01 13:00</td>
                    <td>
                        <a href="#" class="btn left20" role="button">
                        <span class=" glyphicon glyphicon-edit" aria-hidden="true" style="margin-right: 5px"></span>修改用户身份</a>
                        <a href="#" class="btn left20" role="button">
                            <span class="glyphicon glyphicon-minus" aria-hidden="true" style="margin-right: 5px"></span>删 除</a>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>
