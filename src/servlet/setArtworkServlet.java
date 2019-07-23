package servlet;

import dao.ArtworkDao;
import entity.Artwork;
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
import java.util.Date;
import java.util.List;
import java.util.UUID;

import static dao.UserDao.update;


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
        String[] info = new String[8];
        int i = 0;
        boolean isImg = true;
        Artwork artwork = null;

        try {
            List<FileItem> items = upload.parseRequest(request);
            for (FileItem item : items){
                if (item.isFormField()){
                    info[i] = item.getString("UTF-8");
                    if (i == 0){
                        String sqlq = "SELECT * FROM ARTWORK WHERE ID = ?";
                        artwork = ArtworkDao.getArtwork(sqlq,info[0]);
                    }
                }else{
                    String fileName = item.getName();
                    Long size = item.getSize();

                    if (size > 1024 * 1024 * 5){
                        response.sendRedirect("/JSP/SettingArtwork.jsp?error=1&id=" + artwork.getId());
                    }

                    if (fileName == null||fileName.equals("")){
                        if (isImg){
                            info[i] = artwork.getImgPath();
                            isImg = false;
                        }else {
                            info[i] = artwork.getVideoPath();
                        }
                        i++;
                        continue;
                    }

                    InputStream in = item.getInputStream();
                    byte[] buffer = new byte[1024];
                    int len = 0;
                    String id = UUID.randomUUID().toString();
                    fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
//                    fileName = id + fileName;


                    String file = fileName.substring(fileName.indexOf(".")+1);
                    fileName = id + "." + file;

                    String path="";
                    String str="";

                    if (isImg){
                        if (file.equals("jpg") || file.equals("png")) {
                            str = request.getServletContext().getRealPath("/img/") + fileName;
                            path = request.getRealPath("/img");
                            path = path.substring(0, path.lastIndexOf("out"));
                            path = path + "web\\img\\" + fileName;
                            info[i] = "../img/" + fileName;
                            isImg = false;
                        }else {
                            response.sendRedirect("/JSP/SettingArtwork.jsp?error=2&id=" + artwork.getId());
                        }
                    }else {
                        if (file.equals("mp4")) {
                            str = request.getServletContext().getRealPath("/video/") + fileName;
                            path = request.getRealPath("/video");
                            path = path.substring(0, path.lastIndexOf("out"));
                            path = path + "web\\video\\" + fileName;
                            info[i] = "../video/" + fileName;
                        }else {
                            response.sendRedirect("/JSP/SettingArtwork.jsp?error=2&id=" + artwork.getId());
                        }
                    }

                    OutputStream out1 = new FileOutputStream(str);
                    while ((len = in.read(buffer)) != -1){
                        out1.write(buffer,0,len);
                    }
                    out1.flush();
                    out1.close();

                    OutputStream out = new FileOutputStream(path);
                    while ((len = in.read(buffer)) != -1){
                        out.write(buffer,0,len);
                    }
                    out.flush();
                    out.close();
                    in.close();
                }
                i++;
            }


            String sql = "UPDATE ARTWORK SET NAME = ?,TYPE = ?,DESCRIPTION = ?,imgPath=?,location=?,time=?,videoPath=?,uploadingTime=? where id = ?";
            update(sql, info[1], info[2], info[3], info[4], info[5], info[6], info[7], new Date(), info[0]);


            response.sendRedirect("/JSP/WorkManage.jsp");
        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
