

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
//import org.springframework.util.ReflectionUtils;

public class BaseDao {
    private static String url="jdbc:mysql://localhost:3306/pjdata";
    private static String user="root";
    private static String password="123456";


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


    public Connection getConnection() throws  SQLException {
        String jdbcUrl = "jdbc:mysql://localhost:3306/pjdata?serverTimezone=UTC";
        String user = "root";
        String password = "123456";
        return  DriverManager.getConnection(jdbcUrl,user,password);
    }

    public void update(String sql, Object... args){
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
            BaseDao.closeAll(conn, preparedStatement, null);
        }
    }


    //查询一条记录
    public <T> T get(Class<T> clazz,String sql,Object... args){
       T entity = null;

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
               Map<String,Object> values = new HashMap<>();

               ResultSetMetaData resultSetMetaData = resultSet.getMetaData();

               int columnCount = resultSetMetaData.getColumnCount();
               for (int i = 0;i<columnCount;i++){
                   String columnLabel = resultSetMetaData.getColumnLabel(i+1);
                   Object columnValue = resultSet.getObject(i+1);

                   values.put(columnLabel,columnValue);
               }

               entity = clazz.newInstance();
               for (Map.Entry<String,Object> entry:values.entrySet()){
                   String propertyName = entry.getKey();
                   Object value = entry.getValue();

                   //System.out.println(propertyName + ":" + value);
                   //反射有点问题
//                   ReflectionUtils.setFieldValue(entity,propertyName,value);
               }
           }
       } catch (Exception e) {
           e.printStackTrace();
       } finally {
           closeAll(connection,preparedStatement,resultSet);
       }
        return entity;
    }


//    @Test
//    public void testDao(){
//
//    }

    public <T> List<T> getForList(Class<T> clazz, String sql, Object... args){
        T entity;
        List<T> list = new ArrayList<>();

        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = getConnection();

            // 得到PreparedStatement对象
            preparedStatement = connection.prepareStatement(sql);

            // 为预编译sql设置参数
            for (int i = 0; i < args.length; i++) {
                preparedStatement.setObject(i + 1, args[i]);
            }
            resultSet = preparedStatement.executeQuery();

            List<Map<String,Object>> values = getList(resultSet);


            list = transferMapListToBeanList(clazz,values);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeAll(connection,preparedStatement,resultSet);
        }

        return list;
    }

    private <T> List<T> transferMapListToBeanList(Class<T> clazz, List<Map<String, Object>> values) throws InstantiationException, IllegalAccessException {
        List<T> result = new ArrayList<>();
        T entity;
        if (values.size() > 0) {
            for (Map<String,Object> temp : values) {
                entity = clazz.newInstance();
                for (Map.Entry<String, Object> entry : temp.entrySet()) {
                    String propertyName = entry.getKey();
                    Object value = entry.getValue();

                    //System.out.println(propertyName + ":" + value);
                    //反射有点问题
//                  ReflectionUtils.setFieldValue(entity,propertyName,value);
                }
                result.add(entity);
            }
        }
        return result;
    }

    private List<Map<String,Object>> getList(ResultSet resultSet) throws SQLException {
        List<Map<String,Object>> values = new ArrayList<>();
        List<String> columnLabels = getColumnLabel(resultSet);
        Map<String,Object> map;

        while (resultSet.next()) {
            map = new HashMap<>();

            for (String columnLabel : columnLabels) {
                Object columnValue = resultSet.getObject(columnLabel);
                map.put(columnLabel, columnValue);
            }

            values.add(map);
        }
        return values;
    }

    private List<String> getColumnLabel(ResultSet rs) throws SQLException {
        List<String> labels = new ArrayList<>();

        ResultSetMetaData resultSetMetaData = rs.getMetaData();
        int columnCount = resultSetMetaData.getColumnCount();

        for (int i = 0;i < columnCount;i++) {
            labels.add(resultSetMetaData.getColumnLabel(i + 1));
        }
        return labels;
    }


}
