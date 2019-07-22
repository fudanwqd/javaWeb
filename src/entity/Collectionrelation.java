package entity;

import java.util.Date;

public class Collectionrelation {
    private int  userID;
    private int ArtworkID;
    private boolean isPublic;
    private Date collectTime;

    public Collectionrelation(int userID, int artworkID, boolean isPublic, Date collectTime) {
        this.userID = userID;
        ArtworkID = artworkID;
        this.isPublic = isPublic;
        this.collectTime = collectTime;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getArtworkID() {
        return ArtworkID;
    }

    public void setArtworkID(int artworkID) {
        ArtworkID = artworkID;
    }

    public boolean isPublic() {
        return isPublic;
    }

    public void setPublic(boolean aPublic) {
        isPublic = aPublic;
    }

    public Date getCollectTime() {
        return collectTime;
    }

    public void setCollectTime(Date collectTime) {
        this.collectTime = collectTime;
    }
}
