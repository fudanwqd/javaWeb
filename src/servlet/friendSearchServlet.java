package servlet;

import com.alibaba.fastjson.JSONObject;
import dao.UserDao;
import entity.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;
@WebServlet("/friendSearchServlet")
public class friendSearchServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
        String research = request.getParameter("friendsearch");
        HttpSession session = request.getSession();
        List<User> friends = (List<User>)session.getAttribute("myFriends");
        System.out.println(research);
        List<User> searchFriends = new LinkedList<>();
        if(!research.equals("")) {
             searchFriends = UserDao.selectUsers("select * from users where name like ? or email like ?", "%" + research + "%", "%" + research + "%");
        }
        PrintWriter out = response.getWriter();
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append(" <table><tr>\n" +
                "        <th>用户名</th>\n" +
                "        <th>邮箱</th>\n" +
                "        <th>个性签名</th>\n" +
                "        <th>添加好友</th>\n" +
                "    </tr>");
        if(searchFriends.size()>0) {
            for (int i = 0; i < searchFriends.size(); i++) {

                stringBuilder.append("<tr>\n" +
                        "        <td>"+searchFriends.get(i).getName()+"</td>\n" +
                        "        <td>"+searchFriends.get(i).getEmail()+"</td>\n" +
                        "        <td>"+searchFriends.get(i).getSignature()+"</td>\n");

                if(UserDao.isExistIn(friends,searchFriends.get(i))){
                    stringBuilder.append("<td><button><a href=\"/getFriendInfo?name="+searchFriends.get(i).getName()+"\">查看</a></button></td></tr>");
                }else{
                    stringBuilder.append( "<td><button><a href=\"#\">添加好友</a></button></td>\n" +
                            "    </tr>");
                }
            }

        }else{
            stringBuilder.append("<div class=\"text-center\"><h4 color=\"grey\">没有找到符合的用户哦！</h4> </div>");
        }
        stringBuilder.append("</table>");
        out.println(stringBuilder);
//        request.setAttribute("searchFriends",searchFriends);
//        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/JSP/Friends.jsp");
//        requestDispatcher.forward(request,response);
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
        doPost(request,response);
    }
}
