<%@ page import="entity.Artwork" %>
<%@ page import="entity.Collectionrelation" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.User" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2019/7/12
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">


<head>
    <meta charset="UTF-8">
    <title>展品详情</title>

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
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="container">
    <%
        Artwork artwork =null;
        artwork = (Artwork)request.getAttribute("artwork");
        if(artwork!=null){
    %>

    <h2><%=artwork.getName()%></h2>
    <p>朝代：<%=artwork.getTime()%></p>
    <div class="col-lg-4">
        <img src=<%=artwork.getImgPath()%>  height="400" width="300">
    </div>
    <div class="col-lg-4">
        <div class="row">
            <p><%=artwork.getDescription()%></p>
        </div>
        <div class="row">
            <table class="intro">
                <tr class="line">
                    <td>
                        出土年份
                    </td>

                    <td>
                        <%=artwork.getTime()%>
                    </td>
                </tr>
                <tr class="line">
                    <td>
                        馆藏
                    </td>
                    <td>
                        <%=artwork.getLocation()%>
                    </td>
                </tr>
            </table>
        </div>
        <div class="row">
            <%
                User user = (User)session.getAttribute("user");
                if(user!=null){
                boolean hasCollect = (boolean)request.getAttribute("hasCollect");
               if(hasCollect){
                   %>
            <button type="button"><a href="/DeleteCollectionServlet?id=<%=artwork.getId()%>">取消收藏</a></button>
            <%
               }else{
            %>
            <button type="button"><a href="/AddCollectionServlet?id=<%=artwork.getId()%>">收藏</a></button>
            <%
                }
            %>
            <button type="button"><a href="/CollectionDirectoryServlet">查看收藏夹</a></button>

            <%
                }
                }
            %>
        </div>
    </div>
</div>
</body>
</html>
