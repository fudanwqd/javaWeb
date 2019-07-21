package dao;

import entity.FriendsRequest;
import entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static util.DBconnect.closeAll;
import static util.DBconnect.getConnection;

public class FriendsRequestDao {

    public static ArrayList<FriendsRequest> getFriendsRequest(String sql,Object... args){
        ArrayList<FriendsRequest> friendsRequests = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;


        String sqlUser = "SELECT * FROM USERS WHERE ID = ?";
        User user = UserDao.getUser(sqlUser,args[0]);

        User sender = null;
        FriendsRequest friendsRequest = null;

        try {
            connection = getConnection();
            preparedStatement = connection.prepareStatement(sql); // 得到PreparedStatement对象

            for (int i = 0; i < args.length; i++) {
                preparedStatement.setObject(i + 1, args[i]); // 为预编译sql设置参数
            }
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                String sqlFind = "SELECT * FROM USERS WHERE ID = ?";
                sender = UserDao.getUser(sqlFind,resultSet.getInt(1));
                friendsRequest = new FriendsRequest(sender,user,resultSet.getInt(3));
                friendsRequests.add(friendsRequest);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            closeAll(connection, preparedStatement, resultSet);
        }
        return friendsRequests;
    }
}
