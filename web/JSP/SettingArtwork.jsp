<%--
  Created by IntelliJ IDEA.
  User: Water
  Date: 2019/7/14
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/bootstrapValidator.min.css">


    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/bootstrapValidator.min.js"></script>
    <title>修改信息</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="container-fluid panel-body" style="padding-bottom:0px">
    <form class="form-horizontal" id="formAdd" action="/setArtwork" method="post">
        <div class="panel panel-default" style="margin-bottom: 0px">
            <h4 class="panel panel-heading h4font">
                修改展品信息
            </h4>

            <div class="panel-body">
                <div class="form-group">
                    <label class="col-sm-1 control-label">作品名:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="name" placeholder="" >
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-1 control-label">简介:</label>
                    <div class="col-sm-4">
                        <input type="password" class="form-control" name="userName" placeholder="">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-1 control-label">图片:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="userName" placeholder="">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-1 control-label">馆藏地点:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="userName" placeholder="馆藏地点">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 control-label">出土年份或完成时间:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="userName" placeholder="出土年份或完成时间">
                    </div>
                </div>
            </div>
        </div>

        <br>

        <div class="form-group">
            <div class="col-sm-offset-5 col-sm-1">
                <button type="submit" class="btn btn-primary" href="Person.jsp" >保 存</button>
            </div>

            <div class="col-sm-1">
                <a href="Person.jsp#" class="btn btn-primary">返 回</a>
            </div>
        </div>



    </form>

</div>
</body>
</html>
