package entity;

import java.util.ArrayList;
import java.util.Date;

public class User {
    private int id;
    private String name;
    private String password;
    private boolean privilege;
    private String email;
    private Date recentSignUp;
    private String signature;

    public boolean isPrivilege() {
        return privilege;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public User(int id , String name, String password, boolean privilege, String email,
                  Date recentSignUp,String signature) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.privilege = privilege;
        this.email = email;
        this.recentSignUp = recentSignUp;
        this.signature = signature;
    }
    public User(String name, String password, boolean privilege, String email, Date recentSignUp) {
        this.name = name;
        this.password = password;
        this.privilege = privilege;
        this.email = email;
        this.recentSignUp = recentSignUp;
    }
    public User(){

    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", privilege=" + privilege +
                ", email='" + email + '\'' +
                ", recentSignUp=" + recentSignUp +
                '}';
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    public int getUserID() {
        return id;
    }

    public void setUserID(int userID) {
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

    public Date getRecentSignUp() {
        return recentSignUp;
    }

    public void setRecentSignUp(Date recentSignUp) {
        this.recentSignUp = recentSignUp;
    }



}
