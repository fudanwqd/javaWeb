<%@ page import="entity.User" %>
<%@ page import="static dao.UserDao.getUser" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Artwork" %><%--
  Created by IntelliJ IDEA.
  User: Water
  Date: 2019/7/18
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String name = request.getParameter("name");
    //    User user = (User) session.getAttribute("user");
    String sql = "SELECT * FROM USERS WHERE NAME = ?";
    User friend = getUser(sql,name);
%>

<%
    //    User user = (User) session.getAttribute("user");
    String sql1 = "SELECT * FROM USERS WHERE ID = 1";
    User user = getUser(sql1);
%>
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

    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/adminlte.js"></script>
    <script src="../js/bootstrap-table.js"></script>
    <script src="../js/bootstrap-table-zh-CN.js"></script>
    <script src="../js/bootstrap-table-treegrid.js"></script>
    <script src="../js/jquery.treegrid.min.js"></script>
    <script src="../js/bootstrap-tab.js"></script>
    <title><%= name%></title>
</head>

<jsp:include page="header.jsp"></jsp:include>



<nav class="navbar navbar-default pull-left side navbar-static-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">ta的信息</a>
        </div>
        <div>
            <p class="navbar-text myLine">用户名:<%=friend.getName()%></p>
            <p class="navbar-text myLine">电子邮箱:<%=friend.getEmail()%></p>
            <p class="navbar-text myLine">个性签名:<%=friend.getSignature()%></p>
        </div>
        <br>
    </div>
</nav>

<div>
    <h2>ta的收藏</h2>
    <%
        ArrayList<String> collectionsList = friend.getCollections();
        String[] collections = (String[]) collectionsList.toArray();
        int size = collections.length;
        for (int i = size - 1;i > 0;i++){
            //arework对象
//            Artwork artwork = new Artwork();

    %>
    <form action="requestFriendServlet" method="post" role="form">
        <div class="card">
            <div class="card-view">
                <img src="img/1.png" class="img-circle" alt="User Image">
            </div>
            <p class="navbar-text myLine">用户名:<%=tempUser.getName()%></p>
            <p class="navbar-text myLine">电子邮箱:<%=tempUser.getEmail()%></p>
            <p class="navbar-text myLine">个性签名:<%=tempUser.getSignature()%></p>
            <label>
                <input type="radio" name="power" value="同意">
            </label>同 意
            <label>
                <input type="radio" name="power" value="拒绝">
            </label>拒 绝
        </div>
        <button type="submit" class="btn btn-default">确 定</button>
    </form>
    <%
        }
    %>
</div>

<body>

</body>
</html>
