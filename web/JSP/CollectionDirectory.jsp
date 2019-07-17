<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2019/7/12
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>收藏夹</title>
</head>
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
<style>
    section{
        background-color:gainsboro;
        margin:10px;
    }
    .collection{
        margin:25px;
        background-color:blanchedalmond;
        border:1px solid wheat;
        width:800px;
    }
</style>
<body>
<header class="main-header">
    <a href=" " class="logo">
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
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">用户<span class="caret"></span></a>
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

<section>

    <h2 class="text-center">收藏夹</h2>
    <table>
        <tr>
            <td>
                <table class="collection">
                    <tr>
                        <td rowspan="2">
                            <img src="../img/金石/古父己卣.jpg" height="150px" width="150px">
                        </td>
                        <td>
                            古父己卣
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button type="button"><a href="ExhibitionDetails.jsp">详情</a></button>
                            <button type="button"><a href="#">取消收藏</a></button>
                        </td>
                    </tr>

                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table class="collection">
                    <tr>
                        <td rowspan="2">
                            <img src="../img/金石/古父己卣.jpg" height="150px" width="150px">
                        </td>
                        <td>
                            古父己卣
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button type="button"><a href="ExhibitionDetails.jsp">详情</a></button>
                            <button type="button"><a href="#">取消收藏</a></button>
                        </td>
                    </tr>

                </table>
            </td>
        </tr>
    </table>
</section>
</body>
</html>
