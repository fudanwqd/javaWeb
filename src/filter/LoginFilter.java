package filter;

import entity.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

//@WebFilter(filterName = "LoginFilter")
public class LoginFilter extends HttpFilter {
      private String sessionKey;
      private String redirectUrl;
      private String uncheckedUrls;
      public void init(){
          ServletContext  servletContext = getFilterConfig().getServletContext();
          sessionKey = servletContext.getInitParameter("userSessionKey");
          redirectUrl = servletContext.getInitParameter("redirectPage");
          uncheckedUrls = servletContext.getInitParameter("uncheckedUrls");
      }
    public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {
        String servletPath = request.getServletPath();
        List<String> urls = Arrays.asList(uncheckedUrls.split(","));
        if(urls.contains(servletPath)){
            chain.doFilter(request,response);
            return;
        }
        User user =(User) request.getSession().getAttribute(sessionKey);
        if (user == null) {
            response.sendRedirect(redirectUrl);
        }else{
            chain.doFilter(request,response);
        }

    }

}
