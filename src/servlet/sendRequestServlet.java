package servlet;

import dao.FriendsRequestDao;
import entity.FriendsRequest;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

import static dao.UserDao.update;

@WebServlet("/sendRequest")
public class sendRequestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User user = (User) request.getSession().getAttribute("user");
        int id = Integer.parseInt(request.getParameter("id"));


        String sql11 = "SELECT * FROM FRIENDSREQUESTS WHERE SENDERID = ? AND RECIPIENTID = ? AND STATUS = ?";
        ArrayList<FriendsRequest> temp = FriendsRequestDao.getFriendsRequest(sql11,user.getUserID(),id,0);

        if (temp != null && temp.size() > 0){
            response.sendRedirect("/JSP/Friends.jsp?error=1");
        }else {
            String sql = "insert into friendsRequests (senderId,recipientId,status) values(?,?,?)";
            update(sql,user.getUserID(),id,0);
            String sqlFriendsRequest = "SELECT * FROM FRIENDSREQUESTS WHERE RECIPIENTID = ?";
            ArrayList<FriendsRequest> friendsRequests = FriendsRequestDao.getFriendsRequest(sqlFriendsRequest,user.getUserID());
            request.getSession().setAttribute("friendRequests",friendsRequests);
            response.sendRedirect("/JSP/Friends.jsp?succeed=4");
        }



    }
}
