package dao;

import entity.Message;
import entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import static dao.UserDao.getUser;
import static util.DBconnect.closeAll;
import static util.DBconnect.getConnection;

public class MessageDao {
    public static Map<User,ArrayList<Message>> getMessages(String sql, int id){
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;



        Map<User,ArrayList<Message>> chatMessages= new HashMap<>();
        String findUser = "SELECT * FROM USERS WHERE ID = ?";
        User user = getUser(findUser,id);

        User friend = null;
        Message message = null;


        try {
            connection = getConnection();
            preparedStatement = connection.prepareStatement(sql); // 得到PreparedStatement对象

            preparedStatement.setObject(1, id);
            preparedStatement.setObject(2, id);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                if (id == resultSet.getInt(1)){
                    friend = getUser(findUser,resultSet.getInt(2));
                }else {
                    friend = getUser(findUser,resultSet.getInt(1));
                }
                message = new Message(user,friend,resultSet.getString(3),resultSet.getDate(4));
                if (!chatMessages.containsKey(friend)){
                    ArrayList<Message> messages = new ArrayList<>();
                    messages.add(message);
                    chatMessages.put(friend,messages);
                }else {
                    chatMessages.get(friend).add(message);
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            closeAll(connection,preparedStatement,resultSet);
        }
        return chatMessages;
    }


}
