/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.auttc.business;

import java.io.Serializable;

/**
 *
 * @author yufeiyan
 */
<<<<<<< HEAD
public class User {
    public int userID;
    public String firstName;
    public String secondName;
    public String email;
    public boolean isAdmin;
    
    public User() {
        userID = -1;
        firstName = "";
        secondName = "";
        email = "";
        isAdmin = false;
    }
    
    public User(int userID, String firstName, String secondName, String email, boolean isAdmin) {
        this.userID = userID;
        this.firstName = firstName;
        this.secondName = secondName;
        this.email = email;
        this.isAdmin = isAdmin;
    }
    
    public int getUserID() {
        return userID;
    }
    
    public void setUserID(int userID) {
        this.userID = userID;
    }
    
    public String getFirstName() {
        return firstName;
    }
    
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    
    public String getSecondName() {
        return secondName;
    }
    
    public void setSecondName(String secondName) {
        this.secondName = secondName;
=======
public class User implements Serializable {
    
    private String username;
    private String email;
    private String password;
    private int admin;
    
    public User () {
        username = "";
        email = "";
        password = "";
        admin = 0;
    }
    
    public enum UserType {
        USER, ADMIN, NONE;
    }
    
    public User (String username, String email, String password, int admin) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.admin = admin;
    }
    
    public String getUsername() {
        return username;
    }
    
    public void setUsername(String username) {
        this.username = username;
>>>>>>> 2ebb2401b51efbb08fd21a2b001dc2f6d67eea5d
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
<<<<<<< HEAD
    public boolean isAdmin() {
        return isAdmin;
    }
    
    public void setAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
=======
    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password) {
        this.password = password;
>>>>>>> 2ebb2401b51efbb08fd21a2b001dc2f6d67eea5d
    }
    
    public int getAdmin() {
        return admin;
    }
}
