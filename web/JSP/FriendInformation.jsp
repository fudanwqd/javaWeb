<%@ page import="entity.User" %>
<%@ page import="static dao.UserDao.getUser" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Artwork" %>
<%@ page import="static dao.ArtworkDao.SearchAllByName" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Water
  Date: 2019/7/18
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    User friend = (User) request.getAttribute("friend");

    List<Artwork> artworks = (List<Artwork>) request.getAttribute("collections");
//    if ()

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
    <title><%= friend.getName()%></title>
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
    <h2>TA的收藏</h2>
    <%
        for (Artwork artwork : artworks){
    %>
    <form action="/requestFriend" method="post" role="form">
        <div class="card">
            <div class="card-view">
                <img src="<%=artwork.getImgPath()%>" class="img-circle" alt="User Image">
            </div>
            <p class="navbar-text myLine">展品名: <a href="ExhibitionDetails.jsp?name="><%=artwork.getName()%></a></p>
            <p class="navbar-text myLine">种类:<%=artwork.getType()%></p>
            <p class="navbar-text myLine">描述:<%=artwork.getDescription()%></p>
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
