/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.auttc.data;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import com.auttc.business.Blog;
import com.auttc.business.Comment;

/**
 *
 * @author yufeiyan
 */
public class BlogXML {
    public static List<Blog> xmlToBlogList (String fileName) {
        List<Blog> blogList = new ArrayList<Blog>();
        try {
            File xmlFile = new File(fileName);
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(xmlFile);
            doc.getDocumentElement().normalize();
    //            System.out.println("Root element :" + doc.getDocumentElement().getNodeName());
            NodeList blogNodeList = doc.getElementsByTagName("blog");
            for (int i = 0; i < blogNodeList.getLength(); i++) { // for each blog
                List<Comment> commentList = new ArrayList<Comment>();
                Node blogNode = blogNodeList.item(i);
                Element blogElement = (Element) blogNode;

                // get information about blog_id, title, date, and body
                int blogID = Integer.parseInt(blogElement.getAttribute("id"));
    //                System.out.println("blog id: " + blogID);
                String blogTitle = blogElement.getElementsByTagName("title").item(0).getTextContent();
    //                System.out.println("title: " + blogTitle);
                String blogDate = blogElement.getElementsByTagName("date").item(0).getTextContent();
    //                System.out.println("date: " + blogDate);
                String blogBody = blogElement.getElementsByTagName("body").item(0).getTextContent();
    //                System.out.println("Body: " + blogBody);

                // get comments
                NodeList commentNodeList = blogElement.getElementsByTagName("comment");
                for (int j = 0; j < commentNodeList.getLength(); j++) { // for each comment
    //                    System.out.println("Hello from inner loop");
                    Element commentElement = (Element) commentNodeList.item(j);
                    String username = commentElement.getElementsByTagName("username").item(0).getTextContent();
    //                    System.out.println("User: " + username);
                    String commentDate = commentElement.getElementsByTagName("cdate").item(0).getTextContent();
    //                    System.out.println("date: " + commentDate);
                    String commentBody = commentElement.getElementsByTagName("cbody").item(0).getTextContent();
    //                    System.out.println("Comment body: " + commentBody);
                    Comment newComment = new Comment(username, commentDate, commentBody);
                    commentList.add(newComment);
                }

                Blog newBlog = new Blog(blogID, blogTitle, blogDate, blogBody, commentList);
                blogList.add(newBlog);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return blogList;
    }
}