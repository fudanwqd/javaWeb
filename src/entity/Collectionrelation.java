package entity;

import java.sql.Timestamp;
import java.util.Date;

public class Collectionrelation {
    private int  userID;
    private int ArtworkID;
    private boolean isPublic;
    private Timestamp collectTime;

    public Timestamp getCollectTime() {
        return collectTime;
    }

    public void setCollectTime(Timestamp collectTime) {
        this.collectTime = collectTime;
    }

    public Collectionrelation(int userID, int artworkID, boolean isPublic, Timestamp collectTime) {
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


}
