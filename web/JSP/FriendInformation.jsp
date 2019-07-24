<%@ page import="entity.User" %>
<%@ page import="entity.Artwork" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    User friend = (User) request.getAttribute("friend");
    List<Artwork> artworksList = (List<Artwork>) request.getAttribute("artworks");
    if(artworksList==null||friend==null){
        response.sendRedirect("/JSP/Home.jsp");
    }else{
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
    <style>
        .trs{

        }
        .collections{
           text-align: center;
        }
        .collectTable{
            margin:25px;
            background-color:blanchedalmond;
            border:1px solid wheat;
            width:800px;
        }
    </style>
</head>

<jsp:include page="header.jsp"></jsp:include>

<nav class="navbar navbar-default pull-left side navbar-static-top" style="height: 100%">
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

<div class="text-center" >
    <h2 style="text-align: center">ta的收藏</h2>
    <div class="collections">

    <table>
    <%
        if (artworksList != null && artworksList.size() > 0){
            int j = 0;
            for (int i = artworksList.size() - 1;i >= 0;i--){
                if (j >= 5){
                    break;
                }
                j++;
    %>
<tr class="trs">
    <td>
    <table class="collectTable">
        <tr>
    <td rowspan="2"><img src="<%=artworksList.get(i).getImgPath()%>" alt="" style="align-self: auto;height: 250px;width: 250px"></td>
            <td><h4><%=artworksList.get(i).getName()%></h4></td>
        </tr>
        <tr>
            <td><button type="button"><a href="/ExhibitionDetailsServlet?id=<%=artworksList.get(i).getId()%>">详情</a></button></td>
        </tr>
    </table>
    </td>
        </tr>

    <%
        }
    }else {
    %>
    <h3 style="color: grey;text-align: center">ta还没有收藏品哦~</h3>
    <%
        }
    %>
    </table>
    </div>
</div>
<%
    }
%>
<body>

</body>
</html>
