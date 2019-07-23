<%@ page import="entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <meta charset="utf-8">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/AdminLTE.css">
    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/adminlte.js"></script>
    <script src="../js/bootstrap-table.js"></script>
    <script src="../js/bootstrap-table-zh-CN.js"></script>
    <script src="../js/bootstrap-table-treegrid.js"></script>
    <script src="../js/jquery.treegrid.min.js"></script>
    <script src="../js/bootstrap-tab.js"></script>


    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/bootstrapValidator.min.js"></script>

    <script src="../js/md5.js"></script>
    <title>修改信息</title>

    <script>
        function set() {
            if (document.getElementById("name").value == null || document.getElementById("name").value === ""){
                alert("用户名不能为空");
            } else if (document.getElementById("emailAddress").value == null || document.getElementById("emailAddress").value === ""){
                alert("邮箱不能为空");
            } else if (document.getElementById("signature").value == null || document.getElementById("signature").value === ""){
                alert("签名不能为空");
            }else if (document.getElementById("password").value == null || document.getElementById("password").value === ""){
                alert("密码不能为空");
            } else {
                let password = hex_md5(document.getElementById("password").value);
                window.location.href = "/reviseUser?name=" + document.getElementById("name").value + "&password=" +
                    password + "&email=" + document.getElementById("emailAddress").value +
                    "&signature=" + document.getElementById("signature").value;
            }
        }
    </script>

    <%
        if (request.getParameter("error") != null && request.getParameter("error").equals("1")){
    %>
    <script>
        alert("密码错了！");
    </script>
    <%
        }else if (request.getParameter("error") != null && request.getParameter("error").equals("2")){
    %>
    <script>
        alert("该用户名已存在！");
    </script>
    <%
        }
    %>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<%
    User user = (User) session.getAttribute("user");
%>


<div class="container-fluid panel-body" style="padding-bottom:0px">
        <div class="panel panel-default" style="margin-bottom: 0px">
            <h4 class="panel panel-heading h4font">
                修改个人信息
            </h4>

            <div class="panel-body">
                <div class="form-group">
                    <label class="col-sm-1 control-label">用户名:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="name" value="<%=user.getName()%>">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-1 control-label">邮箱:</label>
                    <div class="col-sm-4">
                        <input type="email" class="form-control" id="emailAddress" value="<%=user.getEmail()%>">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-1 control-label">个性签名:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="signature" value="<%=user.getSignature()%>">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-3 control-label">验证密码(密码正确才能修改其他信息):</label>
                    <div class="col-sm-4">
                        <input type="password" class="form-control" id="password">
                    </div>
                </div>
            </div>
        </div>
        <br>
        <div class="form-group">
            <div class="col-sm-offset-5 col-sm-1">
                <button type="submit" class="btn btn-primary" onclick="set()">保 存</button>
            </div>
            <div class="col-sm-1">
                <a href="User.jsp" class="btn btn-primary">返 回</a>
            </div>
        </div>
</div>
</body>
</html>
