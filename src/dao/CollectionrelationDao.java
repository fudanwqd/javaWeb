package dao;

import entity.Artwork;
import entity.Collectionrelation;
import util.DBconnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

public class CollectionrelationDao {
    public static List<Collectionrelation> selectCollectionById(int UserID){
        List<Collectionrelation> collectionrelations = selectCollections("select * from collectionrelation where id = ?",UserID);
        return collectionrelations;
    }



    private static List<Collectionrelation> selectCollections( String sql,Object...args){

        List<Collectionrelation> collectionrelations = new LinkedList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try{
            connection = DBconnect.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            for (int i = 0; i < args.length; i++) {
                preparedStatement.setObject(i + 1, args[i]); // 为预编译sql设置参数
            }
            resultSet=preparedStatement.executeQuery();
            while(resultSet.next()){
                Collectionrelation newCollectionrelation = getCollectionrelationByRs(resultSet);
                collectionrelations.add(newCollectionrelation);
            }
        }catch(Exception e){
            System.out.println("数据库查询异常");
            e.printStackTrace();
        }finally {
            DBconnect.closeAll(connection,preparedStatement,resultSet);
        }
        return collectionrelations;
    }
    private static Collectionrelation getCollectionrelationByRs(ResultSet resultSet){
        Collectionrelation collectionrelation = null;
        try {
            int userID = resultSet.getInt(1);
            int artworkID = resultSet.getInt(2);
            collectionrelation = new Collectionrelation(userID,artworkID);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return collectionrelation;

    }
}
