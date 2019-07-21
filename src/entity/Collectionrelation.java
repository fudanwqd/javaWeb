package entity;

public class Collectionrelation {
    private int  userID;
    private int ArtworkID;
    private boolean isPublic;

    public Collectionrelation(int userID, int artworkID, boolean isPublic) {
        this.userID = userID;
        ArtworkID = artworkID;
        this.isPublic = isPublic;
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
