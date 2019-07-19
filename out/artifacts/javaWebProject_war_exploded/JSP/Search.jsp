<%@ page import="entity.Artwork" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2019/7/12
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta charset="utf-8">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/bootstrap.css">

<link rel="stylesheet" href="../css/font-awesome.css">

<link rel="stylesheet" href="../css/AdminLTE.css">
<script src="../js/jquery-3.3.1.min.js"></script>

<script src="../js/bootstrap.js"></script>
<script src="../js/adminlte.js"></script>

<script src="../js/bootstrap-table.js"></script>
<script src="../js/bootstrap-table-zh-CN.js"></script>
<script src="../js/bootstrap-table-treegrid.js"></script>
<script src="../js/jquery.treegrid.min.js"></script>
<script src="../js/bootstrap-tab.js"></script>


<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<head>
    <title>展品搜索</title>
</head>
<style>
    .showPicture {
        height: 100px;
        width: 100px;
    }

    .frame {
        background-color: beige;
        margin: 2px 20px;
        border: outset;
        border-color: black;
        border-width: 3px;
    }

</style>
<body>
<header class="main-header">
    <a href="#" class="logo">
        <span class="logo-mini"><b>ZK</b>JZ</span>
        <span class="logo-lg"><b>Welcome</b> 张江博物馆</span>
    </a>

    <nav class="navbar navbar-default" role="navigation">
        <div class="container">
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right" id="mytab">
                    <li><a href="Home.jsp">首页</a></li>
                    <li><a href="Search.jsp">搜索</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">用户<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">个人信息</a></li>
                            <li><a href="#">好友列表</a></li>
                            <li><a href="#">收藏夹</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">退出登录</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
<div class="container">
    <div class="row">
        <div class="col-lg-6 col-lg-offset-3">
            <div class="input-group">
                <input type="text" class="form-control" name="search" onkeydown="onKeyDown(event,search.value)"/>
                <span class="input-group-addon"><i class="glyphicon glyphicon-search"
                                                   onclick="doSearch(search.value)"></i></span>
            </div>
        </div>
    </div>
    <section>
        <h2>搜索结果：</h2>


        <%
            List<Artwork> limitsearches = null;
            if (request.getAttribute("searches") != null) {
                limitsearches = (List<Artwork>) request.getAttribute("limitsearches");
            }
            if (limitsearches != null) {
        %>
        <table>

                <%
               for(int i=0;i<3;i++){
                   %>
            <tr>
                    <%
                       for(int j=0;j<3;j++){
                           %>
                <td>
                    <table class="frame">
                        <tr>
                            <td rowspan="2"><img class="showPicture" src=<%=limitsearches.get(i*3+j).getImgPath()%>>
                            </td>
                            <td><%=limitsearches.get(i * 3 + j).getName()%>
                            </td>
                        </tr>
                        <tr>
                            <td>朝代：<%=limitsearches.get(i * 3 + j).getTime()%>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"><%=limitsearches.get(i * 3 + j).getDescription()%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <button type="button"><a href="ExhibitionDetails.jsp?id=<%=limitsearches.get(i * 3 + j).getId()%>">详情</a></button>
                            </td>
                            <td>
                                <button type="button"><a href="#">收藏</a></button>
                            </td>
                        </tr>
                    </table>
                </td>
                    <%
                            }
                           }
 }
                           %>

                <div class="row text-center">
                    <ul class="pagination">
                        <li><a href="/SearchServlet?page=${requestScope.prev}">&laquo;</a></li>
                        <%
                            if(request.getAttribute("last")!=null){
                            int Allpage = (int)request.getAttribute("last");
                            for(int i=0;i<Allpage;i++){
                                %>
                        <li><a href="/SearchServlet?page=<%=i%>"><%=i%></a></li>
                        <%
                                }
                            }
                        %>
                        <li><a href="/SearchServlet?page=${requestScope.next}">&raquo;</a></li>
                    </ul>
                </div>

    </section>
    <script type="text/javascript">
        function onKeyDown(event, Searchvalue) {
            var e = event || window.event || arguments.callee.caller.arguments[0];
            if (e && e.keyCode == 13) { // enter 键
                doSearch(Searchvalue);
            }

        }

        function doSearch(searchValue) {
            window.location.href = "/SearchServlet?search=" + searchValue;
            alert("搜索！")
        }


    </script>
</div>
</body>
</html>
