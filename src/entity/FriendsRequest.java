package entity;

public class FriendsRequest {
    private User sender;
    private User recipient;
    private int status;

    public User getSender() {
        return sender;
    }

    public void setSender(User sender) {
        this.sender = sender;
    }

    public int getStatus() {
        return status;
    }

    public FriendsRequest(User sender, User recipient, int status) {
        this.sender = sender;
        this.recipient = recipient;
        this.status = status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public User getRecipient() {
        return recipient;
    }

    public void setRecipient(User recipient) {
        this.recipient = recipient;
    }

}
