<%@ page import="entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String action = request.getParameter("succeed");
    if (session.getAttribute("user") != null && action != null){
        switch (action){
            case "1":
%>
<script>
    alert("登陆成功！");
</script>
<%
          break;
        case "2":
%>
<script>
    alert("注册成功！");
</script>
<%
            break;
        case "3":
%>
<script>
    alert("添加成功！");
</script>

<%
break;
        case "4":
%>
<script>
    alert("发送好友请求成功！");
</script>
<%
            break;
            case "5":
%>
<script>
    alert("删除成功！");
</script>
<%
        }
        }
%>

<header class="main-header">
    <a href="/JSP/Home.jsp" class="logo">
        <span class="logo-mini"><b>ZK</b>JZ</span>
        <span class="logo-lg"><b>Welcome</b> 张江博物馆</span>
    </a>

    <nav class="navbar navbar-default" role="navigation">
        <div class="container">
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right" id="mytab">
                    <li><a href="../JSP/Home.jsp">首页</a></li>
                    <li><a href="../JSP/Search.jsp">搜索</a></li>
                    <%
                        User user = (User) session.getAttribute("user");
                        if (user != null){
                    %>


                    <%
                        if (user.getPrivilege()){
                    %>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">管理栏<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="../JSP/UserManage.jsp">人员管理</a></li>
                            <li><a href="../JSP/WorkManage.jsp">作品管理</a></li>
                        </ul>
                    </li>

                    <%
                        }
                    %>

                    <li class="dropdown">
                        <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            <%=
                            user.getName()
                            %>
                            <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="../JSP/User.jsp">个人信息</a></li>
                            <li><a href="../JSP/Friends.jsp">好友列表</a></li>
                            <li><a href="/CollectionDirectoryServlet">收藏夹</a></li>
                            <li><a href="../JSP/Chat.jsp">信箱</a></li>
                            <li role="separator" class="divider"></li>
                            <li ><a href='/quit'> 退出登录</a></li>
                        </ul>
                    </li>
                    <%
                    }else {

                    %>
                    <li><a href="../JSP/Login.jsp">注册</a></li>
                    <li><a href="../JSP/SignUp.jsp">登录</a></li>
                    <%
                        }
                    %>


                </ul>
            </div>
        </div>
    </nav>
</header>

