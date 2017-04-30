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
            <form method="post" action="">
                <input type="hidden" name="action" value="userSignup" />
                <p><input type="text" name="username" value="" placeholder="Username"></p>
                <p><input type="email" name="email" value="" placeholder="Email"></p>
                <p><input type="password" name="password" value="" placeholder="Password"></p>
                <p class="submit"><input type="submit" name="commit" value="Sign up"></p>
            </form>
            </div>
        </div>
  <!--
        <div id="cssTabs">
            <div id="tab1" class="uiTab">
                <h3 class="tabHead">Header for Tab1</h3
                <div class="tabContent">Content for Tab1</div>
           </div>
           <div id="tab2" class="uiTab">
                <h3 class="tabHead">Header for Tab2</h3>
                <div class="tabContent">Content for Tab2</div>
           </div>										 
           <div id="tab3" class="uiTab">
                <h3 class="tabHead">Header for Tab3</h3>
                <div class="tabContent">Content for Tab3</div>
           </div>
        </div>
  -->


    </body>
</html>
