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
public class Blog {
    private String title;
    private String date;
    private String body;
    private Comment[] commentList;
    
    public Blog() {
        this.title = "";
        this.date = "";
        this.body = "";
    }
    
    public Blog(String title, String date, String body, Comment[] commentList) {
        this.title = title;
        this.date = date;
        this.body = body;
        this.commentList = commentList;
    }
    
    public String getTitle() {
        return title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    
    public String getDate() {
        return date;
    }
    
    public void setDate(String date) {
        this.date = date;
    }
    
    public String getBody() {
        return body;
    }
    
    public void setBody(String body) {
        this.body = body;
    }
    
    public Comment[] getComments() {
        return commentList;
    }
    
    public void setComments(Comment[] commentList) {
        this.commentList = commentList;
    }
}
