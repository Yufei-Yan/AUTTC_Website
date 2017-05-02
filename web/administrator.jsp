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
        <link href="admin.css" rel="stylesheet" type="text/css" />
        <title>Admin edit page</title>
    </head>
    <body>
         <div class="main">
            <div class="header">
            <div class="header_resize">
            <div class="logo">
            <h1><a href="homeLoad?action=homeLoad">AUTTC<span> Website</span></a><small>Auburn University Table Tennis Club</small></h1>
            </div>
            <div class="clr"></div>
            <div class="menu_nav">
                <ul>
                <li class="active"><a href="homeLoad?action=homeLoad">Home</a></li>
                <li><a href="about.html">Blog</a></li>
                <li><a href="blog.html">Members</a></li>
                <li class="last"><a href="contact.html">About</a></li>
                </ul>
            </div>        
            </div>
        </div>
        </div>

        <h2><small>${user}</small></h2>

        <div class="uploadpicture">
        <form id="uploadpic" action="imgUpload" method="post" enctype="multipart/form-data">
            Upload a picture<br>
            Choose a file to upload:<br>
            <input type="file" name="file" />
            <input type="submit" value="Upload" />
        </form>
        </div>
         
         
        <div class="uploadblog">
        <form id="uploadblog" action="blogUpload" method="post" enctype="multipart/form-data">
            Upload a blog<br>

            <div class="title">
                <p>Title</p>
                <input id="Title" name="title" class="text" />
            </div>

            <div class="blog">
                <p>Blog</p>
                <textarea id="Body" name="body" rows="20" cols="80" ></textarea>
                <button type="submit" value="submit" >submit</button>
            </div>
        </form>
        </div>

        
        
 
    </body>
</html>
