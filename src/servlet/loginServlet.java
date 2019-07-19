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
        String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        String rePassword = request.getParameter("rePassword");
        String emailAddress = request.getParameter("emailAddress");
        String verifyCode = request.getParameter("verifyCode");
        String power = request.getParameter("power");

        String sql = "SELECT * FROM USERS WHERE NAME = ?" ;

        HttpSession session = request.getSession();

        if (isExit(sql,userName)){
            response.sendRedirect("Login.jsp");
        }else {
            if (isNameLegal(userName) && isEmailAddress(emailAddress) && isPasswordLegal(password) && isPasswordLegal(password,rePassword) && isVerifyCode(verifyCode)){
                boolean isPower = false;
                if (power != null){
                    isPower = true;
                }
                String sqlInsert = "INSERT INTO USERS(name,password,privilege,email,collections,friends) VALUE (?,?,?,?,?,?)";

                update(sqlInsert,userName,password,isPower,emailAddress,"","");


                User user = getUser(sql,userName);
                session.setAttribute("userName",userName);
                session.setAttribute("password",password);
                session.setAttribute("user",user);
                response.sendRedirect("/JSP/Home.jsp");
            }else {
                response.sendRedirect("/JSP/Login.jsp");
            }
        }
    }


    private boolean isNameLegal(String name){
        if (name == null || name.equals("")){
            return false;
        }
        return (name.length() >= 4 && name.length() <= 15);
    }

    private boolean isVerifyCode(String verifyCode){
        return true;
    }

    private boolean isPasswordLegal(String password){
        if (password == null || password.equals("")){
            return false;
        }
        String regex = "^[a-z0-9A-Z]+$";
        return (password.length() >= 6 && password.length() <= 10) &&  password.matches(regex);
    }

    private boolean isPasswordLegal(String password,String rePassword){
        return password.equals(rePassword);
    }

    private boolean isEmailAddress(String emailAddress){
        if (emailAddress == null || emailAddress.equals("")){
            return false;
        }

        //字母开头，@后加字母或数字，后面加点，后面字母或数字
        String regex1 = "[a-zA-Z]+[a-zA-Z0-9_]*@[a-zA-Z0-9]+[.][a-zA-Z0-9]+";

        //..........在regex1基础上，后面加.和其他字母组成的后缀
        String regex2 = "[a-zA-Z]+[a-zA-Z0-9_]*@[a-zA-Z0-9]+[.][a-zA-Z0-9]+[.][a-zA-Z0-9]+";
        return emailAddress.matches(regex1) || emailAddress.matches(regex2);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
