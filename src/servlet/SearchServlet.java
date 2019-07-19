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
import java.util.List;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
        int count = 0;
        int total = 0;
        int total_next = 2;
        request.setAttribute("next",total_next);
        int total_prev =0;
        String search =request.getParameter("search");
        List<Artwork> searches = ArtworkDao.SearchAllByName(search);
        count = searches.size();

            int flag = 9;
            int page  =1;
            if(count!=0){
                if (count/flag == 0){
                    page = count/flag;
                    request.setAttribute("last",page);

                }else {
                    page = count/flag+1;
                    request.setAttribute("last",page);
                }
            }
        if(request.getParameter("page") != null) {
            total_prev = Integer.parseInt(request.getParameter("page"))-1;
            request.setAttribute("prev",total_prev);
            total = (Integer.parseInt(request.getParameter("page"))-1)*flag;
            total_next = Integer.parseInt(request.getParameter("page"))+1;
            request.setAttribute("next",total_next);

        }
            List limitSearches = ArtworkDao.SearchLimitByName(search,total,flag);

        request.setAttribute("limitsearches",limitSearches);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("JSP/Search.jsp");
        requestDispatcher.forward(request,response);
    }
}
