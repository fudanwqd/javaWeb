

import com.mysql.cj.jdbc.Driver;
import dao.ArtworkDao;
import entity.Artwork;
import org.junit.Test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.Properties;

public class newjdbc  {
    public static void testDriver() throws SQLException{

        ArtworkDao.SearchLimitByOrder("hot",3);


//        Properties info = new Properties();

//        info.put("user","root");
//        info.put("password","wangqidi");
//        Connection connection = driver.connect(url,info);
//        System.out.println(connection);
    }


    @Test
    public void Test(){
        List<Artwork> hotArtworks = new LinkedList<>();
        //List<Artwork> freshArtworks = new LinkedList<>();
        hotArtworks = ArtworkDao.SearchLimitByOrder("hot",3);
       // freshArtworks = ArtworkDao.SearchLimitByOrder("uploadingTime",3);

        System.out.printf(hotArtworks.get(0).toString());

    }

public static void main(String[] args) throws Exception{
        Class.forName("com.mysql.cj.jdbc.Driver");

        testDriver();
}

}
