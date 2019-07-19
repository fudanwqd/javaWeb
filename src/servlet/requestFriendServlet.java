package servlet;

import entity.User;
import util.DBconnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static dao.UserDao.update;

@WebServlet(name = "requestFriendServlet")
public class requestFriendServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String admit = request.getParameter("power");

        User friend = (User) request.getSession().getAttribute("friend");
        User user = (User) (request.getSession().getAttribute("user"));

        if (admit.equals("同意")){
            user.getFriends().add(friend.getUserID() + "");
            StringBuilder str = new StringBuilder();
            for (String temp : user.getFriends()){
                str.append(temp);
                str.append(",");
            }
            String sql = "update users set friend = ? where id = ?";
            update(sql,str.toString(),user.getUserID());
        }

        String sql1 = "delete from FRIENDSREQUESTS where RECIPIENTID = ?";
        update(sql1,user.getUserID());
        response.sendRedirect("/JSP/User.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
