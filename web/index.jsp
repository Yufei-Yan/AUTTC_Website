<%-- 
    Document   : index
    Created on : Apr 27, 2017, 9:35:50 PM
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
        <form action="" method="">
          <a href="administrator.jsp"><input type="submit" value="Login" /></a>
        </form>
        
        <!-- 
        gallery: 
        ${gallery}  an array of image url
        -->
        
        <!--
        blog: 
            for each blog: ${blog}
            <p name="title"> ${blog.title}
            <p name="date">${blog.date}
            ...
            ...
            ...
                <input type="submit" value="Comment" aciton="checkUser">${comment}
        -->
        
    </body>
</html>
