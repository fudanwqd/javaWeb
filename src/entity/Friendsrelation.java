package entity;


public class Friendsrelation {
    private int userID;
    private int friendID;

    public Friendsrelation(int userID, int friendID) {
        this.userID = userID;
        this.friendID = friendID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getFriendID() {
        return friendID;
    }

    public void setFriendID(int friendID) {
        this.friendID = friendID;
    }
}
