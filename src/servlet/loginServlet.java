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
    }




    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("name");
        String password = request.getParameter("password");
        String emailAddress = request.getParameter("email");
        String power = request.getParameter("power");
        System.out.println(power);
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
                System.out.println("2222");
            }
            String sqlInsert = "INSERT INTO USERS(name,password,privilege,email) VALUE (?,?,?,?)";
            update(sqlInsert, userName, password, isPower, emailAddress);


            if (page.equals("1")) {
                User user = getUser(sql, userName);
                session.setAttribute("user", user);
                response.sendRedirect("/JSP/Home.jsp");
            }else {
                response.sendRedirect("/JSP/UserManage.jsp");
            }
        }

    }
}
