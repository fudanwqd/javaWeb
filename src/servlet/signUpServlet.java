package servlet;

import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

import static dao.UserDao.getUser;

@WebServlet(name = "/signUpServlet")
public class signUpServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");

        String sql = "SELECT * FROM USERS WHERE NAME = ? AND PASSWORD = ?" ;

        User user = getUser(sql,userName,password);
        if (user != null){
            session.setAttribute("user",user);
            response.sendRedirect("/JSP/Home.jsp");
        }else {
            response.sendRedirect("/JSP/SignUp.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
