<%-- 
    Document   : administrator
    Created on : Apr 27, 2017, 9:36:34 PM
    Author     : yan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="style.css" rel="stylesheet" type="text/css" />
        <title>JSP Page</title>
    </head>
    <body>
         <div class="main">
            <div class="header">
            <div class="header_resize">
            <div class="logo">
            <h1><a href="index.jsp">AUTTC<span> Website</span></a><small>Auburn University Table Tennis Club</small></h1>
            </div>
            <div class="clr"></div>
            <div class="menu_nav">
                <ul>
                <li class="active"><a href="index.jsp">Home</a></li>
                <li><a href="about.html">About</a></li>
                <li><a href="blog.html">Blog</a></li>
                <li class="last"><a href="contact.html">Contact Us</a></li>
                </ul>

            </div>        
            </div>
        </div>
        </div>
        <h1>Hello World!</h1>
        
        <form action="adminManage" method="post" enctype="multipart/form-data">
            <input type="hidden" name="action" value="uploadImg" />
            Choose a file to upload:
            <input type="file" name="file" />
            <input type="submit" value="Upload" />
        </form>
    </body>
</html>
