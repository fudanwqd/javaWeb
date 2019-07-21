package servlet;

import dao.CollectionrelationDao;
import entity.Collectionrelation;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
            session.setAttribute("user",user);
            String sqlUpdate = "UPDATE USERS SET RECENTSIGNUP = ? WHERE NAME = ?";
            update(sqlUpdate,new Date(),userName);
            String sqlFriends = "SELECT * FROM FRIENDSRELATION WHERE USERID = ?";
            ArrayList<User> myFriends = getUsers(sqlFriends,2,user.getUserID());
            session.setAttribute("myFriends",myFriends);
            List<Collectionrelation> collections = CollectionrelationDao.selectCollectionById(user.getUserID());
            session.setAttribute("mycollections",collections);
            response.sendRedirect("/JSP/Home.jsp");
        }else {
            response.sendRedirect("/JSP/SignUp.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
