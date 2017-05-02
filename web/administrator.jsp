<%-- 
    Document   : administrator
    Created on : Apr 27, 2017, 9:36:34 PM
    Author     : yan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
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
                <li><a id="blogLink" href="blog.html" onclick="delLink(blogLink)">Blog</a></li>
                <li><a id="memberLink" href="member.html" onclick="delLink(memberLink)">Members</a></li>
                <li class="last"><a id="aboutLink" href="about.html" onclick="delLink(aboutLink)">About</a></li>
                </ul>
            </div>        
            </div>
        </div>
        </div>
        
        <script>
             function delLink(link) { 
                 link.disabled = true; 
                 link.setAttribute("disabled",true); 
                 link.removeAttribute('href'); 
             }
        </script>

        <h2><small>${user}</small></h2>
        
        <form action="" method="" class="logoutButton" style="position: absolute; right:270px; top: 110px" >
            <input type="submit" name="" value="logout" id="logout"/> 
        </form>  

        <div class="uploadpicture">
        <form id="uploadpic" action="imgUpload" method="post" enctype="multipart/form-data">
            Upload a picture<br>
            <p>Choose a file to upload:</p><br>
            <input type="file" name="file" />
            <input type="submit" value="Upload" />
        </form>
        </div>
         
         
        <div class="uploadblog">
        <form action="blogManage" method="post" id="uploadblog">
            Upload a blog<br>

            <div class="blogtitle">
                <p>Title</p>
                <input id="Title" name="title" class="text" style="position: absolute; left:60px; top: 33px;"  />
            </div>

            <div class="blogbody">
                <p style="position: absolute; left:10px; top: 50px;">Blog</p>
                <textarea id="Body" name="body" rows="20" cols="80" style="position: absolute; left:60px; top: 60px;"></textarea>
                <button type="submit" value="submit" style="position: absolute; left:460px; top: 30px;">submit</button>
            </div>
            <input type="hidden" name="action" value="addBlog">
        </form>
        </div>
              
       <div class="deleteblog">
           <p>Delete blog</p><br/>
         <table border="1">
             <tr>
                 <td>Blog Title</td>
                 <td>Action</td>
             </tr>
                <c:forEach var="blog" items='${blogList}'>
                    <tr>
                        <td>${blog.title}</td>
                        <td>  
                            <form id="uploadpic" action="blogManage" method="post">
                                <input type="hidden" name="action" value="deleteBlog" />
                                <!--<input type="hidden" name="blogId" value="aaaaa" />-->
                                <input type="submit" value="Delete" name="del${blog.id}"/>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
         </table>
       </div>

    </body>
</html>
