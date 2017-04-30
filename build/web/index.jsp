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
        <link rel="stylesheet" type="text/css" href="jquery.horizontal.scroll.css" />
        <link rel="stylesheet" type="text/css" href="demo_style.css" />
        
        <script type="text/javascript" src="jquery.min.js"></script>
        <script src="jquery.horizontal.scroll.js" type="text/javascript"></script>
        <script type="text/javascript">

                $(document).ready(function(){
                        $('#horiz_container_outer').horizontalScroll();

                });

        </script>
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
        <form action="homeLoad" method="post">
            <input type="hidden" name="action" value="login" /> 
            <input type="submit" value="Login" /> 
        </form>
        
        <!-- 
        gallery: 
        ${gallery}  an array of image url
        -->
        <!-- Gallery -->
        <div class="gallery">
	<ul id="horiz_container_outer">
		<li id="horiz_container_inner">
			<ul id="horiz_container">
                            <li><img src="images/gallery/toystory.png" width="500px" height="300px" alt="Toy Story" /></li>
				<li><img src="images/gallery/up.png" width="500px" height="300px" alt="UP" /></li>
				<li><img src="images/gallery/ratatouille.png" width="500px" height="300px" alt="Ratatouille" /></li>
				<li><img src="images/gallery/findingnemo.png" width="500px" height="300px" alt="Finding Nemo" /></li>
				<li><img src="images/gallery/cars.png" width="500px" height="300px" alt="Cars" /></li>
				<li><img src="images/gallery/monstersinc.png" width="500px" height="300px" alt="Monsters Inc" /></li>
				<li><img src="images/gallery/bugslife.png" width="500px" height="300px" alt="A Bugs Life" /></li>
				<li><img src="images/gallery/incredibles.png" width="500px" height="300px" alt="The Incredibles" /></li>
               <!--                 
               <li>
                   <img src="=pl.getUrl() %>" width="500px" height="300px" alt="Toy Story" />  
                                <p>=pl.getTitle()%></p>                   
               </li>
               -->
               <!--  EL 
                           <li>
                                <img src="=${item[0].picture}" width="500px" height="300px" alt="Toy Story" />  
                                <p>=${item[0].title}</p>                   
                           </li>
                           <li>
                                <img src="=${item[1].picture}" width="500px" height="300px" alt="Toy Story" />  
                                <p>=${item[1].title}</p>                   
                           </li>
                           <li>
                                <img src="=${item[2].picture}" width="500px" height="300px" alt="Toy Story" />  
                                <p>=${item[2].title}</p>                   
                           </li>
                               ...
                               ...
                    -->
                    <!--  JSTL
                       <%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
                            <c:foreach var="item" value='${gallery}'/>
                                <li>
                                   <img src="=${item.picture}" width="500px" height="300px" alt="Toy Story" />  
                                   <p>=${item.title}</p>                   
                                </li>
                            </c:foreach >
                    -->
                            
			</ul>
		</li>		
	</ul>
	
						
	<div id="scrollbar">
		<a id="left_scroll" class="mouseover_left" href="#"></a>
		<div id="track">
		     <div id="dragBar"></div>
		</div>
                <a id="right_scroll" class="mouseover_right" href="#"></a>
        </div>
        </div>
        
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
        
        <!--MEMBERS-->
        <div class="Teammate">
            <div class="students">
              <div id="four_flash">
              <div class="flashBg">
                <ul class="mobile">
                    
                  <li>
                    <img src="images/teammategallery/senke_xy00.jpg" />
                    <dd>name</dd>
                    <p>introduction</p>
                    <a href=""></a>
                  </li>
                  <li>
                    <img src="images/teammategallery/senke_xy01.jpg" />
                    <dd>name</dd>
                    <p>introduction</p>
                    <a href=""></a>
                  </li>
                  <li>
                    <img src="images/teammategallery/senke_xy02.jpg" />
                    <dd>name</dd>
                    <p>introduction<br/>introduction</p>
                    <a href=""></a>
                  </li>
                  <li>
                    <img src="images/teammategallery/senke_xy03.jpg" />
                    <dd>name</dd>
                    <p>introduction</p>
                    <a href=""></a>
                  </li>
                  <li>
                    <img src="images/teammategallery/senke_xy04.jpg" />
                    <dd>name</dd>
                    <p>introduction</p>
                    <a href=""></a>
                  </li>
                  <li>
                    <img src="images/teammategallery/senke_xy05.jpg" />
                    <dd>name</dd>
                    <p>introduction</p>
                    <a href=""></a>
                  </li>
                  
                  
                    <!-- teammates informations-->
                    <!--
                        <c:forEach items="${members}" var="picture">
                            <li>
                                <img src="${member.picture}" />   //not in proposal 
                                <dd>${member.name}</dd>
                                <p>${member.gender}</p>
                                <p>${member.joindate}</p>
                                <p>${member.infro}</p>                   
                            </li>
                        </c:forEach>
                    -->
                </ul>
              </div>
            <div class="but_left"><img src="images/teammategallery/qianxleft.png" /></div>
            <div class="but_right"><img src="images/teammategallery/qianxr.png" /></div>
            </div>		  
	</div>
        </div>

    <script type="text/javascript" src="teammategallery.js"></script>
    <script type="text/javascript">
        var _index5=0;
        $("#four_flash .but_right img").click(function(){
                _index5++;
                var len=$(".flashBg ul.mobile li").length;
                if(_index5+5>len){
                        $("#four_flash .flashBg ul.mobile").stop().append($("ul.mobile").html());
                }
                $("#four_flash .flashBg ul.mobile").stop().animate({left:-_index5*326},1000);
                });


        $("#four_flash .but_left img").click(function(){
                if(_index5==0){
                        $("ul.mobile").prepend($("ul.mobile").html());
                        $("ul.mobile").css("left","-1380px");
                        _index5=6
                }
                _index5--;
                $("#four_flash .flashBg ul.mobile").stop().animate({left:-_index5*326},1000);
                });
    </script>
        
    </body>
</html>
