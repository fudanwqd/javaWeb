package entity;

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
    private Date uploadingTime;



    public Artwork(int id, String name,
                   String type, String description,
                   String imgPath, String location,
                   int hot, String time,
                   String videoPath,Date uploadingTime) {
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
    public Date getUploadingTime() {
        return uploadingTime;
    }

    public void setUploadingTime(Date uploadingTime) {
        this.uploadingTime = uploadingTime;
    }
}
