
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<%--    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">--%>
<%--    <link rel="stylesheet" href="../css/style.css">--%>
    <link rel="stylesheet" href="../css/bootstrap.css">
<%--    <link rel="stylesheet" href="../css/font-awesome.css">--%>
<%--    <link rel="stylesheet" href="../css/AdminLTE.css">--%>
<%--    <script src="../js/jquery-3.3.1.min.js"></script>--%>
<%--    <script src="../js/bootstrap.js"></script>--%>
<%--    <script src="../js/adminlte.js"></script>--%>
<%--    <script src="../js/bootstrap-table.js"></script>--%>
<%--    <script src="../js/bootstrap-table-zh-CN.js"></script>--%>
<%--    <script src="../js/bootstrap-table-treegrid.js"></script>--%>
<%--    <script src="../js/jquery.treegrid.min.js"></script>--%>
<%--    <script src="../js/bootstrap-tab.js"></script>--%>
<%--    <script type="text/javascript" src="../js/swiper.min.js"></script>--%>
    <meta charset="utf-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户登录</title>
    <style>
        .container{
            display:table;
            height:100%;
        }

        .row{
            display: table-cell;
            vertical-align: middle;
        }
        .row-centered {
            text-align:center;
        }
        .col-centered {
            display:inline-block;
            float:none;
            text-align:left;
            margin-right:-4px;
        }
    </style>
</head>
<body>
<%--<jsp:include page="header.jsp"></jsp:include>--%>

<div class="container">
    <div class="row row-centered">
        <div class="col-md-6 col-centered">
            <h2 style="text-align: center">欢迎登录</h2>
            <form action="/signUp" method="post" role="form" >
                <div class="input-group input-group-md">
                    <span class="input-group-addon" id="sizing-addon1"><i class="glyphicon glyphicon-user" aria-hidden="true"></i></span>
                    <input type="text" class="form-control" id="userName" name="userName" placeholder="请输入用户名"/>
                </div>
                <div class="input-group input-group-md">
                    <span class="input-group-addon" id="sizing-addon2"><i class="glyphicon glyphicon-lock"></i></span>
                    <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码"/>
                </div>
                <br/>
                <button type="submit" class="btn btn-primary btn-block">登 录</button>
            </form>
        </div>
    </div>
</div>


<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
