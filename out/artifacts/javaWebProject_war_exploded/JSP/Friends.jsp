<%@ page import="entity.User" %>
<%@ page import="static dao.UserDao.getUser" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.UserDao" %>
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
            <input type="text" class="form-control" name="search" onkeydown="onKeyDown(event,search.value)"/>
            <span class="input-group-addon" onclick="doSearch(search.value)">搜索</span>
        </div>
    </div>
</div>


<div class="divBorder">
    <div class="form-inline">
        <div class="input-group">

            <h2>我的好友</h2>
                <%
                    ArrayList<User> myFriends = (ArrayList<User>) session.getAttribute("myFriends");
                    if (myFriends != null && myFriends.size() > 0){
                    for (User tempUser: myFriends){
                %>
<%--                <form action="" method="post" role="form">--%>
                    <div class="card">
                        <div class="card-body">
                            <div class="card-view">
                                <img src="../img/1.png" class="img-circle" alt="User Image">
                            </div>
                            <p class="navbar-text myLine">用户名:<%=tempUser.getName()%></p>
                            <p class="navbar-text myLine">电子邮箱:<%=tempUser.getEmail()%></p>
                            <p class="navbar-text myLine">个性签名:<%=tempUser.getSignature()%></p>
                        </div>
                        <form action="/sendMessage?id=<%=tempUser.getUserID()%>" method="post">
                            <label>想对TA说的话：</label>
                            <input type="text" name="message">
                            <a><button type="submit" class="btn btn-default btn-primary" >发 送</button></a>
                        </form>
                        <%=
                        "<a href='/deleteFriend?id=" + tempUser.getUserID() + "' <button class='btn btn-default btn-primary'>删 除</button></a>" +
                        "<a href='/getFriendInfo?name=" + tempUser.getName() + "' <button class='btn btn-default btn-primary'>查 看</button></a>"
                        %>
                    </div>

<%--                </form>--%>

<%--                <%--%>
<%--                    String str = " <a href='FriendInformation.jsp?name="+--%>
<%--                            tempUser.getName()+"'> <button class='btn btn-default btn-primary'>查 看</button></a>";--%>
<%--                %>--%>
<%--                <%=str%>--%>
                <%
                        }
                    }else {
                %>
                    <text>目前还没有好友哦~快去添加好友</text>
            <%
                }
            %>
        </div>
    </div>
</div>


</body>
</html>
