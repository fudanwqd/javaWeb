package entity;

import java.sql.Timestamp;
import java.util.Date;

public class Artwork {
    private int id;
    private String name;
    private String type;
    private String description;
    private String imgPath;
    private String location;
    private int hot;
    private String time;
    private String videoPath;
    private Timestamp uploadingTime;



    public Artwork(int id, String name,
                   String type, String description,
                   String imgPath, String location,
                   int hot, String time,
                   String videoPath, Timestamp uploadingTime) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.description = description;
        this.imgPath = imgPath;
        this.location = location;
        this.hot = hot;
        this.time = time;
        this.videoPath = videoPath;
        this.uploadingTime = uploadingTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getHot() {
        return hot;
    }

    public void setHot(int hot) {
        this.hot = hot;
    }
    public Timestamp getUploadingTime() {
        return uploadingTime;
    }

    public void setUploadingTime(Timestamp uploadingTime) {
        this.uploadingTime = uploadingTime;
    }
    @Override
    public String toString() {
        return "Artwork{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", type='" + type + '\'' +
                ", description='" + description + '\'' +
                ", imgPath='" + imgPath + '\'' +
                ", location='" + location + '\'' +
                ", hot=" + hot +
                ", time='" + time + '\'' +
                ", videoPath='" + videoPath + '\'' +
                ", uploadingTime=" + uploadingTime +
                '}';
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getVideoPath() {
        return videoPath;
    }

    public void setVideoPath(String videoPath) {
        this.videoPath = videoPath;
    }

}
