package servlet;

import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

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

        ArrayList<User> friends = (ArrayList<User>) request.getSession().getAttribute("myFriends");

        for (User friend : friends){
            if (friend.getUserID() == idd){
                friends.remove(friend);
                break;
            }
        }

        request.getSession().setAttribute("myFriends",friends);

        response.sendRedirect("/JSP/Friends.jsp");
    }
}
