<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2019/7/12
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">

<meta charset="utf-8">
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

<style>
    .intro{
        border-collapse: collapse;
        width:300px;
        height:200px;
    }
    .line{
        border:1px solid #CCC;
    }
</style>
<%--<!DOCTYPE html>--%>
<head>
    <meta charset="UTF-8">
    <title>展品详情</title>
</head>
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
<div class="container">
    <h2>古父己卣</h2>
    <p>朝代：</p>
    <div class="col-lg-4">
        <img src="../img/金石/古父己卣.jpg" height="400" width="300">
    </div>
    <div class="col-lg-4">
        <div class="row">
            <p>藏品介绍：西周 ，古父己卣此卣卣体作直筒形，有盖和提梁，形式与一般卣作椭圆形体的完全不同，在商代还找不到确切的祖型。
                此器颈部及圈足各饰分体夔纹，盖面及腹部是浮雕的大牛头，牛角翘起突出器表，巨晴凝视，有神秘感。</p>
        </div>
        <div class="row">
            <table class="intro">
                <tr class="line">
                    <td>
                        出土年份
                    </td>

                    <td>
                        西周 早期
                    </td>
                </tr>
                <tr class="line">
                    <td>
                        尺寸
                    </td>
                    <td>
                        高33.2厘米，口径15.7厘米
                    </td>
                </tr>
            </table>
        </div>
        <div class="row">

            <button type="button"><a href="#">收藏</a></button>
            <button type="button"><a href="CollectionDirectory.jsp">查看收藏夹</a></button>
        </div>
    </div>
</div>
</body>
</html>
