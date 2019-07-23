package servlet;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static dao.UserDao.update;

@WebServlet("/deleteUser")
public class deleteUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
doGet(request,response);
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String sql = "DELETE FROM USERS WHERE ID = ?";
        update(sql,id);

        String sqlFriendRequests = "DELETE FROM FRIENDSREQUESTS WHERE SENDERID = ? OR RECIPIENTID = ?";
        update(sqlFriendRequests,id,id);

        String sqlFriendsRelation = "DELETE FROM FRIENDSRELATION WHERE USERID = ? OR FRIENDID = ?";
        update(sqlFriendsRelation,id,id);

        String sqlFriendsMessage = "DELETE FROM FRIENDMESSAGES WHERE SENDID = ? OR RECEIVEID = ?";
        update(sqlFriendsMessage,id,id);

        response.sendRedirect("/JSP/UserManage.jsp");
    }
}
