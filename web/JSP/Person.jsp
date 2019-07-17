<%--
  Created by IntelliJ IDEA.
  User: Water
  Date: 2019/7/14
  Time: 11:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>个人信息管理</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="../css/ionicons.css">
    <link rel="stylesheet" type="text/css" href="../css/AdminLTE.css">
    <link rel="stylesheet" type="text/css" href="../css/skins/skin-blue.min.css">
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

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <header class="main-header">
        <a href="#" class="logo">
            <span class="logo-mini"><b>C</b>RM</span>
            <span class="logo-lg"><b>Welcome</b>  visit crm</span>
        </a>

        <nav class="navbar navbar-default" role="navigation">
            <div class="container">
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right" id="mytab">
                        <li><a href="#">Link</a></li>
                        <li><a href="#">Link</a></li>
                        <li class="dropdown">
                            <a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="">Action</a></li>
                                <li><a href="">Another action</a></li>
                                <li><a href="">Something else here</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>


    <aside class="main-sidebar">
        <section class="sidebar">
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="../img/1.png" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p>User name</p>
                    <small>邮箱</small>
                </div>
            </div>


            <ul class="sidebar-menu" data-widget="tree">
                <li class="header"><span class="fa-lg">管理菜单</span></li>
                <li class="active"><a href="javascript:void(0)" data="User.jsp" class="myLeftMenu"><i class="fa fa-link"></i> <span>我的信息</span></a></li>
                <li><a href="javascript:void(0)" data="collection.jsp" class="myLeftMenu"><i class="fa fa-link"></i> <span>收藏夹</span></a></li>
                <li><a href="javascript:void(0)" data="Friends.jsp" class="myLeftMenu"><i class="fa fa-link"></i> <span>好友列表</span></a></li>
                <li><a href="javascript:void(0)" data="UserManage.jsp" class="myLeftMenu"><i class="fa fa-link"></i> <span>人员管理</span></a></li>
                <li><a href="javascript:void(0)" data="WorkManage.jsp" class="myLeftMenu"><i class="fa fa-link"></i> <span>作品管理</span></a></li>
            </ul>
        </section>
    </aside>

    <div class="content-wrapper">
        <section class="content container-fluid">
            <div id="container">

            </div>
        </section>
    </div>

    <footer class="main-footer">
        <!-- To the right -->
        <div class="pull-right hidden-xs">
            Anything you want
        </div>
        <!-- Default to the left -->
        <strong>Copyright &copy; 2016 <a href="">Company</a>.</strong> All rights reserved.
    </footer>

</div>

<script>
    $("#mytab li").click(function (e) {
        e.preventDefault();
        $(this).tab("show");
    });

    var con = $("#container");
    con.load("User.jsp");

    $(function () {
        $("ul.sidebar-menu li").click(function () {
            var li = $('ul.sidebar-menu li.active');
            li.removeClass('active');
            $(this).addClass('active');
        });

        $('.myLeftMenu').click(function () {
            var url = $(this).attr('data');
            con.load(url);
        });
    });


</script>

</body>
</html>
