/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.auttc.business;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @author yufeiyan
 */
public class Blog implements Serializable {
    private int id;
    private String title;
    private String date;
    private String body;
    private List<Comment> commentList;
    private int commentNum;
    
    public Blog() {
        this.id = 0;
        this.title = "";
        this.date = "";
        this.body = "";
        this.commentNum = 0;
    }
    
    public Blog(int id, String title, String date, String body, List<Comment> commentList, int commentNum) {
        this.id = id;
        this.title = title;
        this.date = date;
        this.body = body;
        this.commentList = commentList;
    }
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
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
    
    public List<Comment> getCommentList() {
        return commentList;
    }
    
    public void setCommentList(List<Comment> commentList) {
        this.commentList = commentList;
    }
    
    public int getCommentNum() {
        return commentList.size();
    }
    
}
