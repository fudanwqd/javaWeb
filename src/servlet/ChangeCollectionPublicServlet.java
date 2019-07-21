package servlet;

import dao.ArtworkDao;
import dao.CollectionrelationDao;
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

@WebServlet("/ChangeCollectionPublicServlet")
public class ChangeCollectionPublicServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
           int artworkID =   Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        Collectionrelation collectionrelation = CollectionrelationDao.selectCollectionByDoubleId(user.getUserID(),artworkID);
        if(collectionrelation.isPublic()){
            CollectionrelationDao.UpdateCollectionPublicByDoubleId(0,user.getUserID(),artworkID);
        }else{
            CollectionrelationDao.UpdateCollectionPublicByDoubleId(1,user.getUserID(),artworkID);
        }
        List<Collectionrelation> collections = CollectionrelationDao.selectCollectionById(user.getUserID());
        session.setAttribute("mycollections",collections);
        response.sendRedirect("/CollectionDirectoryServlet");
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
        doPost(request,response);
    }

}
