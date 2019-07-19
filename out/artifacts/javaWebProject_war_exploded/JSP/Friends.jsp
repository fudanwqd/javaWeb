<%@ page import="entity.User" %>
<%@ page import="static dao.UserDao.getUser" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.UserDao" %><%--
  Created by IntelliJ IDEA.
  User: Water
  Date: 2019/7/14
  Time: 9:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="../css/user.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="../css/ionicons.css">
    <link rel="stylesheet" type="text/css" href="../css/AdminLTE.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap-table.css">
    <link rel="stylesheet" type="text/css" href="../css/jquery.treegrid.css">
    <link rel="stylesheet" type="text/css" href="../css/myCommon.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap-tab.css">
    <title>我的好友</title>

    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/adminlte.js"></script>
    <script src="../js/bootstrap-table.js"></script>
    <script src="../js/bootstrap-table-zh-CN.js"></script>
    <script src="../js/bootstrap-table-treegrid.js"></script>
    <script src="../js/jquery.treegrid.min.js"></script>
    <script src="../js/bootstrap-tab.js"></script>
</head>

<body>
<%
    //    User user = (User) session.getAttribute("user");
    String sql1 = "SELECT * FROM USERS WHERE ID = 1";
    User user = getUser(sql1);
%>

<jsp:include page="header.jsp"></jsp:include>


<div class="row">
    <div class="col-lg-6 col-lg-offset-3">
        <div class="input-group">
            <input type="text" class="form-control" onkeydown="onKeyDown(event)"/>
            <span class="input-group-addon"><i class="glyphicon glyphicon-search" onclick="doSearch()"></i>搜索</span>
        </div>
    </div>
</div>
<div class="divBorder">

    <div class="form-inline">
        <div class="input-group">

            <h2>我的好友</h2>
                <%
                    String sql = "SELECT * FROM FRIENDSREQUESTS WHERE RECIPIENTID = ?";
                    ArrayList<User> users = UserDao.getUsers(sql,user.getUserID());
                    session.setAttribute("friends",users);
                    for (User tempUser: users){
                        session.setAttribute("friend",tempUser);
                %>
                <form action="requestFriendServlet" method="post" role="form">
                    <div class="card">
                        <div class="card-view">
                            <img src="../img/1.png" class="img-circle" alt="User Image">
                        </div>
                        <p class="navbar-text myLine">用户名:<%=tempUser.getName()%></p>
                        <p class="navbar-text myLine">电子邮箱:<%=tempUser.getEmail()%></p>
                        <p class="navbar-text myLine">个性签名:<%=tempUser.getSignature()%></p>
                    </div>


<%--                    <a href="FriendInformation.jsp?name=" + <%tempUser.getName();%><button class="btn btn-default btn-primary">查 看</button></a>--%>
                    <button type="submit" class="btn btn-default btn-primary">删 除</button>
                </form>
                <%
                    String str = " <a href='FriendInformation.jsp?name="+
                            tempUser.getName()+"'> <button class='btn btn-default btn-primary'>查 看</button></a>";
                %>
                <%=str%>
                <%
                    }
                %>

        </div>
    </div>
</div>

<div class="divBorder">
    <div class="form-inline">
        <div class="input-group">
            <h2>好友请求</h2>
            <div class="card">
                <div class="card-header">好友请求1</div>
                <div class="card-body">

                </div>

            </div>
        </div>
    </div>
</div>

</body>
</html>
