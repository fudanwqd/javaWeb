<%@ page import="entity.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="util.DBconnect" %>
<%@ page import="dao.UserDao" %>
<%@ page import="static dao.UserDao.getUser" %><%--
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
</head>
<body>

<%
    String sql1 = "SELECT * FROM USERS WHERE ID = 1";
    User user = getUser(sql1);
%>
<header class="main-header">
    <a href="Home.jsp" class="logo">
        <span class="logo-mini"><b>ZK</b>JZ</span>
        <span class="logo-lg"><b>Welcome</b> 张江博物馆</span>
    </a>

    <nav class="navbar navbar-default" role="navigation">
        <div class="container">
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right" id="mytab">
                    <li><a href="Home.jsp">首页</a></li>
                    <li><a href="Search.jsp">搜索</a></li>

                    <%
                        //    User user = (User) session.getAttribute("user");
                        if (user != null){
                    %>

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            <%=
                            user.getName()
                            %>
                            <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="User.jsp">个人信息</a></li>
                            <li><a href="Friends.jsp">好友列表</a></li>
                            <li><a href="CollectionDirectory.jsp">收藏夹</a></li>
                            <li role="separator" class="divider"></li>
                            <li ><a onclick="quit()"> 退出登录</a></li>
                        </ul>
                    </li>
                    <%
                    }else {

                    %>
                    <li><a href="Login.jsp">注册</a></li>
                    <li><a href="SignUp.jsp">登录</a></li>
                    <%
                        }
                    %>


                </ul>
            </div>
        </div>
    </nav>
</header>
<div class="container">
    <aside class="main-sidebar">
        <section class="sidebar">
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="../img/1.png" class="img-circle" alt="User Image">
                </div>
            </div>

            <ul class="sidebar-menu" data-widget="tree">
                <li class="header"><span class="fa-lg">管理菜单</span></li>
                <li><a href="../JSP/CollectionDirectory.jsp"><i class="fa fa-link"></i> <span>收藏夹</span></a></li>
                <li><a href="../JSP/Friends.jsp"><i class="fa fa-link"></i> <span>好友列表</span></a></li>
                <%
                    if (user.getPrivilege()){
                %>
                <li><a href="../JSP/UserManage.jsp"><i class="fa fa-link"></i> <span>人员管理</span></a></li>
                <li><a href="../JSP/WorkManage.jsp"><i class="fa fa-link"></i> <span>作品管理</span></a></li>
                <%
                    }
                %>
            </ul>
        </section>
    </aside>
    <nav class="navbar navbar-default pull-left side navbar-static-top" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">我的信息</a>
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
                    String sql = "SELECT * FROM FRIENDSREQUESTS WHERE RECIPIENTID = ?";
                    ArrayList<User> users = UserDao.getUsers(sql,user.getUserID());
                    session.setAttribute("friends",users);
                    for (User tempUser: users){
                        session.setAttribute("friend",tempUser);
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
        </div>
    </div>

</div>
</body>
</html>
