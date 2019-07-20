<%@ page import="entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<header class="main-header">
    <a href="Home.jsp" class="logo">
        <span class="logo-mini"><b>ZK</b>JZ</span>
        <span class="logo-lg"><b>Welcome</b> 张江博物馆</span>
    </a>

    <nav class="navbar navbar-default" role="navigation">
        <div class="container">
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right" id="mytab">
                    <li><a href="/HomeServlet">首页</a></li>
                    <li><a href="../JSP/Search.jsp">搜索</a></li>

                    <%
                        User user = (User) session.getAttribute("user");
                        //                        session.setAttribute("user",user);
                        if (user != null){
                    %>

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            <%=
                            user.getName()
                            %>
                            <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="../JSP/User.jsp">个人信息</a></li>
                            <li><a href="../JSP/Friends.jsp">好友列表</a></li>
                            <li><a href="../JSP/CollectionDirectory.jsp">收藏夹</a></li>
                            <li role="separator" class="divider"></li>
                            <li ><a onclick="quit()"> 退出登录</a></li>
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

