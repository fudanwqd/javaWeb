package util;

import java.sql.*;

public class JDBCTools {
    public Connection getConnection() throws  SQLException {
        String jdbcUrl = "jdbc:mysql://localhost:3306/javaweb?serverTimezone=UTC";
        String user = "root";
        String password = "wangqidi";

        return  DriverManager.getConnection(jdbcUrl,user,password);
    }



    //更改信息，全看args
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
        }finally {
            close(conn, preparedStatement);
        }
    }

    public void close(Connection connection,Statement statement){
        if (connection != null){
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if (statement != null){
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }



//    @Test
//    public void testDriver() throws SQLException, ClassNotFoundException {
//        String url = "jdbc:mysql://localhost:3306/pjdata?serverTimezone=UTC";
//        Connection connection = DriverManager.getConnection(url, "root", "123456");
//        System.out.println(connection);
//        //Connection conn = getConnection();
//        String sql = "INSERT INTO USERS (NAME,PASSWORD,PRIVILEGE,EMAIL,COLLECTIONS,FRIENDS)"+
//                "VALUE(?,?,?,?,?,?)";
//        update(sql,"liz","123","0","22","22","255");
//
//    }

}
