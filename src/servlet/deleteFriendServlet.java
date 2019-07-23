package servlet;

import dao.UserDao;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import static dao.UserDao.getUsers;
import static dao.UserDao.update;

@WebServlet("/deleteFriend")
public class deleteFriendServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        User user = (User) request.getSession().getAttribute("user");
        int idd = Integer.parseInt(id);

        String sql = "DELETE FROM FRIENDSRELATION WHERE USERID = ? AND FRIENDID = ?";
        update(sql,idd,user.getUserID());
        update(sql,user.getUserID(),idd);

        String sqlFriends = "SELECT * FROM FRIENDSRELATION WHERE USERID = ?";
        ArrayList<User> myFriends = getUsers(sqlFriends,2,user.getUserID());
        request.getSession().setAttribute("myFriends",myFriends);
        String sqlFriendsMessage = "DELETE FROM FRIENDMESSAGES WHERE SENDID = ? OR RECEIVEID = ?";
        update(sqlFriendsMessage,id,id);
        List<User> dynamicFriends = UserDao.dynamicFriends(user);
        request.getSession().setAttribute("dynamicFriends",dynamicFriends);

        response.sendRedirect("/JSP/Friends.jsp");
    }
}
