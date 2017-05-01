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
public class Member {
    
    private String url;
    private String name;
    private String gender;
    private String joinDate;
    private String intro;

    public Member() {
        url = "";
        name = "";
        gender = "";
        joinDate = "";
        intro = "";
    }
    
    public Member(String url,String name, String gender, String joinDate, String intro) {
        this.url = url;
        this.name = name;
        this.gender = gender;
        this.joinDate = joinDate;
        this.intro = intro;
    }
    
    public String getUrl() {
        return url;
    }
    
    public void setUrl(String url) {
        this.url = url;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public String getGender() {
        return gender;
    }
    
    public void setGender(String gender) {
        this.gender = gender;
    }
    
    public String getJoinDate() {
        return joinDate;
    }
    
    public void setJoinDate(String joinDate) {
        this.joinDate = joinDate;
    }
    
    public String getIntro() {
        return intro;
    }
    
    public void setIntro(String intro) {
        this.intro = intro;
    }
}
