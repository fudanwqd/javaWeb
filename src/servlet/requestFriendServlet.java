package servlet;

import dao.ArtworkDao;
import dao.FriendsRequestDao;
import dao.UserDao;
import entity.Artwork;
import entity.FriendsRequest;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import static dao.UserDao.update;

@WebServlet("/requestFriend")
public class requestFriendServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String value = request.getParameter("value");
        User user = (User) request.getSession().getAttribute("user");

        if (value.equals("1")){
            String sql = "INSERT INTO FRIENDSRELATION(USERID,FRIENDID) VALUES (?,?)";
            update(sql,id,user.getUserID());
            update(sql,user.getUserID(),id);
            List<User> friends = (List<User>) request.getSession().getAttribute("myFriends");
            List<User> dynamicFriends = UserDao.dynamicFriends(user);
            request.getSession().setAttribute("dynamicFriends",dynamicFriends);
            friends.add(UserDao.getUser("SELECT * FROM USERS WHERE ID = ?",id));
        }

        String sql11 = "UPDATE FRIENDSREQUESTS SET STATUS = ? WHERE SENDERID = ? AND RECIPIENTID = ?";
        update(sql11,value,id,user.getUserID());

        String sqlFriendsRequest = "SELECT * FROM FRIENDSREQUESTS WHERE RECIPIENTID = ?";
        ArrayList<FriendsRequest> friendsRequests = FriendsRequestDao.getFriendsRequest(sqlFriendsRequest,user.getUserID());
        request.getSession().setAttribute("friendRequests",friendsRequests);

        response.sendRedirect("/JSP/User.jsp");
    }
}
