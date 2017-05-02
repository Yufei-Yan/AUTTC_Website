/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.auttc.controller;

import com.auttc.business.Blog;
import com.auttc.business.Comment;
import com.auttc.business.Date;
import com.auttc.business.User;
import com.auttc.data.BlogXML;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author cheng
 */
public class AddCommentServlet extends HttpServlet {

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
            out.println("<title>Servlet addCommentServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addCommentServlet at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        
        System.out.println("Start");
        HttpSession session = request.getSession();
//        String url = "homeLoad";
        
        if (null != (session.getAttribute("user"))) {
            
            User sessionUser = (User) session.getAttribute("user");
            String username = sessionUser.getUsername();
            System.out.println("username: " + username);
            
            ServletContext sc = getServletContext();
            String blogFileName = sc.getRealPath("/WEB-INF/blogs/testBlog.xml");
            System.out.println(blogFileName);
            List<Blog> blogList = BlogXML.xmlToBlogList(blogFileName);
            int targetId = 0;
            String commentText = "";
            
            // get the blog where the new comment will be add
            for (Blog blog: blogList) {
                String buttonName = "commentBlog" + Integer.toString(blog.getId());
                System.out.println("button " + buttonName + ": " + request.getParameter(buttonName));
                if (request.getParameter(buttonName) != null) {
                    
                    targetId = blog.getId();
                    commentText = request.getParameter("message" + Integer.toString(blog.getId()));
                    System.out.println("comment: " + commentText);
                    String cDate = Date.getDate();
                    System.out.println("date: " + cDate);
                    System.out.println("Writing comment to blog" + Integer.toString(targetId));
                    
                    Comment newCommentObj = new Comment(username, cDate, commentText);
                    BlogXML.addComment(blogFileName, newCommentObj, targetId);
                    System.out.println("Comment written into " + blogFileName + " successfully.");
                    break;
                }
            }
            
        } else {
            getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
        }
        response.sendRedirect("homeLoad");
//        getServletContext().getRequestDispatcher(url).forward(request, response);
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
