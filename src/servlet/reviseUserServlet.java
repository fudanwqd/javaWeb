package servlet;

import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static dao.UserDao.getUser;
import static dao.UserDao.update;

@WebServlet("/reviseUser")
public class reviseUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String emailAddress = request.getParameter("email");
        String signature = request.getParameter("signature");
        String password = request.getParameter("password");

        User user = (User) request.getSession().getAttribute("user");
        if (user.getName().equals("Admin")){
            password = "123456";
        }


        if (!user.getName().equals(name)){
            String sql1 = "SELECT * FROM USERS WHERE NAME = ?";
            User temp = getUser(sql1,name);

            if (temp == null) {
                if (user.getPassword().equals(password)) {
                    user.setName(name);
                    user.setEmail(emailAddress);
                    user.setSignature(signature);
                    String sql = "update users set name = ?,EMAIL = ?,SIGNATURE = ? where id = ?";
                    update(sql, name, emailAddress, signature, user.getUserID());
                    response.sendRedirect("/JSP/User.jsp");
                } else {
                    response.sendRedirect("/JSP/SettingUser.jsp?error=1");
                }
            }else {
                response.sendRedirect("/JSP/SettingUser.jsp?error=2");
            }
        }else {
            if (user.getPassword().equals(password)) {
                user.setName(name);
                user.setEmail(emailAddress);
                user.setSignature(signature);
                String sql = "update users set name = ?,EMAIL = ?,SIGNATURE = ? where id = ?";
                update(sql, name, emailAddress, signature, user.getUserID());
                response.sendRedirect("/JSP/User.jsp");
            } else {
                response.sendRedirect("/JSP/SettingUser.jsp?error=1");
            }
        }


    }
}
