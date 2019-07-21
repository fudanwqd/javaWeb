package servlet;

import dao.ArtworkDao;
import entity.Artwork;
import entity.Collectionrelation;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/ExhibitionDetailsServlet")
public class ExhibitionDetailsServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        Artwork artwork = ArtworkDao.SearchById(id);
        int prehot = artwork.getHot();
        ArtworkDao.UpdateHotById(id,prehot+1);
        Artwork newartwork = ArtworkDao.SearchById(id);
        request.setAttribute("artwork",newartwork);
        HttpSession session = request.getSession();
        List<Collectionrelation> collectionrelations =  (List<Collectionrelation>)session.getAttribute("mycollections");
        boolean hasCollect = false;
        if(collectionrelations!=null){
            for(int i=0;i<collectionrelations.size();i++){
                if(collectionrelations.get(i).getArtworkID()==id){
                    hasCollect = true;
                }
            }
        }
        request.setAttribute("hasCollect",hasCollect);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/JSP/ExhibitionDetails.jsp");
        requestDispatcher.forward(request,response);
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
       doPost(request,response);
    }
}
