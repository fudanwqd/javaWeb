<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.User" %>
<%@ page import="java.util.Map" %>
<%@ page import="entity.Message" %>
<%@ page import="static dao.MessageDao.getMessages" %>
<%@ page import="java.util.Iterator" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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
    <title>信箱</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div class="row">
    <%
        User user = (User) request.getSession().getAttribute("user");
        String sql1 = "SELECT * FROM FRIENDMESSAGES WHERE SENDID = ? OR RECEIVEID = ?";
        Map<User, ArrayList<Message>> chatMessages = getMessages(sql1,user.getUserID());

        for (Iterator iter = chatMessages.keySet().iterator(); iter.hasNext();) {
            Object key = iter.next();
            User friend = (User) key;
            ArrayList<Message> messages = chatMessages.get(friend);
    %>

    <div class="card col-lg-3">
        <h2><%=friend.getName()%></h2 >
        <div>
            <%
            for (Message message : messages) {
            %>
            <text><%=message.getDate().toString() %></text >
            <br >
            <text >
                <%=message.getSender().getName() %> -- >
                <%=message.getReceiver().getName()%></text >
            <br >
            <text >
                <%=message.getMessages() %></text >
            <br>
                <%
            }
            %>
        </div>
        <form action="/sendMessage?id=<%=friend.getUserID()%>" method="post">
            <label>想对TA说的话：</label>
            <input type="text" name="message">
            <a><button type="submit" class="btn btn-default btn-primary" >发 送</button></a>
        </form>
    <%
        }
    %>
    </div>


</body>
</html>
