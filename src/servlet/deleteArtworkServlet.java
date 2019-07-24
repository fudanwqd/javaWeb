package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static dao.UserDao.update;

@WebServlet("/deleteArtwork")
public class deleteArtworkServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String sql = "DELETE FROM ARTWORK WHERE ID = ?";
        update(sql,id);


        sql = "DELETE FROM COLLECTIONRELATION WHERE ARTWORKID = ?";
        update(sql,id);
        response.sendRedirect("/JSP/WorkManage.jsp?succeed=5");
    }
}
