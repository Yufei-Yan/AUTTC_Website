package com.auttc.business;
  
import java.io.Serializable;
 
  /**
   *
   * @author yufeiyan
   */
 
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
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getAdmin() {
        return admin;
    }
    
    public void setAdmin(int admin) {
        this.admin = admin;
    }
 }