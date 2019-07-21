<%@ page import="entity.User" %>
<%@ page import="entity.Artwork" %>
<%@ page import="java.util.List" %><%--
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

    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>


<section>

    <h2 class="text-center">收藏夹</h2>
    <table>
        <%
            List<Artwork> collections = (List<Artwork>)request.getAttribute("collections");
            List<Boolean> ispublics = (List<Boolean>)request.getAttribute("collectionPublic");
            if(collections!=null){
                for(int i=0;i<collections.size();i++){
        %>
        <tr>
            <td>
                <table class="collection">
                    <tr>
                        <td rowspan="2">
                            <img src=<%=collections.get(i).getImgPath()%> height="150px" width="150px">
                        </td>
                        <td>
                            <%=collections.get(i).getName()%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button type="button"><a href="/ExhibitionDetailsServlet?id=<%=collections.get(i).getId()%>">详情</a></button>
                            <button type="button"><a href="/DeleteCollectionServlet?id=<%=collections.get(i).getId()%>">取消收藏</a></button>
                            <%
                                if(ispublics.get(i)){
                                    %>
                            <button type="button"><a href="/ChangeCollectionPublicServlet?id=<%=collections.get(i).getId()%>">设为私有收藏</a></button>
                            <%
                                }else{
                                    %>
                                    <button type="button"><a href="/ChangeCollectionPublicServlet?id=<%=collections.get(i).getId()%>">设为公开收藏</a></button>
                            <%
                                }
                            %>
                        </td>
                    </tr>

                </table>
            </td>
        </tr>


        <%
                }
        }else{
            %>
        <div class="row text-center">暂无藏品！快去收藏一件吧</div>
        <%
                }
        %>
    </table>
</section>
</body>
</html>
