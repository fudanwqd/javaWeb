

import com.mysql.cj.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class newjdbc  {
    public static void testDriver() throws SQLException{
        String url = "jdbc:mysql://localhost:3306/javaweb?serverTimezone=UTC";
        Connection connection =  DriverManager.getConnection(url,"root","wangqidi");

//        Properties info = new Properties();

//        info.put("user","root");
//        info.put("password","wangqidi");
//        Connection connection = driver.connect(url,info);
        System.out.println(connection);
    }

public static void main(String[] args) throws Exception{
        Class.forName("com.mysql.cj.jdbc.Driver");

        testDriver();
}

}
