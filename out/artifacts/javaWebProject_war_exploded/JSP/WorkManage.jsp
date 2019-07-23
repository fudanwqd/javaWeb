<%@ page import="entity.Artwork" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.ArtworkDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="UTF-8">
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

    <title>作品管理</title>
    <style>
        .divBorder{
            border: solid 1px rgba(12,24,255,0.15);
            padding-top: 15px;
            padding-bottom: 15px;
            margin-top: 5px;
            border-radius: 5px;
        }
        .left20{
            margin-left: 15px;
        }
    </style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="container-fluid">

    <div class="divBorder">
        <div class="form-inline">
            <div class="input-group">
                <a href="/JSP/AddArtwork.jsp" class="btn   left20" role="button">
                    <span class=" glyphicon glyphicon-plus" aria-hidden="true" style="margin-right: 5px"></span>添 加</a>
            </div>
        </div>
        <div>
            <table class="table table-hover table-striped table-bordered text-center">
                <thead>
                <tr class="info">
                    <th>序号</th>
                    <th>名称</th>
                    <th>馆藏地点</th>
                    <th>描述</th>
                    <th>操作</th>
                </tr>
                </thead>
                <%
                    String sql = "SELECT * FROM ARTWORK";
                    List<Artwork> artworks = ArtworkDao.selectArtworks(sql);
                    for (Artwork artwork : artworks){
                %>
                <tbody>
                <tr>
                    <td><%=artwork.getId()%></td>
                    <td><%=artwork.getName()%></td>
                    <td><%=artwork.getLocation()%></td>
                    <td><%=artwork.getDescription()%></td>
                    <td>
                        <a href="/JSP/SettingArtwork.jsp?id=<%=artwork.getId()%>" class="btn left20" role="button">
                            <span class=" glyphicon glyphicon-edit" aria-hidden="true" style="margin-right: 5px"></span>修 改</a>
                        <a href="/deleteArtwork?id=<%=artwork.getId()%>" class="btn left20" role="button">
                            <span class="glyphicon glyphicon-minus" aria-hidden="true" style="margin-right: 5px"></span>删 除</a>
                    </td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>


</body>
</html>

