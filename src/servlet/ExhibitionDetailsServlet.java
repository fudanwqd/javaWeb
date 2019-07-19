package servlet;

import dao.ArtworkDao;
import entity.Artwork;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ExhibitionDetailsServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
        int id = (int)request.getAttribute("id");
        Artwork artwork = ArtworkDao.SearchById(id).get(0);
        request.setAttribute("artwork",artwork);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/JSP/ExhibitionDetails.jsp");
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
       doPost(request,response);
    }
}
