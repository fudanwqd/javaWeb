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

    @Test
    public void testSe(){

    }


    public static ArrayList<User> getUsers(String sql, Object... args){
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
                users.add(getUser(sqlFind,resultSet.getInt(1)));
            }

        } catch (SQLException e) {
            e.printStackTrace();
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


//    public <T> List<T> getForList(Class<T> clazz, String sql, Object... args){
//        T entity;
//        List<T> list = new ArrayList<>();
//
//        Connection connection = null;
//        PreparedStatement preparedStatement = null;
//        ResultSet resultSet = null;
//
//        try {
//            connection = getConnection();
//
//            // 得到PreparedStatement对象
//            preparedStatement = connection.prepareStatement(sql);
//
//            // 为预编译sql设置参数
//            for (int i = 0; i < args.length; i++) {
//                preparedStatement.setObject(i + 1, args[i]);
//            }
//            resultSet = preparedStatement.executeQuery();
//
//            List<Map<String,Object>> values = getList(resultSet);
//
//            list = transferMapListToBeanList(clazz,values);
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            closeAll(connection,preparedStatement,resultSet);
//        }
//
//        return list;
//    }
//
//    private <T> List<T> transferMapListToBeanList(Class<T> clazz, List<Map<String, Object>> values) throws InstantiationException, IllegalAccessException {
//        List<T> result = new ArrayList<>();
//        T entity;
//        if (values.size() > 0) {
//            for (Map<String,Object> temp : values) {
//                entity = clazz.newInstance();
//                for (Map.Entry<String, Object> entry : temp.entrySet()) {
//                    String propertyName = entry.getKey();
//                    Object value = entry.getValue();
//
//                    //System.out.println(propertyName + ":" + value);
//                    //反射有点问题
////                  ReflectionUtils.setFieldValue(entity,propertyName,value);
//                }
//                result.add(entity);
//            }
//        }
//        return result;
//    }
//
//    private List<Map<String,Object>> getList(ResultSet resultSet) throws SQLException {
//        List<Map<String,Object>> values = new ArrayList<>();
//        List<String> columnLabels = getColumnLabel(resultSet);
//        Map<String,Object> map;
//
//        while (resultSet.next()) {
//            map = new HashMap<>();
//
//            for (String columnLabel : columnLabels) {
//                Object columnValue = resultSet.getObject(columnLabel);
//                map.put(columnLabel, columnValue);
//            }
//
//            values.add(map);
//        }
//        return values;
//    }
//
//    private List<String> getColumnLabel(ResultSet rs) throws SQLException {
//        List<String> labels = new ArrayList<>();
//
//        ResultSetMetaData resultSetMetaData = rs.getMetaData();
//        int columnCount = resultSetMetaData.getColumnCount();
//
//        for (int i = 0;i < columnCount;i++) {
//            labels.add(resultSetMetaData.getColumnLabel(i + 1));
//        }
//        return labels;
//    }


}


