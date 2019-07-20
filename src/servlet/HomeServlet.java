package servlet;

import dao.ArtworkDao;
import entity.Artwork;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
        List<Artwork> hotArtworks = new LinkedList<>();
        List<Artwork> freshArtworks = new LinkedList<>();
        hotArtworks = ArtworkDao.SearchLimitByOrder("hot",3);
        freshArtworks = ArtworkDao.SearchLimitByOrder("uploadingTime",3);
        request.setAttribute("hotArtworks",hotArtworks);
        request.setAttribute("freshArtworks",freshArtworks);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/JSP/Home.jsp");
        requestDispatcher.forward(request,response);
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
        doPost(request,response);
    }
}

