package entity;

public class Friendmessages {
    private int SendID;
    private int ReceiveID;
    private String MESSAGE_TEXT;

    public Friendmessages(int sendID, int receiveID, String MESSAGE_TEXT) {
        SendID = sendID;
        ReceiveID = receiveID;
        this.MESSAGE_TEXT = MESSAGE_TEXT;
    }

    public int getSendID() {
        return SendID;
    }

    public void setSendID(int sendID) {
        SendID = sendID;
    }

    public int getReceiveID() {
        return ReceiveID;
    }

    public void setReceiveID(int receiveID) {
        ReceiveID = receiveID;
    }

    public String getMESSAGE_TEXT() {
        return MESSAGE_TEXT;
    }

    public void setMESSAGE_TEXT(String MESSAGE_TEXT) {
        this.MESSAGE_TEXT = MESSAGE_TEXT;
    }
}
