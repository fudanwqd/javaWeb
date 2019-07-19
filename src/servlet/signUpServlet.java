package servlet;

import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Date;

import static dao.UserDao.getUser;
import static dao.UserDao.update;

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
            response.sendRedirect("/JSP/Home.jsp");
        }else {
            response.sendRedirect("/JSP/SignUp.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
