package servlet;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;
import java.util.UUID;


@WebServlet("/setArtwork")
public class setArtworkServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(1024 * 500);
        File tempFile = new File("D:\\a");
        factory.setRepository(tempFile);


        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setSizeMax(1024 * 1024 * 5);

        upload.setHeaderEncoding("UTF-8");


        try {
            List<FileItem> items = upload.parseRequest(request);
            for (FileItem item : items){
                if (item.isFormField()){
                    String value = item.getString("UTF-8");
                    System.out.println(value);
                    response.getWriter().write(value);
                }else{
                    String fileName = item.getString("UTF-8");

//                    InputStream in = item.getInputStream();
//                    byte[] buffer = new byte[1024];
//                    int len = 0;


                    String id = UUID.randomUUID().toString();
                    fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
                    fileName = id + fileName;
                    String realPath = "\\img\\" + fileName;
                    response.getWriter().write(realPath);
                    System.out.println(realPath);

//                    OutputStream out = new FileOutputStream(realPath);
//                    while ((len = in.read(buffer)) != -1){
//                        out.write(buffer,0,len);
//                    }
//                    out.flush();
//                    out.close();
//                    in.close();
                }
            }
//            response.sendRedirect("/JSP/WorkManage.jsp");

        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
