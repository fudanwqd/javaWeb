package dao;

import entity.Artwork;
import util.DBconnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
//            Date uploadingTime = resultSet.getTime(10);
            Date uploadingTime = new Date();
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
                        , resultSet.getInt(7), resultSet.getString(8), resultSet.getString(9), resultSet.getDate(10));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeAll(connection, preparedStatement, resultSet);
        }
        return null;
    }
}
