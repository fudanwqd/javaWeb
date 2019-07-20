package entity;

public class Collectionrelation {
    private int  userID;
    private int ArtworkID;

    public Collectionrelation(int userID, int artworkID) {
        this.userID = userID;
        ArtworkID = artworkID;
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
}
