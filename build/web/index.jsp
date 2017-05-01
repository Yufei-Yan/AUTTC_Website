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
                
                function checkUser() {
                    if ('${user}' === "") {
                        document.getElementById("submitButton").value = "Login";
                    } else {
                        document.getElementById("submitButton").value = "Logout";
                        document.getElementById("loginHidden").value = "logout";
                    }
                }

        </script>
        <title>JSP Page</title>
    </head>
    <body onload="checkUser()">
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
                <li><a onclick="hid2('gallery','members','about','blog')">Blog</a></li>
                <li><a onclick="hid2('gallery','blog','about','members')">Members</a></li>
                <li><a onclick="hid2('gallery','members','blog','about')">About</a></li>

                </ul>
            </div>        
            </div>
        </div>
        </div>
        
        <h2>${user}</h2>
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
       <div id="gallery" style="display:block; font-weight: bold">
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
                <div class="article">
                <h2><span>Template License</span></h2>
                    <div class="clr"></div>
                    <p>Posted on 18. Sep, 2015 by Admin</p>
                    <p>This is a free CSS website template by CoolWebTemplates. This work is distributed under the Creative Commons Attribution 3.0 License, which means that you are free to use it for any personal or commercial purpose provided you credit me in the form of a link back to.</p>  
                    <div id="exmaple1" style="display:block; font-weight: bold"> <a href="javascript:void(0)" onclick="show('exmaple1','exmaple2')">  read more </a> </div>         
                    <div id="exmaple2" style="display:none;">Maecenas dignissim mauris in arcu congue tincidunt. Vestibulum elit  nunc, accumsan vitae faucibus vel, scelerisque a quam. Aenean at metus id elit bibendum faucibus. Curabitur ultrices ante nec neque consectetur a aliquet libero lobortis. Ut nibh sem, pellentesque in dictum eu, convallis blandit erat. Cras vehicula tellus nec purus sagittis id scelerisque risus congue. Quisque sed semper massa. Donec id lacus mauris, vitae pretium risus. Fusce sed tempor erat. 
                        <div> <a href="javascript:void(0)" onclick="show1('c1','h')"> <strong>Comments (3)</strong> </a>   <span>&nbsp;&bull;&nbsp;</span>  May 27, 2010  <span>&nbsp;&bull;&nbsp;</span>  <a href="#"><strong>Edit</strong></a></div>
                    </div>
                    <div id="c1" style="display:none; font-weight: bold">
                        <div>
                            <h2><span>3</span> Responses</h2><div class="clr"></div>
                            <div class="comment">
                            <p><a href="javascript:void(0)">admin</a> Says:<br />April 20th, 2009 at 2:17 pm</p>
                            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. Suspendisse bibendum.</p>
                            </div>
                            <div class="comment">
                            <p><a href="javascript:void(0)">Owner</a> Says:<br />April 20th, 2009 at 3:21 pm</p>
                            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. Suspendisse bibendum. Cras id urna. Morbi tincidunt, orci ac convallis aliquam, lectus turpis varius lorem, eu posuere nunc justo tempus leo.</p>
                            </div>
                            <div class="comment">
                            <p><a href="#=javascript:void(0)">admin</a> Says:<br />April 20th, 2009 at 2:17 pm</p>
                            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. Suspendisse bibendum.</p>
                            </div>
                        </div>                        
                        <div>
                        <h2><span>Leave a</span> Reply</h2><div class="clr"></div>
                        <form action="javascript:void(0)" method="post" id="leavereply">
                        <ol><li>
                        <label for="name">Name (required)</label>
                        <input id="name" name="name" class="text" />
                        </li><li>
                        <label for="email">Email Address (required)</label>
                        <input id="email" name="email" class="text" />
                        </li><li>
                        <label for="website">Website</label>
                        <input id="website" name="website" class="text" />
                        </li><li>
                        <label for="message">Your Message</label>
                        <textarea id="message" name="message" rows="8" cols="50"></textarea>
                        </li><li>
                        <input type="image" name="imageField" id="imageField" src="images/icon/submit.gif" class="send" />
                            <div class="clr"></div>
                        </li></ol>
                        </form>
                            <div id="h" style="display:none; font-weight: bold"> <a href="#" onclick="hide('c1','exmaple2','exmaple1')">  hide </a> </div>        
                        </div>
                    </div>          
                </div> 
          
                
                <div class="article">
                    <h2><span>Aliquam Risus</span> Justo</h2>
                    <div class="clr"></div>
                    <p>Posted on 03. Apr, 2016 by Sara</p>
                    <p>In the portals of OUR-LIBRARY, c.p., c.p. coustemer discover their own talents, and get an opportunity to develop them to the fullest. The LIBRARY provides an invigorating and competitive atmosphere, created by excellent facilities and guidance provided by a highly qualified and dedicated faculty.</p>  
                    <div id="exmaple11" style="display:block; font-weight: bold"> <a href="javascript:void(0)" onclick="show('exmaple11','exmaple22')">  read more </a> </div>         
                    <div id="exmaple22" style="display:none;"> Besides being committed to academic excellence and providing education for all round development, another special characteristic of DPS R.K. Puram is the appreciation of the worth of the each student. The LIBRARY is equally committed to the under-represented and less-privileged segments of the population, such as gifted applicants whose parents could not attend LIBRARY, and children with high potential facing difficult financial circumstances.
                        <div> <a href="javascript:void(0)" onclick="show1('c11','h1')"> <strong>Comments (10)</strong> </a>   <span>&nbsp;&bull;&nbsp;</span>  May 27, 2016  <span>&nbsp;&bull;&nbsp;</span>  <a href="#"><strong>Edit</strong></a></div>
                    </div>
                    <div id="c11" style="display:none; font-weight: bold">
                        <div>
                            <h2><span>3</span> Responses</h2><div class="clr"></div>
                            <div class="comment">
                            <p><a href="javascript:void(0)">admin</a> Says:<br />April 20th, 2009 at 2:17 pm</p>
                            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. Suspendisse bibendum.</p>
                            </div>
                            <div class="comment">
                            <p><a href="javascript:void(0)">Owner</a> Says:<br />April 20th, 2009 at 3:21 pm</p>
                            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. Suspendisse bibendum. Cras id urna. Morbi tincidunt, orci ac convallis aliquam, lectus turpis varius lorem, eu posuere nunc justo tempus leo.</p>
                            </div>
                            <div class="comment">
                            <p><a href="javascript:void(0)">admin</a> Says:<br />April 20th, 2009 at 2:17 pm</p>
                            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. Suspendisse bibendum.</p>
                            </div>
                        </div>                        
                        <div>
                        <h2><span>Leave a</span> Reply</h2><div class="clr"></div>
                        <form action="javascript:void(0)" method="post" id="leavereply">
                        <ol><li>
                        <label for="name">Name (required)</label>
                        <input id="name" name="name" class="text" />
                        </li><li>
                        <label for="email">Email Address (required)</label>
                        <input id="email" name="email" class="text" />
                        </li><li>
                        <label for="website">Website</label>
                        <input id="website" name="website" class="text" />
                        </li><li>
                        <label for="message">Your Message</label>
                        <textarea id="message" name="message" rows="8" cols="50"></textarea>
                        </li><li>
                        <input type="image" name="imageField" id="imageField" src="images/icon/submit.gif" class="send" />
                            <div class="clr"></div>
                        </li></ol>
                        </form>
                            <div id="h1" style="display:none; font-weight: bold"> <a href="#" onclick="hide('c11','exmaple22','exmaple11')">  hide </a> </div>        
                        </div>
                    </div>          
                </div> 
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
