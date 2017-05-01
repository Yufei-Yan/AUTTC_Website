/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.auttc.controller;

import com.auttc.business.User;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author yufeiyan
 */
public class ImgUploadServlet extends HttpServlet {

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
            out.println("<title>Servlet ImgUploadServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ImgUploadServlet at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        System.out.println("doPost");
        String action = request.getParameter("action");
        System.out.println(action);
        System.out.println("Uploading image");
        HttpSession session = request.getSession();
        User sessionUser = (User)session.getAttribute("user");
        boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
            
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
            
        String imgPath = getServletContext().getInitParameter("imgUpload");
        System.out.println(imgPath);
          
        if (null != (session.getAttribute("user"))) {
            try {
                List field = upload.parseRequest(request);
                Iterator it = field.iterator();
                while (it.hasNext()) {
                    FileItem fileItem = (FileItem) it.next();
                    if (!fileItem.isFormField()) {
                        System.out.println(fileItem.getName());
                        System.out.println(fileItem.getSize());
                        System.out.println(fileItem.toString());
                        System.out.println(fileItem.getContentType());

                        File file;

                        String fileName = fileItem.getName();
                        if (fileName.lastIndexOf("\\") >= 0) {
                            file = new File(imgPath
                                    + fileName.substring(fileName.lastIndexOf("\\")));
                        } else {
                            file = new File(imgPath
                                    + fileName.substring(fileName.lastIndexOf("\\") + 1));
                        }

                        fileItem.write(file);
                        System.out.println("Uploaded Filename: " + fileName);
                    }
                }
            } catch (Exception ex) {
                System.out.println("Fail to upload: " + ex);
            }
            String message = "Hello, " + sessionUser.getUsername();
            request.setAttribute("user", message);
            getServletContext().getRequestDispatcher("/administrator.jsp").forward(request, response);
        } else {
            getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
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
