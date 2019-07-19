package entity;

import java.util.ArrayList;
import java.util.Date;

public class User {
    private int id;
    private String name;
    private String password;
    private boolean privilege;
    private String email;
    private ArrayList<String> collections;
    private ArrayList<String> friends;
    private Date recentSignUp;
    private String signature;



    public User(int id, String name, String password, boolean privilege, String email, ArrayList<String> collections, ArrayList<String> friends, Date recentSignUp, String signature) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.privilege = privilege;
        this.email = email;
        this.collections = collections;
        this.friends = friends;
        this.recentSignUp = recentSignUp;
        this.signature=signature;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    public int getId() {
        return id;
    }

    public void setId(int userID) {
        this.id = userID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean getPrivilege() {
        return privilege;
    }

    public void setPrivilege(boolean privilege) {
        this.privilege = privilege;
    }

    public ArrayList<String> getCollections() {
        return collections;
    }

    public void setCollections(ArrayList<String> collections) {
        this.collections = collections;
    }

    public ArrayList<String> getFriends() {
        return friends;
    }

    public void setFriends(ArrayList<String> friends) {
        this.friends = friends;
    }

    public Date getRecentSignUp() {
        return recentSignUp;
    }

    public void setRecentSignUp(Date recentSignUp) {
        this.recentSignUp = recentSignUp;
    }
    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }


}
