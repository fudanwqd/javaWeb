package dao;
import entity.Artwork;
import entity.User;
import org.junit.Test;

import java.sql.*;
import java.util.*;

import static util.DBconnect.closeAll;
import static util.DBconnect.getConnection;

public class UserDao {

    public static void update(String sql, Object... args){
        Connection conn = null;
        PreparedStatement preparedStatement = null;

        try {
            conn = getConnection(); // 得到数据库连接
            preparedStatement = conn.prepareStatement(sql); // 得到PreparedStatement对象

            for (int i = 0; i < args.length; i++) {
                preparedStatement.setObject(i + 1, args[i]); // 为预编译sql设置参数
            }
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeAll(conn, preparedStatement, null);
        }
    }


    //column 标志着去哪一列取ID，因为在friendRequest数据表中，我们要找的ID在第二列。
    public static ArrayList<User> getUsers(String sql,int column, Object... args){
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        ArrayList<User> users = new ArrayList<>();
        try {
            connection = getConnection();
            preparedStatement = connection.prepareStatement(sql); // 得到PreparedStatement对象

            for (int i = 0; i < args.length; i++) {
                preparedStatement.setObject(i + 1, args[i]); // 为预编译sql设置参数
            }
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                String sqlFind = "SELECT * FROM USERS WHERE ID = ?";
                users.add(getUser(sqlFind,resultSet.getInt(column)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            closeAll(connection, preparedStatement, null);
        }
        return users;
    }


    public  static boolean isExit(String sql,Object... args) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = getConnection();
            preparedStatement = connection.prepareStatement(sql);

            for (int i = 0; i < args.length; i++) {
                preparedStatement.setObject(i + 1, args[i]); // 为预编译sql设置参数
            }

            resultSet = preparedStatement.executeQuery();

            int count = 0;

            if (resultSet.next()){
                count = resultSet.getInt(1);
            }

            return count != 0;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeAll(connection,preparedStatement,resultSet);
        }
        return false;
    }


    //查询一条记录
    public static User getUser(String sql,Object... args){
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
                entity = new User( resultSet.getInt(1), resultSet.getString(2),resultSet.getString(3)
                        , resultSet.getBoolean(4), resultSet.getString(5),resultSet.getDate(6)
                        ,resultSet.getString(7));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeAll(connection,preparedStatement,resultSet);
        }
        return entity;
    }


}


