package servlet;

import entity.User;
import util.DBconnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import static dao.UserDao.getUser;
import static dao.UserDao.update;

@WebServlet("/requestFriend")
public class requestFriendServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String value = request.getParameter("value");
        User user = (User) request.getSession().getAttribute("user");

        if (value.equals("1")){
            String sql = "INSERT INT FRIENDSRELATION(USERID,FRIENDID) VALUES (?,?)";
            update(sql,id,user.getUserID());
            update(sql,user.getUserID(),id);
        }
        String sql = "UPDATE FRIENDSREQUESTS SET STATUS = ?";
        update(sql,value);
    }
}
