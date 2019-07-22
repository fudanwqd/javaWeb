package servlet;

import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import static dao.UserDao.*;


@WebServlet("/login")
public class loginServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String userName = request.getParameter("name");
//        String password = request.getParameter("password");
//        String emailAddress = request.getParameter("emailAddress");
//        String power = request.getParameter("power");
//
//        String sql = "SELECT * FROM USERS WHERE NAME = ?" ;
//        HttpSession session = request.getSession();
//
//        if (isExit(sql,userName)){
//            response.sendRedirect("/JSP/Login.jsp?error=1");
//        }else {
//            boolean isPower = false;
//            if (power != null){
//                isPower = true;
//            }
//            String sqlInsert = "INSERT INTO USERS(name,password,privilege,email) VALUE (?,?,?,?)";
//            update(sqlInsert,userName,password,isPower,emailAddress);
//
//            User user = getUser(sql,userName);
//            session.setAttribute("user",user);
//            response.sendRedirect("/JSP/Home.jsp");
//        }
    }




    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("name");
        String password = request.getParameter("password");
        String emailAddress = request.getParameter("email");
        String power = request.getParameter("power");
        String page = request.getParameter("page");

        String sql = "SELECT * FROM USERS WHERE NAME = ?" ;
        HttpSession session = request.getSession();

        if (isExit(sql,userName)){
            if (page.equals("1")) {
                response.sendRedirect("/JSP/Login.jsp?error=1");
            }else {
                response.sendRedirect("/JSP/AddUser.jsp?error=1");
            }
        }else {
            boolean isPower = false;
            if (power.equals("admin")) {
                isPower = true;
            }
            String sqlInsert = "INSERT INTO USERS(name,password,privilege,email) VALUE (?,?,?,?)";
            update(sqlInsert, userName, password, isPower, emailAddress);

            User user = getUser(sql, userName);
            session.setAttribute("user", user);
            if (page.equals("1")) {
                response.sendRedirect("/JSP/Home.jsp");
            }else {
                response.sendRedirect("/JSP/UserManage.jsp");
            }
        }

    }
}
