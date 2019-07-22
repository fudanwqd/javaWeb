package entity;

import java.util.Date;

public class Message {
    private User sender;
    private User receiver;
    private String messages;
    private Date date;

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Message(User sender, User receiver, String messages, Date date) {
        this.sender = sender;
        this.receiver = receiver;
        this.messages = messages;
        this.date = date;
    }

    public User getSender() {
        return sender;
    }

    public void setSender(User sender) {
        this.sender = sender;
    }

    public User getReceiver() {
        return receiver;
    }

    public void setReceiver(User receiver) {
        this.receiver = receiver;
    }

    public String getMessages() {
        return messages;
    }

    public void setMessages(String messages) {
        this.messages = messages;
    }

    public boolean isExit(User a, User b){
        return  (a.getUserID() == sender.getUserID() || a.getUserID() == receiver.getUserID()
                || b.getUserID() == sender.getUserID() || b.getUserID() == receiver.getUserID());
    }

    public boolean isExit(int a, int b){
        return  (a == sender.getUserID() || a == receiver.getUserID()
                || b == sender.getUserID() || b == receiver.getUserID());
    }

}
