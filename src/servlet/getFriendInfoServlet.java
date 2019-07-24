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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/getFriendInfo")
public class getFriendInfoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String sql = "SELECT * FROM USERS WHERE id = ?";
        User friend = UserDao.getUser(sql,id);

        List<Collectionrelation> collectionrelations = CollectionrelationDao.selectCollectionById(id);

        List<Artwork> artworks = new ArrayList<>();

        for (Collectionrelation collectionrelation : collectionrelations){
            if (collectionrelation.isPublic()){
                artworks.add(ArtworkDao.SearchById(collectionrelation.getArtworkID()));
            }
        }


        request.setAttribute("artworks",artworks);
        request.setAttribute("friend",friend);

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/JSP/FriendInformation.jsp");
        requestDispatcher.forward(request,response);
    }
}
