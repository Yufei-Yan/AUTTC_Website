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
        <form action="homeLoad" method="post" class="loginButton" style="position: absolute; right:270px; top: 110px" >
            <input type="hidden" name="action" value="login" id="loginHidden"/> 
            <input type="submit" value="Login" id="submitButton"/> 
        </form>    
        
        <!-- Edit button for admin -->
        <form action="homeLoad" method="post" id="editButton" style="position: absolute; right:170px; top: 110px">
            <input type="hidden" name="aciton" value="adminEdit" />
            <p style="display:none">${admin}</p>
            <input type="submit" value="Edit" id="adminEdit" style="display:none"/> 
        </form> 
        
  <div class="clr"></div>        
  <div class="clr"></div>        
  <div class="clr"></div>        

  <!-- Gallery -->
    <script type="text/javascript">
        window.onload= function() {
            
            //check if user is logged in.
            if ('${user}' === "") {
                document.getElementById("submitButton").value = "Login";
            } else {
                document.getElementById("submitButton").value = "Logout";
                document.getElementById("loginHidden").value = "logout";
            }
            
            //check if user is admin
            if ('${admin}'.includes("Yes")) {
                document.getElementById("adminEdit").style.display = "";
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

        
   <!-- Blog -->
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
                            String commentsID = "comments" + Integer.toString(count);
                            String hDivID = "h" + Integer.toString(count);
                        %>
                    <div class="article">
                    <h2><span>${blog.title}</span></h2>

                        <div class="clr" ></div>
                            <p>Posted on ${blog.date}</p>
                            <p style="font-size:18px">${blog.body}</p>  
                        <!--<div id="exmaple1" style="display:block; font-weight: bold"> <a href="#" onclick="show('exmaple1','exmaple2')">  read more </a></div>-->
                        <div id="<%out.print(readMoreDivID);%>" style="display:block; font-weight: bold; font-size:12px"> <a href="javascript:void(0)" onclick="show('<%out.print(readMoreDivID);%>','<%out.print(fullBodyDivID);%>')">  read more </a></div>
                        <!--<div id="exmaple2" style="display:none;">-->
                        <div id="<%out.print(fullBodyDivID);%>" style="display:none; font-weight: 200; font-size: 18px">
                            With his fluid, rhythmic strokes, it is clear that Sam Querrey has a knack for table tennis. But when he hits a backhand with two hands, as he does on the tennis court, it becomes obvious that it is not his sport of choice.
Querrey, ranked 38th in the world, was one of the many United States Open players who attended a pretournament party hosted by the agency Lagardère Unlimited at SPiN, a restaurant and bar on 23rd Street that bills itself as a Ping-Pong social club. Querrey, who grew up with a table in his house, matched up well with other tennis players and with nonathletes, but he could do little when facing the professional table tennis players at the party.
“I can’t win a point off of them,” he said. “They hit it with spin, and when it hits my paddle, I can’t control where it goes. So I don’t even know what they do.”
Malin Pettersson, a Swedish table tennis champion, went up against several pro tennis players at the party, and she had previously played Rafael Nadal. Though she and Nadal rallied at a friendly pace, Pettersson could tell that the slightest infusion of spin from her paddle immediately dismantled his play.

                            <!--<div><a href="#" onclick="show1('c1','h')"> <strong>Comments (3)</strong> </a>   <span>&nbsp;&bull;&nbsp;</span>  May 27, 2010  <span>&nbsp;&bull;&nbsp;</span>  <a href="#"><strong>Edit</strong></a></div>-->
                            <div><a href="javascript:void(0)" onclick="show1('<%out.print(responseDivID);%>','<%out.print(hDivID);%>', '<%out.print(commentsID);%>')" id="<%out.print(commentsID);%>"> <strong>Comments (${blog.commentNum})</strong> </a>   <span>&nbsp;&bull;&nbsp;</span>  May 27, 2010  </div>
                        </div>

                        <!--<div id="c1" style="display:none; font-weight: bold">-->
                        <div id="<%out.print(responseDivID);%>" style="display:none; font-weight: bold">
                            <div>
                                <h2><span>${blog.commentNum}</span> Responses</h2><div class="clr"></div>
                                <c:forEach var="comment" items="${blog.commentList}">
                                    <div class="comment">
                                    <p><a href="javascript:void(0)">${comment.username}</a> ${comment.cdate}</p>
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
                            <label for="message">Your Message</label><br>
                            <textarea id="message" name="message${blog.id}" rows="8" cols="50" ></textarea>
                            </li><li>
                            <input type="submit" name="commentBlog${blog.id}" id="imageField" />
                                <div class="clr"></div>
                            </li></ol>
                            </form>
                                <!--<div id="h" style="display:none; font-weight: bold"> <a href="#" onclick="hide('c1','exmaple2','exmaple1')">  hide </a> </div>-->
                                <div id="<%out.print(hDivID);%>" style="display:none; font-weight: bold; font-size: 15px"> <a href="javascript:void(0)" onclick="hide('<%out.print(responseDivID);%>','<%out.print(fullBodyDivID);%>','<%out.print(readMoreDivID);%>')">  hide </a> </div>
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
             function show1(ele1, ele2, ele3){
                 if ('${user}' === "") {
                     document.getElementById(ele3).href = "./login.jsp";
                 } else {
                    document.getElementById(ele1).style.display = 'block';   
                    document.getElementById(ele2).style.display = 'block'; 
                 }
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
                        <p align="justify">                                The Table Tennis Club is part of the AUTTC (Auburn University Table Tennis Club). We are devoted to providing an environment in which members can play both competitively and recreationally.</p>
                              <p align="justify"> The club offers quality coaching to its members under the guidance of Coach Liang Liung and Coach Carlos Espinoza-Toro. Both are certified Table Tennis coaches. Coach Liang handles the training of club members while Coach Carlos handles the training of the intercollegiate team. They are assisted by Coach Alex Landsman.</p>
                              <p align="justify">                                The club offers members 14 quality Butterfly Europa Tables that are in very good condition. In addition, a large number of balls and rackets are available for practice although we do encourage members to bring their own rackets to practice. The club also has a 'Robo Pong' robot to help with team practice sessions.</p>
                              <p align="justify"> The AUTTC team has done very well at the divisional level over the last couple of years, coming in at 3rd place both years. Team practices are held three times a week and consist of various drills and excercises along with 'one on one' coaching with our team coach Carlos. The club has open practice sessions twice a week which we encourage members to take advantage of. A full schedule can be found here.<br>
                                </p>
                              <p align="justify" class="bodytextheading">AUTTC Profile</p>
                              <p align="justify"> The club offers members 14 quality Butterfly Europa Tables that are in very good condition. In addition, a large number of balls and rackets are available for practice although we do encourage members to bring their own rackets to practice. The club also has a 'Robo Pong' robot to help with team practice sessions.</p>
                              <p align="justify"> In addition, the club holds two large tournaments every year that are open to the general public. We encourage all those interested in playing competitively to register for these tournaments. Information regarding upcoming tournaments can be found here.</p>
                              <p align="justify" class="bodytextheading"> Our History</p>
                              <p align="justify"> The sport originated in Victorian England, where it was played among the upper-class as an after-dinner parlour game. It has been suggested that makeshift versions of the game were developed by British military officers in India in around 1860s or 1870s, who brought it back with them. A row of books stood up along the center of the table as a net, two more books served as rackets and were used to continuously hit a golf-ball.</p>
                              <p align="justify"> The values, which are ingrained help to promote confidence, direction, and critical thinking skills, leading to the development of well-adjusted, adaptable and integrated personalities. In other words, c.p. offers comprehensive and holistic education.</p>
                              <p align="justify"> Besides being committed to academic excellence and providing education for all round development, another special characteristic of DPS R.K. Puram is the appreciation of the worth of the each student. The AUTTC is equally committed to the under-represented and less-privileged segments of the population, such as gifted applicants whose parents could not attend , and children with high potential facing difficult financial circumstances.</p>
                              <p align="justify"> A major landmark development has been the inclusion of the physically and mentally handicapped children into the mainstream of life. This  contributes to a strong sense of community life, so characteristic. In other words, children belonging to every strata of society are given the opportunity to study here. The club, does not in any way, discriminate on the basis of race, colour, religion, sex, caste or creed, in the implementation of its admission policy.</p>
                              <p align="justify"> These qualities have placed. on the forefront. There has been a continuity of purpose, underlying the change and growth. Over the years. has steadily reflected a spirit of innovation in response to need, and has broadened its educational mission, by creating an academic environment that fosters close association and the exchange of ideas with some of the top in the nation and the world.</p>
                              <p align="justify"> Its membership with the IPSC  has brought it into regular interaction of national standing; which has further inculcated a healthy spirit of competition and strong bonds of brotherhood, conducive to national integration.</p>
                              <p align="justify"> All the academic programs and activities, c.p. work towards one purpose - to help coustemer develop lives of significance for themselves and for others, true to the traditions of the &quot;Service Before Self&quot;.</p>
        </div>
        </div>
<!--  <table width="100%"  border="0" cellspacing="7" cellpadding="0">
        <tr>
          <td><div align="center"><span class="bottombar"><strong>&copy; AUTTC, Auburn, AL 36830. All Rights Reserved. </strong></span></div></td>
        </tr>
        <tr> 
          <td>
<div align="center"> </div></td>
        </tr>
      </table> -->                            
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
    
    <!-- footer -->
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