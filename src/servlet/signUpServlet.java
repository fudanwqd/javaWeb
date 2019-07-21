package servlet;

import dao.FriendsRequestDao;
import dao.UserDao;
import entity.FriendsRequest;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import static dao.UserDao.*;

@WebServlet("/signUp")
public class signUpServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");

        String sql = "SELECT * FROM USERS WHERE NAME = ? AND PASSWORD = ?" ;
        User user = getUser(sql,userName,password);

        if (user != null){
            String sqlUpdate = "UPDATE USERS SET RECENTSIGNUP = ? WHERE NAME = ?";
            update(sqlUpdate,new Date(),userName);
            session.setAttribute("user",user);

            String sqlFriends = "SELECT * FROM FRIENDSRELATION WHERE USERID = ?";
            ArrayList<User> myFriends = getUsers(sqlFriends,2,user.getUserID());
            session.setAttribute("myFriends",myFriends);

            String sqlFriendsRequest = "SELECT * FROM FRIENDSREQUESTS WHERE RECIPIENTID = ?";
            ArrayList<FriendsRequest> friendsRequests = FriendsRequestDao.getFriendsRequest(sqlFriendsRequest,user.getUserID());
            session.setAttribute("friendRequests",friendsRequests);


            response.sendRedirect("/JSP/Home.jsp");
        }else {
            response.sendRedirect("/JSP/SignUp.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
