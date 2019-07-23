package servlet;

import dao.ArtworkDao;
import entity.Artwork;
import jdk.nashorn.internal.runtime.AllocationStrategy;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("gb2312");
        String search = request.getParameter("search");
        int page = Integer.parseInt(request.getParameter("page"));
        String type = request.getParameter("type");
        PrintWriter out = response.getWriter();
        String content = "";
        List<Artwork> Allsearches;
        if (search.equals("") || search == null) {
            if (type.equals("“normal”")) {
                Allsearches = ArtworkDao.SearchAll();
            } else {
                Allsearches = ArtworkDao.SearchAllOrderByHotdesc();
            }
        } else {
            if (type.equals("“normal”")) {
                Allsearches = ArtworkDao.SearchAllLikeName(search);
            } else {
                Allsearches = ArtworkDao.SearchAllLikeNameOrderByHotdesc(search);
            }
        }
        if (Allsearches.size() > 0) {
            int Allpage;
            if (Allsearches.size() % 9 != 0) {
                Allpage = Allsearches.size() / 9 + 1;
            } else {
                Allpage = Allsearches.size() / 9;
            }
            if (page > Allpage) {
                page = Allpage;
            }
            if (page < 1) {
                page = 1;
            }
            int prePage = page - 1;
            int nextPage = page + 1;
            List<Artwork> searches;
            if (search.equals("")) {
                if (type.equals("“normal”")) {
                    searches = ArtworkDao.SearchLimit((page - 1) * 9, 9);
                } else {
                    searches = ArtworkDao.SearchLimitOrderByHotdesc((page - 1) * 9, 9);
                }
            } else {
                if (type.equals("“normal”")) {
                    searches = ArtworkDao.SearchLimitLikeName(search, (page - 1) * 9, 9);
                } else {
                    searches = ArtworkDao.SearchLimitLikeNameOrderByHotdesc(search, (page - 1) * 9, 9);
                }
            }
            int row;
            if (searches.size() % 3 == 0) {
                row = searches.size() / 3;
            } else {
                row = searches.size() / 3 + 1;
            }

            for (int i = 0; i < row; i++) {
                content+=("<tr>");
                for (int j = 3 * i; j < searches.size() && j < 3 * (i + 1); j++) {
                    content+=("          <td>\n" +
                            "                    <table class=\"frame\">\n" +
                            "                        <tr>\n" +
                            "                            <td rowspan=\"2\" ><img class=\"showPicture\" src=" + searches.get(j).getImgPath() + ">\n" +
                            "                            </td>\n" +
                            "                            <td>" + searches.get(j).getName() + "\n" +
                            "                            </td>\n" +
                            "                        </tr>\n" +
                            "                        <tr>\n" +
                            "                            <td>朝代：" + searches.get(j).getTime() + "\n" +
                            "                            </td>\n" +
                            "                        </tr>\n" +
                            "                        <tr>\n" +
                            "                            <td colspan=\"2\"> <p class=\"description\">" + searches.get(j).getDescription() + "</p>\n" +
                            "                            </td>\n" +
                            "                        </tr>\n" +
                            "                        <tr>\n" +
                            "                            <td colspan=\"2\">\n" +
                            "                                <span class=\"text-center\"><button type=\"button\"><a href=\"/ExhibitionDetailsServlet?id=" + searches.get(j).getId() + "\">详情</a></button></span>\n" +
                            "                            </td>\n" +
                            "                        </tr>\n" +
                            "                    </table>\n" +
                            "                </td>");
                }
                content+=("</tr>");
            }
            content+=("<div style='position:absolute;left:45%; ' >\n" +
                    "                    <ul class=\"pagination\">\n" +
                    "                        <li><a href=\"javascript:paging(" + prePage + "," + search + ")\">&laquo;</a></li>");
            for (int i = 0; i < Allpage; i++) {
                content+=(" <li><a href=\"javascript:paging(" + (i + 1) + "," + search + ")\">" + (i + 1) + "</a></li>");
            }
            content+=("<li><a href=\"javascript:paging(" + nextPage + "," + search + ")\">&raquo;</a></li>");
            content+=(" <li>共" + Allpage + "页</li>\n" +
                    "                        <li>当前是第" + page + "页</li>");
            content+=("</ul></div>");



        } else {
            content+=("<div class=\"row text-center\">无搜索结果！</div>");
        }
        out.println(content);
        //      request.setAttribute("limitsearches",searches);
//        int count = 0;
//        int total = 0;
//        int total_next = 2;
//        request.setAttribute("next",total_next);
//        int total_prev =0;
//
//
//
//        count = searches.size();
//
//            int flag = 9;
//            int page  =1;
//            if(count!=0){
//                if (count/flag == 0){
//                    page = count/flag;
//                    request.setAttribute("last",page);
//
//                }else {
//                    page = count/flag+1;
//                    request.setAttribute("last",page);
//                }
//            }
//        if(request.getParameter("page") != null) {
//            total_prev = Integer.parseInt(request.getParameter("page"))-1;
//            request.setAttribute("prev",total_prev);
//            total = (Integer.parseInt(request.getParameter("page"))-1)*flag;
//            total_next = Integer.parseInt(request.getParameter("page"))+1;
//            request.setAttribute("next",total_next);
//
//        }
//            List limitSearches = ArtworkDao.SearchLimitByName(search,total,flag);
//
//        request.setAttribute("limitsearches",limitSearches);
//        System.out.println(123123);
//        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/JSP/Search.jsp");
//        requestDispatcher.forward(request,response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
