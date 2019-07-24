<%@ page import="entity.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="util.DBconnect" %>
<%@ page import="dao.UserDao" %>
<%@ page import="static dao.UserDao.getUser" %>
<%@ page import="entity.FriendsRequest" %><%--
  Created by IntelliJ IDEA.
  User: Water
  Date: 2019/7/14
  Time: 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人界面</title>
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
    <style>
        .extra{
            border: 1px ridge #b3d7ff;
            text-align: center;
        }
    </style>
</head>
<body>

<%
    User user = (User) session.getAttribute("user");
%>

<jsp:include page="header.jsp"></jsp:include>

<div class="container">
    <nav class="navbar navbar-default pull-left side navbar-static-top" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">我的信息</a>
            </div>
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="../img/1.png" class="img-circle" alt="User Image">
                </div>
            </div>
            <div>
                <p class="navbar-text myLine">用户名:<%=user.getName()%></p>
                <p class="navbar-text myLine">电子邮箱:<%=user.getEmail()%></p>
                <p class="navbar-text myLine">个性签名:<%=user.getSignature()%></p>
                <p class="navbar-text myLine">我的身份：<%
                    if (user.getPrivilege())
                        out.write("管理员");
                    else
                        out.write("普通用户");
                %>
                </p>
            </div>
            <br>
            <a href="SettingUser.jsp">
                <button class="btn btn-default">
                    修 改
                </button>
            </a>
        </div>
    </nav>

    <div class="divBorder">
        <div class="form-inline">
            <div class="input-group">
                <h2>好友请求</h2>
                <%
                    ArrayList<FriendsRequest> friendsRequests = (ArrayList<FriendsRequest>) session.getAttribute("friendRequests");
                    if (friendsRequests!= null && friendsRequests.size() > 0){
                        for (FriendsRequest friendsRequest: friendsRequests){
                            if (friendsRequest.getStatus() == 0){
                %>
                    <div class="card extra">
                        <div class="card-view">
                            <img src="../img/1.png" class="img-circle" alt="User Image">
                        </div>
                        <p class="navbar-text myLine">用户名:<%=friendsRequest.getSender().getName()%></p>
                        <p class="navbar-text myLine">电子邮箱:<%=friendsRequest.getSender().getEmail()%></p>
                        <p class="navbar-text myLine">个性签名:<%=friendsRequest.getSender().getSignature()%></p>
                        <div class="row">
                        <%=
                        "<a href='/requestFriend?id=" + friendsRequest.getSender().getUserID() + "&value=1'><button>同 意</button></a>" +
                         "<a href='/requestFriend?id=" + friendsRequest.getSender().getUserID() + "&value=-1'><button>拒 绝</button></a>"
                        %>
                        </div>
                    </div>
                <%
                            }
                        }
                    }else{
                %>
                <text>还没有人想加你~真伤心</text>

                <%
                    }
                %>
            </div>
        </div>
    </div>

</div>
</body>
</html>
