<%@ page import="entity.Artwork" %>
<%@ page import="java.util.List" %>
<%@ page language="java" pageEncoding="utf-8" %>
<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2019/7/12
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<meta charset="utf-8">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/AdminLTE.css">
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="../js/adminlte.js"></script>
<script src="../js/bootstrap-table.js"></script>
<script src="../js/bootstrap-table-zh-CN.js"></script>
<script src="../js/bootstrap-table-treegrid.js"></script>
<script src="../js/jquery.treegrid.min.js"></script>
<script src="../js/bootstrap-tab.js"></script>
<head>
    <title>展品搜索</title>
</head>
<style>
    .showPicture{
        height: 100px;
        width: 100px;
    }
    .frame{background-color: beige;
        margin:2px 20px;
        border: outset;
        border-color: black;
        border-width: 3px;
        width: 350px;
        height: 350px;}


    .description{
        overflow:hidden;
        text-overflow : ellipsis;
        height:200px;

    }
</style>
<body>
<jsp:include page="header.jsp"></jsp:include>

<div class="container">
    <div class="row">
        <div class="col-lg-6 col-lg-offset-3">
            <div class="input-group">
                <input type="text" class="form-control" id="search" onkeydown="onKeyDown(event)">
                <span class="input-group-addon"><a onclick="doSearch()"><i class="glyphicon glyphicon-search"></i></a></span>
            </div>
            <div>
                排序方式：
                <input type="radio" name="selection" value=“normal” checked="checked">默认
                <input type="radio" name="selection" value="hot" >热度

            </div>
        </div>
    </div>
    <section>
        <h2>搜索结果：</h2>
        <table id="searchdiv">
        </table>
    </section>
    <script type="text/javascript">
        $(document).ready(function() {
           doSearch();
        });
        function onKeyDown(event) {
            var e = event || window.event || arguments.callee.caller.arguments[0];
            if (e && e.keyCode == 13) { // enter 键
                doSearch();
            }

        }
        $(document).ready(function() {
            $('input[type=radio][name=selection]').change(function () {
                doSearch();
            });
        });
        function doSearch() {
           var searchValue = document.getElementById("search").value;
            var types =  document.getElementsByName("selection");
            var type = null;
            for(var i=0;i<types.length;i++){
                if(types[i].checked){
                  type = types[i].value;
                }
            }
            paging(1,searchValue,type);
        }

        function paging(page,search="",type) {
            var xmlhttp;
            if (window.XMLHttpRequest)
            {
                //  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
                xmlhttp=new XMLHttpRequest();
            }
            else
            {
                // IE6, IE5 浏览器执行代码
                xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
            }

            xmlhttp.onreadystatechange=function(){

                if (xmlhttp.readyState==4 && xmlhttp.status==200)
                {
                    document.getElementById("searchdiv").innerHTML=xmlhttp.responseText;
                }
            };
            xmlhttp.open("GET","/SearchServlet?page="+page+"&search="+search+"&type="+type,true);
            xmlhttp.send();
        }
    </script>
</div>
</body>
</html>
