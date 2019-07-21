package servlet;

import dao.ArtworkDao;
import dao.CollectionrelationDao;
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
import java.util.LinkedList;
import java.util.List;
import javax.servlet.http.HttpSession;
@WebServlet("/CollectionDirectoryServlet")
public class CollectionDirectoryServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
         HttpSession session = request.getSession();
        List<Collectionrelation> collectionrelations= (List<Collectionrelation>) session.getAttribute("mycollections");
        List<Artwork> collections = new LinkedList<>();
        List<Boolean> ispublics = new LinkedList<>();
        for(int i=0;i<collectionrelations.size();i++){
            Artwork aArtwork = ArtworkDao.SearchById(collectionrelations.get(i).getArtworkID());
            collections.add(aArtwork);
            ispublics.add(collectionrelations.get(i).isPublic());
        }
        request.setAttribute("collections",collections);
        request.setAttribute("collectionPublic",ispublics);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/JSP/CollectionDirectory.jsp");
        requestDispatcher.forward(request,response);
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
        doPost(request,response);
    }
}
