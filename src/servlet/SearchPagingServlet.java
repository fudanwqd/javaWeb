package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/SearchPagingServlet")
public class SearchPagingServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {

    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
        doGet(request,response);
    }
}
