/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.auttc.business;

/**
 *
 * @author yufeiyan
 */
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
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public boolean isAdmin() {
        return isAdmin;
    }
    
    public void setAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }
    
}
