package servlet;

import dao.ArtworkDao;
import dao.CollectionrelationDao;
import dao.UserDao;
import entity.Artwork;
import entity.Collectionrelation;
import entity.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/getFriendInfo")
public class getFriendInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String sql = "SELECT * FROM USERS WHERE NAME = ?";
        User friend = UserDao.getUser(sql,name);
//        String sql1 = "SELECT * FROM COLLECTIONRELATION WHERE USERID = ?";
//        List<Artwork> artworks = ArtworkDao.selectArtworks(sql1,friend.getUserID());
        List<Collectionrelation> collections = CollectionrelationDao.selectCollectionById(friend.getUserID());
        List<Artwork> artworks = ArtworkDao.getFromRelation(collections);
        request.setAttribute("collections",artworks);
        request.setAttribute("friend",friend);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/JSP/FriendInformation.jsp");
        requestDispatcher.forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doPost(request,response);
    }
}
