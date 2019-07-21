<%--
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
        <tr>
            <td>
                <table class="collection">
                    <tr>
                        <td rowspan="2">
                            <img src="../img/金石/古父己卣.jpg" height="150px" width="150px">
                        </td>
                        <td>
                            古父己卣
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button type="button"><a href="ExhibitionDetails.jsp">详情</a></button>
                            <button type="button"><a href="#">取消收藏</a></button>
                        </td>
                    </tr>

                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table class="collection">
                    <tr>
                        <td rowspan="2">
                            <img src="../img/金石/古父己卣.jpg" height="150px" width="150px">
                        </td>
                        <td>
                            古父己卣
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button type="button"><a href="ExhibitionDetails.jsp">详情</a></button>
                            <button type="button"><a href="#">取消收藏</a></button>
                        </td>
                    </tr>

                </table>
            </td>
        </tr>
    </table>
</section>
</body>
</html>
