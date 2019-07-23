package dao;

import entity.Artwork;
import entity.Collectionrelation;
import entity.User;
import util.DBconnect;

import java.sql.*;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import static util.DBconnect.closeAll;
import static util.DBconnect.getConnection;

public class ArtworkDao {
    public static List<Artwork> SearchAllOrderByHotdesc() {
        List<Artwork> artworks = selectArtworks("select * from artwork order by hot desc");
        return artworks;
    }

    public static List<Artwork> SearchAll() {
        List<Artwork> artworks = selectArtworks("select * from artwork");
        return artworks;
    }

    public static List<Artwork> SearchLimit(int i, int num) {
        List<Artwork> artworks = new LinkedList<>();
        artworks = selectArtworks("select * from artwork limit ? , ?", i, num);
        return artworks;
    }

    public static List<Artwork> SearchLimitOrderByHotdesc(int i, int num) {
        List<Artwork> artworks = selectArtworks("select * from artwork order by hot desc limit ?,?", i, num);
        return artworks;
    }

    public static List<Artwork> SearchAllLikeNameOrderByHotdesc(String prefix) {
        List<Artwork> artworks = new LinkedList<>();
        artworks = selectArtworks("select * from artwork where name like ? or description like ? or location like ?  order by hot desc", "%" + prefix + "%", "%" + prefix + "%", "%" + prefix + "%");
        return artworks;
    }

    public static List<Artwork> SearchAllLikeName(String prefix) {
        List<Artwork> artworks = new LinkedList<>();
        artworks = selectArtworks("select * from artwork where name like ? or description like ? or location like ? ", "%" + prefix + "%", "%" + prefix + "%", "%" + prefix + "%");
        return artworks;
    }

    public static List<Artwork> SearchLimitLikeName(String prefix, int i, int num) {
        List<Artwork> artworks = new LinkedList<>();
        artworks = selectArtworks("select * from artwork where name like ? or description like ? or location like ? limit ? , ?", "%" + prefix + "%", "%" + prefix + "%", "%" + prefix + "%", i, num);
        return artworks;
    }

    public static List<Artwork> SearchLimitLikeNameOrderByHotdesc(String prefix, int i, int num) {
        List<Artwork> artworks = new LinkedList<>();
        artworks = selectArtworks("select * from artwork where name like ? or description like ? or location like ? order by hot desc limit ? , ?", "%" + prefix + "%", "%" + prefix + "%", "%" + prefix + "%", i, num);
        return artworks;
    }


    public static List<Artwork> SearchLimitByOrder(String type, int limit) {
        List<Artwork> artworks = new LinkedList<>();
        artworks = selectArtworks("select * from artwork order by ? desc limit 0 , ?", type, limit);
        return artworks;
    }

    public static Artwork SearchById(int id) {
        List<Artwork> artworks = new LinkedList<>();
        artworks = selectArtworks("select * from artwork where id = ?", id);
        return artworks.get(0);
    }

    public static void UpdateHotById(int id, int hot) {
        if (SearchById(id) != null)
            updateArtworks("update artwork set hot = ? where id = ? ", hot, id);
    }

    private static void updateArtworks(String sql, Object... args) {
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

        } catch (Exception e) {
            System.out.println("数据库更新异常");
            e.printStackTrace();
        } finally {
            DBconnect.closeAll(connection, preparedStatement, resultSet);
        }
    }

    public static List<Artwork> selectArtworks(String sql, Object... args) {
        List<Artwork> artworks = new LinkedList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        try {
            connection = DBconnect.getConnection();
            preparedStatement = connection.prepareStatement(sql);
            for (int i = 0; i < args.length; i++) {
                preparedStatement.setObject(i + 1, args[i]); // 为预编译sql设置参数
            }
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Artwork newartwork = getArtworkByRs(resultSet);
                artworks.add(newartwork);
            }
        } catch (Exception e) {
            System.out.println("数据库查询异常");
            e.printStackTrace();
        } finally {
            DBconnect.closeAll(connection, preparedStatement, resultSet);
        }
        return artworks;
    }

    private static Artwork getArtworkByRs(ResultSet resultSet) {
        Artwork newartwork = null;
        try {
            int id = resultSet.getInt(1);
            String name = resultSet.getString(2);
            String type = resultSet.getString(3);
            String description = resultSet.getString(4);
            String imgPath = resultSet.getString(5);
            String location = resultSet.getString(6);
            int hot = resultSet.getInt(7);
            String time = resultSet.getString(8);
            String videoPath = resultSet.getString(9);
            Timestamp uploadingTime = resultSet.getTimestamp(10);
       //     Date uploadingTime = new Date();
            newartwork = new Artwork(id, name, type, description, imgPath, location, hot, time, videoPath, uploadingTime);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return newartwork;

    }

    public static Artwork getArtwork(String sql, Object... args) {
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

            if (resultSet.next()) {
                return new Artwork(resultSet.getInt(1), resultSet.getString(2), resultSet.getString(3)
                        , resultSet.getString(4), resultSet.getString(5), resultSet.getString(6)
                        , resultSet.getInt(7), resultSet.getString(8), resultSet.getString(9), resultSet.getTimestamp(10));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeAll(connection, preparedStatement, resultSet);
        }
        return null;
    }
    public static List<Artwork> getFromRelation(List<Collectionrelation> collectionrelations ){
        List<Artwork> collections = new LinkedList<>();
        if(collectionrelations!=null&&collectionrelations.size()>0){
            for(int i=0;i<collectionrelations.size();i++){
                Artwork aArtwork = ArtworkDao.SearchById(collectionrelations.get(i).getArtworkID());
                collections.add(aArtwork);
            }
        }
        return collections;
    }
    private static boolean isExistIn(List<Artwork> artworks,Artwork artwork){
        boolean exist = false;
        for(int i=0;i<artworks.size();i++){
            if(artworks.get(i).getId()==artwork.getId()){
                exist = true;
                break;
            }
        }
        return exist;
    }

    public static int howManyCover(List<Artwork> ones, List<Artwork> anothers){
        int num =0;
        for(int i=0;i<ones.size();i++){
            if(isExistIn(anothers,ones.get(i))){
                num++;
            }
        }
        return num;
    }
    public static int howManyInType(List<Artwork> ones,List<Artwork> anothers){
        int num =0;
        for (int i=0;i<ones.size();i++){
            String type = ones.get(i).getType();
            for(int j=0;i<anothers.size();j++){
                if(type.equals(anothers.get(j).getType())){
                    num++;
                    break;
                }
            }
        }
        return num;
    }
    public static List<Artwork> dynamicArtwork(User user) {
        List<Artwork> dynamicartwork = new LinkedList<>();
        List<Collectionrelation> collectionrelations = CollectionrelationDao.selectCollectionById(user.getUserID());
        List<Artwork> collections = ArtworkDao.getFromRelation(collectionrelations);
        List<String> types = new LinkedList<>();
        List<Integer> scores = new LinkedList<>();
        if (collections.size() > 0) {
            for (int i = 0; i < collections.size(); i++) {
                boolean exist = false;
                int index = 0;
                for (int j = 0; j < types.size(); j++) {
                    if (collections.get(i).getType().equals(types.get(j))) {
                        exist = true;
                        index = j;
                        break;
                    }
                }
                if (exist) {
                    scores.set(index, scores.get(index) + 1);
                } else {
                    types.add(collections.get(i).getType());
                    scores.add(1);
                }
            }
            int temp = scores.get(0);
            int index = 0;
            for (int i =0;i<scores.size();i++){
                if(scores.get(i)>temp){
                    temp = scores.get(i);
                    index = i;
                }
            }
            String topType = types.get(index);
            List<Artwork> tempartwork = ArtworkDao.selectArtworks("select * from artwork where type = ? ",topType);
            for(int i=0;i<tempartwork.size();i++){
                if(dynamicartwork.size()>=3){
                    break;
                }
                if(!isExistIn(collections,tempartwork.get(i))){
                    dynamicartwork.add(tempartwork.get(i));
                }
            }
        }else{
            dynamicartwork = ArtworkDao.SearchLimitOrderByHotdesc(0,3);
        }
        return dynamicartwork;
    }
}
