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
        String count = (String) session.getAttribute("count");

        if (count == null){
            session.setAttribute("page",page);
            session.setAttribute("count","2222");
        }else {
            page = (String) session.getAttribute("page");
        }

//        if (userName.equals("Admin")){
//            password = "123456";
//        }

        String sql = "SELECT * FROM USERS WHERE NAME = ? AND PASSWORD = ?" ;
        User user = getUser(sql,userName,password);
//        System.out.println(user.toString());

        if(page==null||page.equals("")){
            page="/JSP/Home.jsp";
        }
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
            session.removeAttribute("page");
            session.removeAttribute("count");
            response.sendRedirect(page+"?succeed=1");
        }else {
            response.sendRedirect("/JSP/SignUp.jsp?error=1");
        }
    }
}
