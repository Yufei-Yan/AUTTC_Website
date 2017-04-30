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
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.Attr;

/**
 *
 * @author yufeiyan
 */
public class BlogXML {
    public static List<Blog> xmlToBlogList (String fileName) {
        List<Blog> blogList = new ArrayList<>();
        try {
            File xmlFile = new File(fileName);
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(xmlFile);
            doc.getDocumentElement().normalize();
            NodeList blogNodeList = doc.getElementsByTagName("blog");
            for (int i = 0; i < blogNodeList.getLength(); i++) { // for each blog
                List<Comment> commentList = new ArrayList<>();
                Node blogNode = blogNodeList.item(i);
                Element blogElement = (Element) blogNode;

                // get information about blog_id, title, date, and body
                int blogID = Integer.parseInt(blogElement.getAttribute("id"));
                String blogTitle = blogElement.getElementsByTagName("title").item(0).getTextContent();
                String blogDate = blogElement.getElementsByTagName("date").item(0).getTextContent();
                String blogBody = blogElement.getElementsByTagName("body").item(0).getTextContent();

                // get comments
                NodeList commentNodeList = blogElement.getElementsByTagName("comment");
                for (int j = 0; j < commentNodeList.getLength(); j++) { // for each comment
                    Element commentElement = (Element) commentNodeList.item(j);
                    String username = commentElement.getElementsByTagName("username").item(0).getTextContent();
                    String commentDate = commentElement.getElementsByTagName("cdate").item(0).getTextContent();
                    String commentBody = commentElement.getElementsByTagName("cbody").item(0).getTextContent();
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
    
    public static void addBlog (Blog inputBlog) {
        try {
            
            File xmlFile = new File("testBlog.xml");
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(xmlFile);
            Element rootBlogsElement = doc.getDocumentElement();
            
            // append <blog> tag to root element
            Element blogElement = doc.createElement("blog");
            rootBlogsElement.appendChild(blogElement);
            
            // add attribute "id" to blog tag
            Attr blogID = doc.createAttribute("id");
            blogID.setValue(Integer.toString(inputBlog.getID()));
            blogElement.setAttributeNode(blogID);
            
            // add title to blog
            Element titleElement = doc.createElement("title");
            titleElement.appendChild(doc.createTextNode(inputBlog.getTitle()));
            blogElement.appendChild(titleElement);
            
            // add date to blog
            Element dateElement = doc.createElement("date");
            dateElement.appendChild(doc.createTextNode(inputBlog.getDate()));
            blogElement.appendChild(dateElement);
            
            // add body to blog
            Element bodyElement = doc.createElement("body");
            bodyElement.appendChild(doc.createTextNode(inputBlog.getBody()));
            blogElement.appendChild(bodyElement);
            
            // add comments tag to blog
            Element rootCommentsElement = doc.createElement("comments");
            blogElement.appendChild(rootCommentsElement);
            
            List<Comment> commentList = inputBlog.getComments();
            for (Comment comment: commentList) {
                // add comment to <comments>
                Element commentElement = doc.createElement("comment");
                rootCommentsElement.appendChild(commentElement);
                
                Element usernameElement = doc.createElement("username");
                usernameElement.appendChild(doc.createTextNode(comment.getUsername()));
                commentElement.appendChild(usernameElement);
                
                Element cdateElement = doc.createElement("cdate");
                cdateElement.appendChild(doc.createTextNode(comment.getCdate()));
                commentElement.appendChild(cdateElement);
                
                Element cbodyElement = doc.createElement("cbody");
                cbodyElement.appendChild(doc.createTextNode(comment.getCbody()));
                commentElement.appendChild(cbodyElement);
            }
            
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            StreamResult result = new StreamResult("testBlog.xml");
            DOMSource source = new DOMSource(doc);
            transformer.transform(source, result);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void removeBlog(int delID) {
        try {
            File xmlFile = new File("testBlog.xml");
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(xmlFile);
            NodeList blogNodeList = doc.getElementsByTagName("blog");
            
            for (int i = 0; i < blogNodeList.getLength(); i++) {
                Node blogNode = blogNodeList.item(i);
                Element blogElement = (Element) blogNode;
                int blogID = Integer.parseInt(blogElement.getAttribute("id"));
                if (blogID == delID) {
                    blogNode.getParentNode().removeChild(blogNode);
                    break;
                }
            }
            
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            StreamResult result = new StreamResult("testBlog.xml");
            DOMSource source = new DOMSource(doc);
            transformer.transform(source, result);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}