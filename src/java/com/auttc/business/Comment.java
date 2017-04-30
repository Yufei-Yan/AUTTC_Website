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
public class Comment {
    private String username;
    private String cdate;
    private String cbody;
    
    public Comment() {
        this.username = "";
        this.cdate = "";
        this.cbody = "";
    }
    
    public Comment(String username, String cdate, String cbody) {
        this.username = username;
        this.cdate = cdate;
        this.cbody = cbody;
    }
    
    public String getUsername() {
        return username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getCdate() {
        return cdate;
    }
    
    public void setCdate(String cdate) {
        this.cdate = cdate;
    }
    
    public String getCbody() {
        return cbody;
    }
    
    public void setCbody(String cbody) {
        this.cbody = cbody;
    }
}
