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
    
    private String name;
    private String gender;
    private String joinDate;
    private String intro;

    public Member() {
        name = "";
        gender = "";
        joinDate = "";
        intro = "";
    }
    
    public Member(String name, String gender, String joinDate, String intro) {
        this.name = name;
        this.gender = gender;
        this.joinDate = joinDate;
        this.intro = intro;
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
