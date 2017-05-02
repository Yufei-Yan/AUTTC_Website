<%-- 
    Document   : login
    Created on : Apr 27, 2017, 9:36:02 PM
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
        
        <div class="login_container">
            <div class="login">
            <p>Login to ATTUC<p>
            <form method="post" action="homeLoad">
                <input type="hidden" name="action" value="userLogin" /> 
                <p><input type="text" name="login" value="" placeholder="Username"></p>
                <p><input type="password" name="password" value="" placeholder="Password"></p>
                <p class="submit"><input type="submit" name="commit" value="Login"></p>
            </form>
            </div>
        </div>>
            
        <div class="signup_container">
            <div class="signup">
            <p>Sign up</p>
            <form method="post" action="homeLoad">
                <input type="hidden" name="action" value="userSignup" />
                <p><input type="text" name="username" value="" placeholder="Username"></p>
                <p><input type="text" name="email" value="" placeholder="Email"></p>
                <p><input type="password" name="password" value="" placeholder="Password"></p>
                <p class="submit"><input type="submit" name="commit" value="Sign up"></p>
            </form>
            </div>
        </div>
        
<table width="100%"  border="0" cellspacing="7" cellpadding="0">
        <tr>
            <td><div align="center"><span class="bottombar"><strong>&copy; Authors: Yufei Yan; Chengyu Tang; Yang Zhao; Ziyan Tian. </strong></span></div></td>
        </tr>
        <tr> 
          <td>
<div align="center"> </div></td>
        </tr>
      </table>  
  <table width="100%"  border="0" cellspacing="7" cellpadding="0">
        <tr>
          <td><div align="center"><span class="bottombar"><strong>&copy; AUTTC, Auburn, AL 36830. All Rights Reserved. </strong></span></div></td>
        </tr>
        <tr> 
          <td>
<div align="center"> </div></td>
        </tr>
      </table>


    </body>
</html>
