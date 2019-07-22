package servlet;

import entity.User;

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
        String name = request.getParameter("name");
        String emailAddress = request.getParameter("emailAddress");
        String signature = request.getParameter("signature");
        String password = request.getParameter("password");

        User user = (User) request.getSession().getAttribute("user");
        if (isEmpty(name) || isEmpty(emailAddress) || isEmpty(signature) || isEmpty(password)){
            response.sendRedirect("/JSP/SettingUser.jsp");
        }

        if (user.getPassword().equals(password)) {
            user.setName(name);
            user.setEmail(emailAddress);
            user.setSignature(signature);
            String sql = "update users set name = ?,EMAIL = ?,SIGNATURE = ? where id = ?";
            update(sql,name,emailAddress,signature,user.getUserID());
            response.sendRedirect("/JSP/User.jsp");
        }else {
            response.sendRedirect("/JSP/SettingUser.jsp");
        }

    }

    private boolean isEmpty(String str){
        return str==null || str.equals("");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String privilege = request.getParameter("privilege");

//        boolean power = true;
        int power = 1;
        if (privilege.equals("true")){
//            power = false;
            power = 0;
        }

        String sql = "UPDATE USERS SET PRIVILEGE ='" + power +"' where NAME = ?";
        update(sql,name);
        response.sendRedirect("/JSP/UserManage.jsp");
    }
}
