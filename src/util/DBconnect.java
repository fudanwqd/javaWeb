package util;

import entity.Artwork;
import entity.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class DBconnect {
    public static Connection getConnection() throws  SQLException {
        String jdbcUrl = "jdbc:mysql://localhost:3306/javaweb?serverTimezone=UTC";
        String user = "root";
        String password = "wangqidi";
        return  DriverManager.getConnection(jdbcUrl,user,password);
    }
    public static void addUpdateDelete(String sql,Object...args){
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try{
            connection = getConnection();
            preparedStatement=connection.prepareStatement(sql);
            for (int i = 0; i < args.length; i++) {
                preparedStatement.setObject(i + 1, args[i]); // 为预编译sql设置参数
            }
             preparedStatement.executeUpdate();
//            if(!flag){//如果第一个结果是结果集对象，则返回true;如果第一个结果是更新计数或者没有结果，则返回false
//                i++;
//            }
        }catch(Exception e){
            System.out.println("数据库增删改异常 ");
            e.printStackTrace();
        }finally {
            closeAll(connection,preparedStatement,resultSet);
        }
       // return i;
    }
    public static User getUser(String sql, Object... args){
        User entity = null;

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection();
            preparedStatement = connection.prepareStatement(sql); // 得到PreparedStatement对象

            for (int i = 0; i < args.length; i++) {
                preparedStatement.setObject(i + 1, args[i]); // 为预编译sql设置参数
            }
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()){

                ArrayList<String> collections = new ArrayList<>();
                ArrayList<String> friends = new ArrayList<>();
                String[] collec = resultSet.getString(6).split(",");
                Collections.addAll(collections, collec);
                String[] frie = resultSet.getString(7).split(",");
                Collections.addAll(friends,frie);

                entity = new User( resultSet.getInt(1), resultSet.getString(2),resultSet.getString(3)
                        , resultSet.getBoolean(4), resultSet.getString(5),collections , friends,resultSet.getDate(8)
                        ,resultSet.getString(9));

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeAll(connection,preparedStatement,resultSet);
        }
        return entity;
    }
    public static void closeAll(Connection conn, Statement stmt, ResultSet rs){
        if(rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if(stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if(conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


}
