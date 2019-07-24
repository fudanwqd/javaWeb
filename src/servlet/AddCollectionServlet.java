package servlet;

import dao.ArtworkDao;
import dao.CollectionrelationDao;
import dao.UserDao;
import entity.Artwork;
import entity.Collectionrelation;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/AddCollectionServlet")
public class AddCollectionServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user  = (User)session.getAttribute("user");
        int artworkID =  Integer.parseInt(request.getParameter("id"));
        CollectionrelationDao.AddCollectionByDoubleId(user.getUserID(),artworkID);
        List<Collectionrelation> collections = CollectionrelationDao.selectCollectionById(user.getUserID());
        session.setAttribute("mycollections",collections);
        List<Artwork> dynamicArtworks = ArtworkDao.dynamicArtwork(user);
        session.setAttribute("dynamicArtworks",dynamicArtworks);
        List<User> dynamicFriends = UserDao.dynamicFriends(user);
        session.setAttribute("dynamicFriends",dynamicFriends);
        response.sendRedirect("/ExhibitionDetailsServlet?id="+artworkID+"&succeed=3");
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
        doPost(request,response);
    }
}
