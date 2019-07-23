package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static dao.UserDao.update;

@WebServlet("/setUser")
public class setUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String name = request.getParameter("name");
        String privilege = request.getParameter("privilege");
        int power = 1;
        if (privilege.equals("true")) {
            power = 0;
        }

        String sql = "UPDATE USERS SET PRIVILEGE ='" + power + "' where NAME = ?";
        update(sql, name);
        response.sendRedirect("/JSP/UserManage.jsp");
    }
}
