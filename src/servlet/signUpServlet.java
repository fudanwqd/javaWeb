package servlet;

import dao.ArtworkDao;
import dao.CollectionrelationDao;
import dao.FriendsRequestDao;
import dao.UserDao;
import entity.Artwork;
import entity.Collectionrelation;
import entity.FriendsRequest;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static dao.UserDao.*;

@WebServlet("/signUp")
public class signUpServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userName = request.getParameter("name");
        String password = request.getParameter("password");
        String page = request.getParameter("page");


        response.getWriter().write(page);
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
            List<Collectionrelation> collections = CollectionrelationDao.selectCollectionById(user.getUserID());
            session.setAttribute("mycollections",collections);
            List<User> dynamicFriends = UserDao.dynamicFriends(user);
            session.setAttribute("dynamicFriends",dynamicFriends);
            List<Artwork> dynamicArtworks = ArtworkDao.dynamicArtwork(user);
            session.setAttribute("dynamicArtworks",dynamicArtworks);
            response.sendRedirect(page);
//            response.sendRedirect("/JSP/SignUp.jsp?go=1");
        }else {
            response.sendRedirect("/JSP/SignUp.jsp?error=1");
        }
    }
}
