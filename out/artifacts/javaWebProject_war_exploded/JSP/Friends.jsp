<%@ page import="entity.User" %>
<%@ page import="static dao.UserDao.getUser" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.UserDao" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>我的好友</title>
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
</head>

<style>
    table{
        width:100%;
    }
    th{
        text-align: center;
        width: 100px;
    }
    td{
       text-align: center;
        width: 100px;
    }
    .floatDiv{
        width: 49%;
        height: 80%;
        border: 1px ridge #b3d7ff;
        background-color: aliceblue;
    }
    #search{
        margin:0;
        padding: 0;
        border: 0;
    }
</style>

<body>
<%
    //    User user = (User) session.getAttribute("user");
    String sql1 = "SELECT * FROM USERS WHERE ID = 1";
    User user = getUser(sql1);
%>

<jsp:include page="header.jsp"></jsp:include>

<div class="floatDiv" id="searchDiv" style="float: right;" >
<div class="row">
    <div class="col-lg-6 col-lg-offset-3">
        <div class="input-group">
            <input type="text" class="form-control" id="friendsearch" onkeydown="onKeyDown(event)" >
            <span class="input-group-addon"><button onclick="dofriendsSearch()" id="search"><i class="glyphicon glyphicon-search"></i></button></span>
        </div>
    </div>
</div>
<div style="text-align: center">
    <div id="searchinner">
<table>
    <tr>
        <th>用户名</th>
        <th>邮箱</th>
        <th>个性签名</th>
        <th>添加好友</th>
    </tr>
    <div class="text-center"><h4 style="color: grey" >通过关键字去搜索好友吧！</h4></div>
</table>
    </div>
<%--<%--%>
    <%--List<User> searchFriends = (List<User>) request.getAttribute("searchFriends");--%>
    <%--if(searchFriends!=null){--%>
    <%--if(searchFriends.size()==0){--%>
      <%--%>--%>
    <%--<div class="text-center">没有找到符合的用户哦！ </div>--%>
    <%--<%--%>
    <%--}else{--%>
        <%--for(int i=0;i<searchFriends.size();i++){--%>
          <%--%>--%>
    <%--<tr>--%>
        <%--<td><%=searchFriends.get(i).getName()%></td>--%>
        <%--<td><%=searchFriends.get(i).getEmail()%></td>--%>
        <%--<td><%=searchFriends.get(i).getSignature()%></td>--%>
        <%--<td><button><a href="#">添加好友</a></button></td>--%>
    <%--</tr>--%>
    <%--<%--%>
        <%--}--%>
    <%--}--%>
    <%--}else{--%>
        <%--%>--%>
    <%--<div class="text-center"><h4 style="color: grey" >通过关键字去搜索好友吧！</h4> </div>--%>
    <%--<%--%>
        <%--}--%>
<%--%>--%>
<%--</table>--%>

</div>
    <%
        List<User> dynamicFriends = (List<User>)session.getAttribute("dynamicFriends");

    %>
    <div>
        <h2>猜您喜欢：</h2>
        <table>
            <tr>
                <th>用户名</th>
                <th>邮箱</th>
                <th>个性签名</th>
                <th>添加好友</th>
            </tr>
            <%
                if(dynamicFriends!=null&&dynamicFriends.size()>0){
                    for(int i=0;i<dynamicFriends.size();i++){
            %>
            <tr>
                <td>
                    <%=dynamicFriends.get(i).getName()%>
                </td>
                <td>
                    <%=dynamicFriends.get(i).getEmail()%>
                </td>
                <td>
                    <%=dynamicFriends.get(i).getSignature()%>
                </td>
                <td>
                    <button><a href="#">添加好友</a></button>
                </td>
            </tr>
            <%
                }
            }else{
            %>
            <div class="text-center">哎呀！猜不到啦！试着去搜索一下吧！ </div>
            <%
                }
            %>
        </table>


    </div>
</div>

<div class="divBorder floatDiv" style="float: left;">
    <div class="form-inline" style="text-align: center">
        <div class="input-group">

            <h2>我的好友</h2>
                <%
                    ArrayList<User> myFriends = (ArrayList<User>) session.getAttribute("myFriends");
                    if (myFriends != null && myFriends.size() > 0){
                    for (User tempUser: myFriends){
                %>
<%--                <form action="" method="post" role="form">--%>
                    <div class="card">
                        <div class="card-body">
                            <div class="card-view">
                                <img src="../img/1.png" class="img-circle" alt="User Image">
                            </div>
                            <p class="navbar-text myLine">用户名:<%=tempUser.getName()%></p>
                            <p class="navbar-text myLine">电子邮箱:<%=tempUser.getEmail()%></p>
                            <p class="navbar-text myLine">个性签名:<%=tempUser.getSignature()%></p>
                        </div>
                        <form action="/sendMessage?id=<%=tempUser.getUserID()%>" method="post">
                            <label>想对TA说的话：</label>
                            <input type="text" name="message">
                            <a><button type="submit" class="btn btn-default btn-primary" >发 送</button></a>
                        </form>
                        <%=
                        "<a href='/deleteFriend?id=" + tempUser.getUserID() + "' <button class='btn btn-default btn-primary'>删 除</button></a>" +
                        "<a href='/getFriendInfo?name=" + tempUser.getName() + "' <button class='btn btn-default btn-primary'>查 看</button></a>"
                        %>
                    </div>

<%--                </form>--%>

<%--                <%--%>
<%--                    String str = " <a href='FriendInformation.jsp?name="+--%>
<%--                            tempUser.getName()+"'> <button class='btn btn-default btn-primary'>查 看</button></a>";--%>
<%--                %>--%>
<%--                <%=str%>--%>
                <%
                        }
                    }else {
                %>
                    <text>目前还没有好友哦~快去添加好友</text>
            <%
                }
            %>
        </div>
    </div>
</div>

<script type="text/javascript">

        // var search = document.getElementById("search");
        // search.onclick(dofriendsSearch());
    function onKeyDown(event) {
        var e = event || window.event || arguments.callee.caller.arguments[0];
        if (e && e.keyCode == 13) { // enter 键
            dofriendsSearch();
        }

    }


    function dofriendsSearch() {
        var friendsearch = document.getElementById("friendsearch").value;
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
                document.getElementById("searchinner").innerHTML=xmlhttp.responseText;
            }
        };
        xmlhttp.open("GET","/friendSearchServlet?friendsearch="+friendsearch,false);
        xmlhttp.send();
    }
</script>
</body>
</html>
