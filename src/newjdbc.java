

import com.mysql.cj.jdbc.Driver;
import entity.User;
import util.DBconnect;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.Properties;

public class newjdbc  {
//    public static void testDriver() throws SQLException, ClassNotFoundException {
//        String url = "jdbc:mysql://localhost:3306/javaweb?serverTimezone=UTC";
//        Connection connection =  DriverManager.getConnection(url,"root","wangqidi");
//        DBconnect.init();
//        Date date = null;
//        User user = new User(2,"ad","abcd",true,"www.sa@fudan.edu.cn",new ArrayList<String>(),new ArrayList<String>(),date);
//        DBconnect.addUpdateDelete("insert into users values(?,?,?,?,?,?,?,?)",2,"ad","abcd",true,"www.sa@fudan.edu.cn",new ArrayList<String>(),new ArrayList<String>(),date);
//
////        Properties info = new Properties();
//
////        info.put("user","root");
////        info.put("password","wangqidi");
////        Connection connection = driver.connect(url,info);
//
//    }
    public static void testSe(){
        String sql = "SELECT * FROM USERS WHERE NAME ='Admin'";

//        Connection connection = null;
//        PreparedStatement preparedStatement = null;
//        ResultSet resultSet = null;

//        try {
//            connection = DBconnect.getConnection();
//            preparedStatement = connection.prepareStatement(sql);
//            resultSet = preparedStatement.executeQuery();
//            if (resultSet.next()){
                User user = DBconnect.getUser(sql);
                if (user == null){
                    System.out.println("?????");
                }
                System.out.println(user.getName());
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            DBconnect.closeAll(connection,preparedStatement,resultSet);
//        }
    }

public static void main(String[] args) throws Exception{
       // Class.forName("com.mysql.cj.jdbc.Driver");

        //testDriver();
    testSe();
}

}
