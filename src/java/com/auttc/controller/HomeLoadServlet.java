/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.auttc.controller;

import com.auttc.business.Blog;
import com.auttc.business.Comment;
import com.auttc.business.Member;
import com.auttc.business.User;
import com.auttc.data.ResourcePaths;
import com.auttc.data.UserDB;
import com.auttc.data.BlogXML;
import com.auttc.data.MemberXML;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletContext;

/**
 *
 * @author yufeiyan
 */
public class HomeLoadServlet extends HttpServlet {
    public HttpSession session;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HomeLoadServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeLoadServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
//        System.out.println("session: " + session);
        User sessionUser = (User)session.getAttribute("user");
//        System.out.println("sessionUser: " + sessionUser);
        String url = "/index.jsp";
        
//        System.out.println("aciton: " + action);
        
        if (null == action) {
            action = "homeLoad";
        }
        
        if (action.equals("homeLoad") || action.equals("userLogin") || action.endsWith("logout")) {

            String message;
            if (sessionUser == null) {

                message = "";
            } else {
                message = "Hello, " + sessionUser.getUsername();
            }
            System.out.println("message: " + message);
            ServletContext sc = getServletContext();
        
            String blogFileName = sc.getRealPath("/WEB-INF/blogs/testBlog.xml");
            List<Blog> blogList = BlogXML.xmlToBlogList(blogFileName);

            String memberFileName = sc.getRealPath("/WEB-INF/members/members.xml");
            List<Member> memberList = MemberXML.xmlToMemberList(memberFileName);
            
            String imgPath = getServletContext().getInitParameter("imgUpload");
            String[] imgUrls = new ResourcePaths(imgPath).getImgUrls();
//            System.out.println(imgUrls[0]);

            request.setAttribute("blogList", blogList);
            request.setAttribute("memberList", memberList);
            request.setAttribute("user", message);
            request.setAttribute("gallery", imgUrls);
        }
        System.out.println("before send url");
        getServletContext().getRequestDispatcher(url).forward(request, response);
        
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
              
        //need to check session later
        //HttpSession session = request.getSession();
        
        String action = request.getParameter("action");
        String url = "/index.jsp";
        
        if (action.equals("login")) {
            url = "/login.jsp";
            getServletContext().getRequestDispatcher(url).forward(request, response);
        } else if (action.equals("logout")) {
            session.invalidate();
            System.out.println("before doGet");
            this.doGet(request, response);
        } else if (action.equals("userLogin")) {
//            System.out.println("user is logging in");
            String username = request.getParameter("login");
            String password = request.getParameter("password");
            
//            System.out.println(username + " " + password);
            
            User user = new User(username, null, password, 0);
            User.UserType u = UserDB.isPasswordCorrect(user);
            
            if (User.UserType.ADMIN == u) {
                url = "/administrator.jsp";
                session.setAttribute("user", user);
                String message = "Hello, administrator! " + user.getUsername();
                request.setAttribute("user", message);
            } else if (User.UserType.USER == u) {
                url = "/index.jsp";
                session.setAttribute("user", user);
                String message = "Hello, " + user.getUsername();
                //String message = "Hello, " + (User)session.getAttribute("user");
                request.setAttribute("user", message);
                System.out.println("before doGet");
                this.doGet(request, response);
            } else {
                //username and password not mathch
                url = "/login.jsp";
            }

            getServletContext().getRequestDispatcher(url).forward(request, response);
            
        } else if (action.equals("userSignup")) {
//            System.out.println("user is signning up");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            
            User user = new User(username, email, password, 0);
            
            if (UserDB.isEmailExist(user)) {
//                System.out.println("Email already resgistered!");
                url = "/login.jsp";
            } else {
                UserDB.inserUser(user);
                //need to deal with session later
                session.setAttribute("user", user);
                
                System.out.println("new user created!");
                url = "/index.jsp";
                String message = "Hello, " + user.getUsername();
                request.setAttribute("user", message);
            }
            
            getServletContext().getRequestDispatcher(url).forward(request, response);
        }
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
