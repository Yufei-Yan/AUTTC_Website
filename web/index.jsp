<%-- 
    Document   : index
    Created on : Apr 27, 2017, 9:35:50 PM
    Author     : yan
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" />
        
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
                <li><a onclick="hid2('all','members','about','blog')">Blog</a></li>
                <li><a onclick="hid2('all','blog','about','members')">Members</a></li>
                <li><a onclick="hid2('all','members','blog','about')">About</a></li>

                </ul>
                
            </div>        
            </div>
        </div>
        </div>
        
        <h2><small>${user}<small></h2>
        <form action="homeLoad" method="post" id="loginButton" >
            <input type="hidden" name="action" value="login" id="loginHidden"/> 
            <input type="submit" value="Login" id="submitButton"/> 
        </form>    
  <div class="clr"></div>        
  <div class="clr"></div>        
  <div class="clr"></div>        
        <!-- 
        gallery: 
        ${gallery}  an array of image url
        -->
                <!-- Gallery -->
    <style type="text/css">
        *{ padding:0; margin:0; list-style:none;}
        .all{ width: 600px; height: 370px; padding: 7px; border: 1px solid #2D2D2D; margin: 50px auto; position: relative; }
        .screen{
                width:600px;
                height:370px;
                 overflow:hidden; 
                position:relative;
        }
        .screen li{ width:600px; height:370px; overflow:hidden; float:left;}
        .screen ul{ position:absolute; left:0; top:0px; width:3000px;}
        .all ol{ position:absolute; right:10px; bottom:10px; line-height:20px; text-align:center;}
        .all ol li{ float: left; width: 15px; height: 15px; background: #fff;  margin-left: 5px; cursor: pointer; font-size: 10px; font-family: Verdana; line-height: 15px; border-radius: 15px; }
        .all ol li.current{ background:yellow;}
    </style>
    
    <script type="text/javascript">
        window.onload= function() {
            
            //check if user is logged in.
            if ('${user}' === "") {
                document.getElementById("submitButton").value = "Login";
            } else {
                document.getElementById("submitButton").value = "Logout";
                document.getElementById("loginHidden").value = "logout";
            }
            
            var box  = document.getElementById("all");  
            var ul = box.children[0].children[0];  
            var ulLis = ul.children; 
            ul.appendChild(ulLis[0].cloneNode(true));  

            var ol = box.children[1];
            for(var i=0;i<ulLis.length-1;i++) {  
                var li = document.createElement("li");
                li.innerHTML = i + 1;  
                ol.appendChild(li);
            }
            var olLis = ol.children; 
            olLis[0].className = 'current';
            for(var i=0;i<olLis.length;i++) {
                olLis[i].index = i;  
                olLis[i].onmouseover = function() {
                    for(var j=0;j<olLis.length;j++) {
                        olLis[j].className = "";
                    }
                    this.className = 'current';
                    animate(ul,-this.index*ulLis[0].offsetWidth);
                    key = square = this.index; 
                }
            }
            var timer = null;
            var key = 0;
            var square = 0; 
            timer = setInterval(autoplay,2500);  
            function autoplay() {
                key++;   
                console.log(key); 
                if(key > ulLis.length - 1)
                {

                    ul.style.left = 0;
                    key = 1; 
                }
                animate(ul,-key*ulLis[0].offsetWidth);
                square++;  
                square = square>olLis.length-1 ? 0 : square;

                for(var i=0;i<olLis.length;i++) {
                    olLis[i].className = "";
                }
                olLis[square].className = "current";  

            }

            box.onmouseover = function() {
                clearInterval(timer);
            }

            box.onmouseout = function() {
                timer = setInterval(autoplay,2500); }

            function animate(obj,target) {
                clearInterval(obj.timer);  
                var speed = obj.offsetLeft < target ? 15 : -15;
                obj.timer = setInterval(function() {
                    var result = target - obj.offsetLeft;
                    obj.style.left = obj.offsetLeft + speed  + "px";
                    if(Math.abs(result) <= 15) {
                        obj.style.left = target + "px";  
                        clearInterval(obj.timer);
                    }
                },10);
            }

        }
    </script>

    <div class="all" id='all' style="display:block; font-weight: bold">
            <div class="screen">
            <ul>
                <c:forEach var="item" items='${gallery}'>
                    <li>
                       <img src="${item}" width="600px" height="370px" alt="Toy Story" />
                       <p>${item}</p>
                    </li>
                </c:forEach> 
            </ul>
        </div>
        <ol>
        </ol>
    </div>

        <!-- Gallery -->
       <!--<div id="gallery" style="display:block; font-weight: bold">
        <ul id="horiz_container_outer">
		<li id="horiz_container_inner">
			<ul id="horiz_container">
                          <%--  <c:forEach var="item" items='${gallery}'>
                                <li>
                                   <img src="${item}" width="500px" height="300px" alt="Toy Story" />
                                   <p>${item}</p>
                                </li>
                            </c:forEach> --%>
			</ul>
		</li>		
	</ul>			
						
	<div id="scrollbar">
		<a id="left_scroll" class="mouseover_left" href="#"></a>
		<div id="track">
		     <div id="dragBar"></div>
		</div>
		<a id="right_scroll" class="mouseover_right" href="#"></a></div>
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
        
<div id="blog" style="display:block; font-weight: bold">

    <div class="blog">   
        <div class="content">
            <div class="content_resize">
                <div class="mainbar">
                    <%
                        int count = 1;
                    %>
                    <c:forEach var="blog" items="${blogList}">
                        <%
                            String readMoreDivID = "readMore" + Integer.toString(count);
                            String fullBodyDivID = "fullBody" + Integer.toString(count);
                            String responseDivID = "response" + Integer.toString(count);
                            String hDivID = "h" + Integer.toString(count);
                        %>
                    <div class="article">
                    <h2><span>${blog.title}</span></h2>

                        <div class="clr"></div>
                            <p>Posted on ${blog.date}</p>
                            <p>${blog.body}</p>  
                        <!--<div id="exmaple1" style="display:block; font-weight: bold"> <a href="#" onclick="show('exmaple1','exmaple2')">  read more </a></div>-->
                        <div id="<%out.print(readMoreDivID);%>" style="display:block; font-weight: bold"> <a href="#" onclick="show('<%out.print(readMoreDivID);%>','<%out.print(fullBodyDivID);%>')">  read more </a></div>
                        <!--<div id="exmaple2" style="display:none;">-->
                        <div id="<%out.print(fullBodyDivID);%>" style="display:none;">
                            Maecenas dignissim mauris in arcu congue tincidunt. Vestibulum elit  nunc, accumsan vitae faucibus vel, scelerisque a quam. Aenean at metus id elit bibendum faucibus. Curabitur ultrices ante nec neque consectetur a aliquet libero lobortis. Ut nibh sem, pellentesque in dictum eu, convallis blandit erat. Cras vehicula tellus nec purus sagittis id scelerisque risus congue. Quisque sed semper massa. Donec id lacus mauris, vitae pretium risus. Fusce sed tempor erat. 
                            <!--<div><a href="#" onclick="show1('c1','h')"> <strong>Comments (3)</strong> </a>   <span>&nbsp;&bull;&nbsp;</span>  May 27, 2010  <span>&nbsp;&bull;&nbsp;</span>  <a href="#"><strong>Edit</strong></a></div>-->
                            <div><a href="#" onclick="show1('<%out.print(responseDivID);%>','<%out.print(hDivID);%>')"> <strong>Comments (3)</strong> </a>   <span>&nbsp;&bull;&nbsp;</span>  May 27, 2010  <span>&nbsp;&bull;&nbsp;</span>  <a href="#"><strong>Edit</strong></a></div>
                        </div>

                        <!--<div id="c1" style="display:none; font-weight: bold">-->
                        <div id="<%out.print(responseDivID);%>" style="display:none; font-weight: bold">
                            <div>
                                <h2><span>3</span> Responses</h2><div class="clr"></div>
                                <c:forEach var="comment" items="${blog.commentList}">
                                    <div class="comment">
                                    <p><a href="#">${comment.username}</a> ${comment.cdate}</p>
                                    <p>${comment.cbody}</p>
                                    </div>
                                </c:forEach>
                            </div>                        
                            <div>
                            <h2><span>Leave a</span> comment</h2><div class="clr"></div>
                            <form action="addComment" method="post" id="leavereply">
                            <ol><li>
<!--                            <label for="name">Name (required)</label>
                            <input id="name" name="name" class="text" />
                            </li><li>
                            <label for="email">Email Address (required)</label>
                            <input id="email" name="email" class="text" />
                            </li><li>
                            <label for="website">Website</label>
                            <input id="website" name="website" class="text" />
                            </li><li>-->
                            <label for="message">Your Message</label>
                            <textarea id="message" name="message" rows="8" cols="50" ></textarea>
                            </li><li>
                            <input type="image" name="commentBlog${blog.id}" id="imageField" src="images/icon/submit.gif" class="send" />
                                <div class="clr"></div>
                            </li></ol>
                            </form>
                                <!--<div id="h" style="display:none; font-weight: bold"> <a href="#" onclick="hide('c1','exmaple2','exmaple1')">  hide </a> </div>-->
                                <div id="<%out.print(hDivID);%>" style="display:none; font-weight: bold"> <a href="#" onclick="hide('<%out.print(responseDivID);%>','<%out.print(fullBodyDivID);%>','<%out.print(readMoreDivID);%>')">  hide </a> </div>
                            </div>
                        </div>          
                    </div> 
                        <%
                            count = count + 1;
                        %>
                    </c:forEach>
            </div>
        </div>          
        
            <script>
             function show(ele1,ele2){ 
                 document.getElementById(ele2).style.display = "block";
                 document.getElementById(ele1).style.display = "none";
            }
            </script>

            <script>
             function show1(ele1,ele2){
                 document.getElementById(ele1).style.display = 'block';   
                 document.getElementById(ele2).style.display = 'block'; 
            }
            </script>

            <script>
             function hide(ele1,ele2,ele3){
                 document.getElementById(ele1).style.display = 'none';
                 document.getElementById(ele2).style.display = 'none';
                 document.getElementById(ele3).style.display = 'block';
            }
            </script>

        </div>
    </div>
</div>  
        
  <div class="clr"></div>
        <!--MEMBERS-->
  <div id="members" style="display:block; font-weight: bold">
        <div class="Teammate">
            <div class="students">
              <div id="four_flash">
              <div class="flashBg">
                <ul class="mobile">
                    
                         <c:forEach items="${memberList}" var="member">
                            <li>
                                <img src="${member.url}" /> 
                                <dd>name: ${member.name}</dd>
                                <p>gender: ${member.gender}</p>
                                <p>joindate: ${member.joinDate}</p>
                                <p>intro: ${member.intro}</p>                   
                            </li>
                        </c:forEach>
                  
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
  </div>
  <!--About-->
   <div id="about" style="display:none; font-weight: bold">
        <div class="content">
        <div class="content_resize">
         <div class="mainbar">
         <div class="article">     
        <p align="center" class="bodytextheading">
        <span class="style2">ABOUT US</span></p>
                        <p align="justify" class="bodytextheading">                        </p>
                        <p align="justify">                                OUR-LIBRARY c.p. is one of the most prestigious LIBRARYs in India. Founded as a Public LIBRARY in 1972 in New Delhi, it is a private institution run by the Delhi Public LIBRARY Society.</p>
                              <p align="justify"> OUR-LIBRARY, c.p. is affiliated to the Central Board of LIBRARY (CBB), which is the largest educational board in the country. It is recognized by the Department of Education, Govt. of NCT Delhi and the Ministry of HRD, Govt. of India. Over 5000 LIBRARYs in India, with over 80,000 students, are members of the Board. </p>
                              <p align="justify">                                The LIBRARY is also affiliated to the Indian Public LIBRARYs' Conference (IPSC), and the National Progressive LIBRARYs' Conference (NPSC). The members of these organisations include some of the premier LIBRARYs in the country.</p>
                              <p align="justify"> Life at DPSRKP centres on a shared commitment to academic excellence, intellectual growth, art, athletics, high standards of ethical awareness, sportsmanship, and community service. The LIBRARY's traditions and accessibility to a broad curriculum add depth to each student&rsquo;s life.<br>
                                The LIBRARY upholds the founders' commitment to excellence in all fields, with emphasis on its motto Service Before Self.<br>
                                </p>
                              <p align="justify" class="bodytextheading">LIBRARY Profile</p>
                              <p align="justify"> OUR-LIBRARY, c.p. is a co-educational day-cum-boarding LIBRARY, with approximately 9,500 coustemer on its rolls. These children, in the Junior and Senior branches, study in the three different campuses at East of Kailash, Vasant Vihar and c.p.</p>
                              <p align="justify"> The LIBRARY is among the most distinguished members of the Ravi Public LIBRARY, c.p.. It is a path breaker in the pursuit of excellence. Its endeavour of integrating quality with quantity is reflected in the pivotal role it has played in the setting up of DPS Vasant Kunj, DPS Faridabad and DPS Manali at the national level. It has also promoted three LIBRARYs abroad in Kuwait, Nepal and Indonesia. As their Linking LIBRARY it also co-ordinates their activities. </p>
                              <p align="justify"> The LIBRARY has also extended its expertise further and in collaboration with the Government of Haryana, has taken up 3 LIBRARYs in the under-privileged area of Mewat, to augment and enhance their standards and make them more conducive to teaming.</p>
                              <p align="justify"> The LIBRARY considers education to be a life-long process which should have a strong foundation. The goal of the LIBRARY is to inculcate in the coustemer a love for learning and a desire to excel at every level. The LIBRARY also aims at equipping the coustemer with the intellectual and practical skills that are necessary to meet the challenges in the future.</p>
                              <p align="justify"> To sum up, the mission of  OUR-LIBRARY, c.p. &quot;to open doors and open minds&quot; and prepare the ground for the future of the nation.</p>
                              <p align="justify" class="bodytextheading"> Our Culture</p>
                              <p align="justify"> In the portals of  OUR-LIBRARY, c.p., c.p. coustemer discover their own talents, and get an opportunity to develop them to the fullest. The LIBRARY provides an invigorating and competitive atmosphere, created by excellent facilities and guidance provided by a highly qualified and dedicated faculty.</p>
                              <p align="justify"> The values, which are ingrained help to promote confidence, direction, and critical thinking skills, leading to the development of well-adjusted, adaptable and integrated personalities. In other words,  OUR-LIBRARY, c.p. offers comprehensive and holistic education.</p>
                              <p align="justify"> Besides being committed to academic excellence and providing education for all round development, another special characteristic of DPS R.K. Puram is the appreciation of the worth of the each student. The LIBRARY is equally committed to the under-represented and less-privileged segments of the population, such as gifted applicants whose parents could not attend LIBRARY, and children with high potential facing difficult financial circumstances.</p>
                              <p align="justify"> A major landmark development has been the inclusion of the physically and mentally handicapped children into the mainstream of LIBRARY life. This  contributes to a strong sense of community life, so characteristic of the LIBRARY. In other words, children belonging to every strata of society are given the opportunity to study here. The LIBRARY, does not in any way, discriminate on the basis of race, colour, religion, sex, caste or creed, in the implementation of its admission policy.</p>
                              <p align="justify"> These qualities have placed  OUR-LIBRARY, c.p. on the forefront. There has been a continuity of purpose, underlying the change and growth of the LIBRARY. Over the years,  OUR-LIBRARY, c.p. has steadily reflected a spirit of innovation in response to need, and has broadened its educational mission, by creating an academic environment that fosters close association and the exchange of ideas with some of the top LIBRARYs in the nation and the world.</p>
                              <p align="justify"> Its membership with the IPSC  has brought it into regular interaction with LIBRARYs of national standing such as Mayo College, Ajmer; Scindia LIBRARY, Gwalior; The Doon LIBRARY, Dehradun; Bishop Cotton, Simla Hills; St. Xavier's and La-Martiniere at Calcutta; which has further inculcated a healthy spirit of competition and strong bonds of brotherhood, conducive to national integration.</p>
                              <p align="justify"> All the academic programs and activities at  OUR-LIBRARY, c.p. work towards one purpose - to help coustemer develop lives of significance for themselves and for others, true to the traditions of the LIBRARY Motto &quot;Service Before Self&quot;.</p>
        </div>
        </div>
  <table width="100%"  border="0" cellspacing="7" cellpadding="0">
        <tr>
          <td><div align="center"><span class="bottombar"><strong>&copy; AUTTC, Auburn, AL 36830. All Rights Reserved. </strong></span></div></td>
        </tr>
        <tr> 
          <td>
<div align="center"> </div></td>
        </tr>
      </table>                            
  </div>
  </div>
  </div>
            
    <script>
     function hid2(ele1,ele2,ele3,ele4){ 
         document.getElementById(ele1).style.display = "none";
         document.getElementById(ele2).style.display = "none";
         document.getElementById(ele3).style.display = "none";
         document.getElementById(ele4).style.display = "block";
    }
    </script>
    

    </body>
</html>
