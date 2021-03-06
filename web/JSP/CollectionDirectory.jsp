<%@ page import="entity.User" %>
<%@ page import="entity.Artwork" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Date" %>
<%@ page import="entity.Collectionrelation" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2019/7/12
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>收藏夹</title>

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
            List<Collectionrelation> collectionrelations = (List<Collectionrelation>)session.getAttribute("mycollections");
            if(collections==null){
                response.sendRedirect("/CollectionDirectoryServlet");
            }else{
            if(collections.size()>0){
//                for(int i=0;i<collections.size();i++){
                int num=0;
                for(int i=collections.size()-1;i>=0&&num<15;i--){
                    num++;
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
                        <td>收藏时间：<%=collectionrelations.get(i).getCollectTime()%></td>
                    </tr>
                    <tr>
                        <td> 馆藏：<%=collections.get(i).getLocation()%></td>
                        <td> 热度：<%=collections.get(i).getHot()%></td>
                    </tr>
                    <tr>
                        <td>
                            <button type="button"><a href="/ExhibitionDetailsServlet?id=<%=collections.get(i).getId()%>">详情</a></button>
                        </td>
                        <td>
                            <button type="button"><a href="/DeleteCollectionServlet?id=<%=collections.get(i).getId()%>">取消收藏</a></button>
                        </td>
                        <td>
                        <%
                                if(collectionrelations.get(i).isPublic()){
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
        <div class="row text-center">暂无藏品！快去收藏一件吧！</div>
        <%
                }

        %>

    </table>
    <h2 class="text-center">猜您喜欢</h2>
    <table>
        <%
            List<Artwork> dynamicArtworks = (List<Artwork>) session.getAttribute("dynamicArtworks");
            if(dynamicArtworks.size()>0){
                 for(int i=0;i<dynamicArtworks.size();i++){
                     %>
        <tr>
            <td>
                <table class="collection">
                    <tr>
                        <td rowspan="3">
                            <img src=<%=dynamicArtworks.get(i).getImgPath()%> height="150px" width="150px">
                        </td>
                        <td>
                            <%=dynamicArtworks.get(i).getName()%>
                        </td>
                        <td>
                            热度：<%=dynamicArtworks.get(i).getHot()%>
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="2"> <%=dynamicArtworks.get(i).getDescription().substring(0,40)+"..."%></td>
                        <td> <button type="button"><a href="/ExhibitionDetailsServlet?id=<%=dynamicArtworks.get(i).getId()%>">详情</a></button></td>
                    </tr>
                    <tr>
                        <td><button type="button"><a href="/AddCollectionServlet?id=<%=dynamicArtworks.get(i).getId()%>">收藏</a></button></td>
                    </tr>
                </table>
            </td>
        </tr>
        <%

                 }
            }else{
                %>
        <div class="row text-center">暂无推荐啦！快去搜索一下吧！</div>
        <%
            }
            }
        %>
    </table>
</section>
</body>
</html>
