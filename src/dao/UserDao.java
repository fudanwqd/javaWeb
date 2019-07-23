package dao;
import entity.Artwork;
import entity.Collectionrelation;
import entity.User;
import org.junit.Test;

import java.sql.*;
import java.util.*;
import java.util.Date;

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
public static List<User> selectUsers(String sql,Object...args){
    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    List<User> users = new LinkedList<>();
    try {
        connection = getConnection();
        preparedStatement = connection.prepareStatement(sql);

        for (int i = 0; i < args.length; i++) {
            preparedStatement.setObject(i + 1, args[i]); // 为预编译sql设置参数
        }
        resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            User user = getUserByRs(resultSet);
            users.add(user);
        }
    }catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeAll(connection,preparedStatement,resultSet);
        }
    return users;
}
private static User getUserByRs(ResultSet resultSet){
    User user = null;
    try {
        int id = resultSet.getInt(1);
        String name = resultSet.getString(2);
        String password = resultSet.getString(3);
        boolean privilege = resultSet.getBoolean(4);
        String email = resultSet.getString(5);
        Date recentSignUp = resultSet.getDate(6);
        String signature = resultSet.getString(7);
        user = new User(id, name, password,privilege,email,recentSignUp,signature);
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return user;
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
    public static List<User> dynamicFriends(User auser){
        List<User> dynamicfriends = new LinkedList<>();
        List<User> friends = UserDao.getUsers("select * from friendsrelation where userID = ?",2,auser.getUserID());
        List<User> allUser = UserDao.selectUsers("select * from users");
        List<Collectionrelation> collectionrelations = CollectionrelationDao.selectCollectionById(auser.getUserID());
        List<Artwork> collections =ArtworkDao.getFromRelation(collectionrelations);
        List<User> notFriends = new LinkedList<>();
        List<Integer> scores = new LinkedList<>();
        for(int i=0;i<allUser.size();i++){
            if(auser.getUserID()!=allUser.get(i).getUserID()&&!isExistIn(friends,allUser.get(i))){
                notFriends.add(allUser.get(i));
            }
        }
        if(notFriends.size()>0){
        for(int i=0;i<notFriends.size();i++){
                int score = 0;
                List<User> onesFriends = UserDao.getUsers("select * from friendsrelation where userID = ?",2,allUser.get(i).getUserID());
                int friendsnum = howManyCover(friends,onesFriends);
                score+=friendsnum*5;
                List<Collectionrelation> onesCollectionrelations = CollectionrelationDao.selectCollectionById(allUser.get(i).getUserID());
               List<Artwork> onesCollections = ArtworkDao.getFromRelation(onesCollectionrelations);
               int collectionnum = ArtworkDao.howManyCover(collections,onesCollections);
               score+=collectionnum*3;
               int typenum = ArtworkDao.howManyInType(collections,onesCollections);
               score+= typenum*2;
               scores.add(score);
            }
        int[] top = {0,0};
        int[] topIndex = {-1,-1};
          for(int i=0;i<scores.size();i++){
            if(scores.get(i)>top[0]){
                top[0] = scores.get(i);
                topIndex[0] = i;
            }else{
                if(scores.get(i)>top[1]){
                    top[1] = scores.get(i);
                    topIndex[1] = i;
                }
            }
        }
          if(topIndex[0]!=-1){
              dynamicfriends.add(notFriends.get(topIndex[0]));
              if(topIndex[1]!=-1){
                  dynamicfriends.add(notFriends.get(topIndex[1]));
              }
          }
        }
        return dynamicfriends;
    }
    public static boolean isExistIn(List<User> users,User auser){
        boolean exist = false;
        for(int i=0;i<users.size();i++){
           if(users.get(i).getUserID()==auser.getUserID()){
               exist = true;
               break;
           }
        }
        return exist;
    }
    private static int howManyCover(List<User> ones,List<User> anothers){
        int num =0;
        for(int i=0;i<ones.size();i++){
            if(isExistIn(anothers,ones.get(i))){
                num++;
            }
        }
        return num;
    }

}


