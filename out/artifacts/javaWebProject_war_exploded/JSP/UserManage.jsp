<%@ page import="entity.User" %>
<%@ page import="static dao.UserDao.getUsers" %>
<%@ page import="java.util.List" %><%--
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
    <script src="../js/bootstrapValidator.min.js"></script>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/font-awesome.css">
    <link rel="stylesheet" href="../css/AdminLTE.css">
    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/adminlte.js"></script>
    <script src="../js/bootstrap-table.js"></script>
    <script src="../js/bootstrap-table-zh-CN.js"></script>
    <script src="../js/bootstrap-table-treegrid.js"></script>
    <script src="../js/jquery.treegrid.min.js"></script>
    <script src="../js/bootstrap-tab.js"></script>

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

<jsp:include page="header.jsp"></jsp:include>
<div class="container-fluid">
    <div class="divBorder">
        <div class="form-inline">
            <div class="input-group">
                <a href="AddUser.jsp" class="btn left20" role="button">
                    <span class=" glyphicon glyphicon-plus" aria-hidden="true" style="margin-right: 5px"></span>添 加</a>
            </div>
        </div>
        <div>
            <table class="table table-hover table-striped table-bordered text-center">
                <thead>
                <tr class="info">
                    <th>用户ID</th>
                    <th>用户名</th>
                    <th>用户身份</th>
                    <th>邮箱</th>
                    <th>最近登录</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <%
                    String sql = "SELECT ID,NAME,NAME,PASSWORD,EMAIL,RECENTSIGNUP FROM USERS";
                    List<User> users = getUsers(sql);
                    for (User tempUser : users){
                %>
                <tr>
                    <td><%=tempUser.getUserID()%></td>
                    <td><%=tempUser.getName()%></td>
                    <td><%
                        if (tempUser.getPrivilege())
                            out.write("管理员");
                        else
                            out.write("普通用户");
                    %></td>

                    <td><%=tempUser.getEmail()%></td>
                    <td><%=tempUser.getRecentSignUp()%></td>
                    <td>
                        <a href="#" class="btn left20" role="button">
                        <span class=" glyphicon glyphicon-edit" aria-hidden="true" style="margin-right: 5px"></span>修改用户身份</a>
                        <a href="#" class="btn left20" role="button">
                            <span class="glyphicon glyphicon-minus" aria-hidden="true" style="margin-right: 5px"></span>删 除</a>
                    </td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>
</html>
