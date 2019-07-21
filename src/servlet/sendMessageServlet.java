package servlet;

import entity.Message;
import entity.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

import static dao.MessageDao.getMessages;
import static dao.UserDao.update;

@WebServlet("/sendMessage")
public class sendMessageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String message = request.getParameter("message");
        int id = Integer.parseInt(request.getParameter("id"));

        User user = (User) request.getSession().getAttribute("user");
        String sql = "INSERT INTO FRIENDMESSAGES(SENDID,RECEIVEID,MESSAGE_TeXT) VALUES(?,?,?)";
        update(sql,user.getUserID(),id,message);

        response.sendRedirect("/JSP/Chat.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
