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
import java.util.ArrayList;
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
public class AddBlogServlet extends HttpServlet {

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
            out.println("<title>Servlet AddBlogServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddBlogServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
//        String url = "homeload";
        
        if (null != (session.getAttribute("user"))) {
            String action = request.getParameter("action");
            System.out.println("action: " + action);
            ServletContext sc = getServletContext();
            String blogFileName = sc.getRealPath("/WEB-INF/blogs/testBlog.xml");
            System.out.println("file path: " + blogFileName);
            List<Blog> blogList = BlogXML.xmlToBlogList(blogFileName);
            
            // gather information of new blog
            int id = blogList.get(blogList.size() - 1).getId() + 1;
            String title = request.getParameter("title");
            System.out.println(title);
            String date = Date.getDate();
            String body = request.getParameter("body");
            System.out.println(body);
            List<Comment> commentList = new ArrayList<>();
            
            // create blog object to be added
            Blog newBlog = new Blog(id, title, date, body, commentList, commentList.size());
            System.out.println("id: " + Integer.toString(newBlog.getId()));
            System.out.println("title: " + newBlog.getTitle());
            System.out.println("date: " + newBlog.getDate());
            System.out.println("body: " + newBlog.getBody());
            
            // write the new blog into xml file
            BlogXML.addBlog(newBlog, blogFileName);
            
            System.out.println("file " + blogFileName + " written!");
            
        } else {
            getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
        }
        
//        HomeLoadServlet homeLoad = new HomeLoadServlet();
//        homeLoad.doGet(request, response);
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
