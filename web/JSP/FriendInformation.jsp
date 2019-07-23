<%@ page import="entity.User" %>
<%@ page import="entity.Artwork" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    User friend = (User) request.getAttribute("friend");
    List<Artwork> artworksList = (List<Artwork>) request.getAttribute("artworks");
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
            <h2 style="text-align: center">ta的信息</h2>
        </div>
        <div>
            <p class="navbar-text myLine">用户名:<%=friend.getName()%></p>
            <p class="navbar-text myLine">电子邮箱:<%=friend.getEmail()%></p>
            <p class="navbar-text myLine">个性签名:<%=friend.getSignature()%></p>
        </div>
        <br>
    </div>
</nav>

<div class="text-center">
    <h2 style="text-align: center">ta的收藏</h2>
    <%
        if (artworksList != null && artworksList.size() > 0){
            int j = 0;
            for (int i = artworksList.size() - 1;i >= 0;i--){
                if (j >= 5){
                    break;
                }
                j++;
    %>
    <div class="card-view">
        <p class="myLine"><a href="/ExhibitionDetailsServlet?id=<%=artworksList.get(i).getId()%>">展品名:<%=artworksList.get(i).getName()%></a></p>
<%--        <img src="<%=artworksList.get(i).getImgPath()%>" alt="" style="height: 500px;width: 500px">--%>
    </div>
    <%
            }
        }else {
    %>
    <h4 style="color: grey;">ta还没有收藏品哦~</h4>
    <%
        }
    %>
</div>

<body>

</body>
</html>
