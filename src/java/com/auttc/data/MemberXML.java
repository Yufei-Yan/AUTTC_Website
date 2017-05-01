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
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.w3c.dom.Element;
import org.w3c.dom.Document;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import com.auttc.business.Member;



public class MemberXML {
    
    public static List<Member> xmlToMemberList(String fileName) {
        List<Member> memberList = new ArrayList<>();
        try {
            File xmlFile = new File(fileName);
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(xmlFile);
            
            NodeList memberNodeList = doc.getElementsByTagName("member");
            
            for (int i = 0; i < memberNodeList.getLength(); i++) {
                Element memberElement = (Element) memberNodeList.item(i);
                String url = memberElement.getElementsByTagName("url").item(0).getTextContent();
                String name = memberElement.getElementsByTagName("name").item(0).getTextContent();
                String gender = memberElement.getElementsByTagName("gender").item(0).getTextContent();
                String joinDate = memberElement.getElementsByTagName("joindate").item(0).getTextContent();
                String intro = memberElement.getElementsByTagName("intro").item(0).getTextContent();
                memberList.add(new Member(url, name, gender, joinDate, intro));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return memberList;
    }
    
    public static void addMember(String fileName, Member inputMember) {
        try {
            File xmlFile = new File("testBlog.xml");
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(xmlFile);
            
            Element rootMembersElement = doc.getDocumentElement();
            Element memberElement = doc.createElement("member");
            rootMembersElement.appendChild(memberElement);
            
            Element urlElement = doc.createElement("url");
            urlElement.appendChild(doc.createTextNode(inputMember.getName()));
            memberElement.appendChild(urlElement);
            
            Element nameElement = doc.createElement("name");
            nameElement.appendChild(doc.createTextNode(inputMember.getName()));
            memberElement.appendChild(nameElement);
            
            Element genderElement = doc.createElement("gender");
            genderElement.appendChild(doc.createTextNode(inputMember.getGender()));
            memberElement.appendChild(genderElement);
            
            Element joinDateElement = doc.createElement("joindate");
            joinDateElement.appendChild(doc.createTextNode(inputMember.getJoinDate()));
            memberElement.appendChild(joinDateElement);
            
            Element introElement = doc.createElement("intro");
            introElement.appendChild(doc.createTextNode(inputMember.getIntro()));
            memberElement.appendChild(introElement);
            
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            StreamResult result = new StreamResult(fileName);
            DOMSource source = new DOMSource(doc);
            transformer.transform(source, result);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public static void removeMember(String fileName, String delName) {
        
        try {
            File xmlFile = new File("testBlog.xml");
            DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
            Document doc = dBuilder.parse(xmlFile);
            NodeList memberNodeList = doc.getElementsByTagName("member");
            for (int i = 0; i < memberNodeList.getLength(); i++) {
                Node memberNode = memberNodeList.item(i);
                Element memberElement = (Element) memberNode;
                String name = memberElement.getElementsByTagName("name").item(0).getTextContent();
                if (name.equals(delName)) {
                    memberNode.getParentNode().removeChild(memberNode);
                    break;
                }
            }
            
            TransformerFactory transformerFactory = TransformerFactory.newInstance();
            Transformer transformer = transformerFactory.newTransformer();
            StreamResult result = new StreamResult(fileName);
            DOMSource source = new DOMSource(doc);
            transformer.transform(source, result);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
