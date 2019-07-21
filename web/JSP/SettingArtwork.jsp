<%@ page import="dao.ArtworkDao" %>
<%@ page import="entity.Artwork" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/font-awesome.css">
    <link rel="stylesheet" href="../css/AdminLTE.css">


    <script src="../js/jquery-3.3.1.min.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/bootstrapValidator.min.js"></script>
    <title>修改信息</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<%

    int id = Integer.parseInt(request.getParameter("id"));
    String sql = "SELECT * FROM ARTWORK WHERE ID = ?";
    Artwork artwork = ArtworkDao.getArtwork(sql,id);

%>

<div class="container-fluid panel-body" style="padding-bottom:0px">
    <form class="form-horizontal"  action="/setArtwork" method="post" enctype="multipart/form-data">
        <div class="panel panel-default" style="margin-bottom: 0px">
            <h4 class="panel panel-heading h4font">
                修改展品信息
            </h4>

            <div class="panel-body">
                <div class="form-group">
                    <label class="col-sm-1 control-label">作品名:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="name" value="<%=artwork.getName()%>">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-1 control-label">简介:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="description" value="<%=artwork.getDescription()%>">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-1 control-label">上传图片:</label>
                    <div class="col-sm-4">
                        <input type="file" name="path"/><br>
                        <text>（只支持png格式）</text>
                        <text>原有图片</text>
                        <br>
                        <img src="<%=artwork.getImgPath()%>" alt="">
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-1 control-label">馆藏地点:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="location" value="<%=artwork.getLocation()%>">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 control-label">出土年份或完成时间:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="time" value="<%=artwork.getTime()%>">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-1 control-label">介绍视频:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="videoPath" value="<%=artwork.getVideoPath()%>">
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
                <a href="/JSP/WorkManage.jsp" class="btn btn-primary">返 回</a>
            </div>
        </div>



    </form>

</div>
</body>
</html>
