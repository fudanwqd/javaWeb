
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加展品</title>

    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
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
    <script type="text/javascript" src="../js/swiper.min.js"></script>

    <%
        if (request.getParameter("error") != null && request.getParameter("error").equals("1")){
    %>
    <script>
        alert("文件过大，不能上传！");
    </script>
    <%
    }else if (request.getParameter("error") != null && request.getParameter("error").equals("2")){
    %>
    <script>
        alert("输入不能为空！");
    </script>
    <%
        }else if (request.getParameter("error") != null && request.getParameter("error").equals("3")){
    %>
    <script>
        alert("上传文件格式错误！");
    </script>
    <%
        }
    %>


</head>
<jsp:include page="header.jsp"></jsp:include>

<div class="container-fluid panel-body" style="padding-bottom:0px">
    <form class="form-horizontal"  action="/addArtwork" method="post" enctype="multipart/form-data">
        <div class="panel panel-default" style="margin-bottom: 0px">
            <h4 class="panel panel-heading h4font">
                修改展品信息
            </h4>

            <div class="panel-body">
                <div class="form-group">
                    <label class="col-sm-1 control-label">作品名:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="name">
                    </div>
                </div>
                <div class="form-group">

                    <label class="col-sm-1 control-label">种类:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="description" >
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-1 control-label">简介:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="description">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-1 control-label">上传图片:</label>
                    <div class="col-sm-4">
                        <input type="file" name="path"/><br>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-1 control-label">馆藏地点:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="location" >
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 control-label">出土年份或完成时间:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="time" >
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 control-label">上传视频:</label>
                    <div class="col-sm-4">
                        <input type="file" name="videoPath"/><br>
                    </div>
                </div>
            </div>
        </div>


        <br>

        <div class="form-group">
            <div class="col-sm-offset-5 col-sm-1">
                <button type="submit" class="btn btn-primary" >保 存</button>
            </div>

            <div class="col-sm-1">
                <a href="/JSP/WorkManage.jsp" class="btn btn-primary">返 回</a>
            </div>
        </div>



    </form>

</div>
</html>
