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
        List<Collectionrelation> collectionrelations = selectCollections("select * from collectionrelation where userID = ?",UserID);
        return collectionrelations;
    }
   public static Collectionrelation selectCollectionByDoubleId(int UserID,int ArtworkID){
        List<Collectionrelation> collectionrelations = selectCollections("select * from collectionrelation where userID = ? and ArtworkID = ?",UserID,ArtworkID);
        if(collectionrelations.size()>0){
            return collectionrelations.get(0);
        }else{
            return null;
        }

   }
   public static void UpdateCollectionPublicByDoubleId(int value,int UserID,int ArtworkID){
       if(selectCollectionByDoubleId(UserID,ArtworkID)!=null) {
           UpdateCollectionRelation("update collectionrelation set ispublic = ? where userID = ? and ArtworkID = ?", value, UserID, ArtworkID);
       }
   }
    public static void DeleteCollectionByDoubleId(int UserID,int ArtworkID){
        if(selectCollectionByDoubleId(UserID,ArtworkID)!=null) {
            UpdateCollectionRelation("delete from collectionrelation where userID = ? and ArtworkID = ?", UserID, ArtworkID);
        }
    }
    public static void AddCollectionByDoubleId(int UserID,int ArtworkID){
        if(selectCollectionByDoubleId(UserID,ArtworkID)==null) {
            UpdateCollectionRelation("insert into collectionrelation (userID,ArtworkID,ispublic) values (?,?,false)",UserID,ArtworkID);
        }
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
    private static void UpdateCollectionRelation(String sql,Object...args){
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = DBconnect.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            for (int i = 0; i < args.length; i++) {
                preparedStatement.setObject(i + 1, args[i]); // 为预编译sql设置参数
            }
            preparedStatement.executeUpdate();
        }catch(Exception e){
            System.out.println("数据库查询异常");
            e.printStackTrace();
        }finally {
            DBconnect.closeAll(connection,preparedStatement,resultSet);
        }
    }
    private static Collectionrelation getCollectionrelationByRs(ResultSet resultSet){
        Collectionrelation collectionrelation = null;
        try {
            int userID = resultSet.getInt(1);
            int artworkID = resultSet.getInt(2);
            boolean isPublic = resultSet.getBoolean(3);
            collectionrelation = new Collectionrelation(userID,artworkID,isPublic);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return collectionrelation;

    }
}
