/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.auttc.data;

import java.io.File;

/**
 *
 * @author yufeiyan
 */
public class ResourcePaths {
    
    private String imgPath;
    
    public ResourcePaths(String imgPath) {
        this.imgPath = imgPath;
    }
    
    public String getPath() {
        return this.imgPath;
    }
    
    public void setPath(String imgPath) {
        this.imgPath = imgPath;
    }
    
    public String[] getImgUrls() {
        File[] files = new File(imgPath).listFiles();
        String[] urls = new String[files.length];
        System.out.println("imgPaht: " + imgPath);
        for (int i = 0; i < files.length; ++i) {
            if (files[i].isFile()) {
                //System.out.println(filex.getAbsolutePath());
                urls[i] = files[i].getAbsolutePath();
            }
        }
        return urls;
    }
     
}
