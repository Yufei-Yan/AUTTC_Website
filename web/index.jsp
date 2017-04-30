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
        <form action="homeLoad" method="post">
            <input type="hidden" name="action" value="login" /> 
            <input type="submit" value="Login" /> 
        </form>
        
        <!-- 
        gallery: 
        ${gallery}  an array of image url
        -->
        <!-- Gallery -->
        <style type="text/css">
            *{margin:0;padding:0;list-style-type:none;}
            a,img{border:0;}
            body{font:12px/180% Arial, Helvetica, sans-serif;}
            .Gallery_mod18{width:680px;height:406px;margin:20px auto;position:relative;background:#f7f7f7;}
            .Gallery_mod18 .btn{position:absolute;width:15px;height:70px;top:336px;cursor:pointer;z-index:99;font-size:50px;font-weight:bold;}
            .Gallery_mod18 .prev{left:0;background:url(images/banner/prevBtn.png) no-repeat;}
            .Gallery_mod18 #prevTop,.Gallery_mod18 #nextTop{top:213px;width:46px;height:48px;}
            .Gallery_mod18 #prevTop{background:url(images/banner/prevBtnTop.png) 0 0 no-repeat;}
            .Gallery_mod18 #nextTop{background:url(images/banner/nextBtnTop.png) 0 0 no-repeat;}
            .Gallery_mod18 .next{right:0;background:url(images/banner/nextBtn.png) no-repeat;}
            .Gallery_mod18 li{float:left;}
            .Gallery_mod18 .cf li{position:relative;color:#fff;}
            .Gallery_mod18 .cf a{display:block;width:680px;height:330px;position:absolute;color:#fff;}
            .Gallery_mod18 .cf li span{display:block;width:640px;position:absolute;left:0;bottom:0;padding:10px 20px;line-height:22px;text-align:left;background:rgba(0,0,0,0.6);filter:progid:DXImageTransform.Microsoft.gradient( GradientType = 0,startColorstr = "#60000000",endColorstr = "#60000000");}
            .Gallery_mod18 .picBox{height:330px;position:relative;overflow:hidden;}
            .Gallery_mod18 .picBox ul{height:330px;position:absolute;}
            .Gallery_mod18 .picBox li{width:680px;height:330px;}
            .Gallery_mod18 .listBox{width:642px;height:100px;margin:0 auto;position:relative;padding:6px 0 10px;overflow:hidden;}
            .Gallery_mod18 .listBox ul{height:100px;position:absolute;}
            .Gallery_mod18 .listBox li{width:129px;height:70px;cursor:pointer;position:relative;}
            .Gallery_mod18 .listBox li i{display:none;}
            .Gallery_mod18 .listBox li a{display:block;width:124px;height:70px;}
            .Gallery_mod18 .listBox li img{width:124px;height:70px;}
            .Gallery_mod18 .listBox .on img{width:118px;height:64px;border:3px solid #ff6600;}
            .Gallery_mod18 .listBox .on i{display:block;}
        </style>
<div class="Gallery_mod18">
            <span id="prev" class="btn prev"></span>
            <span id="next" class="btn next"></span>
            <span id="prevTop" class="btn prev"></span>
            <span id="nextTop" class="btn next"></span>
            <div id="picBox" class="picBox">
                <ul class="cf">
                    
                    <li>
                        <img width="680" height="380" src="images/banner/83293306.jpg" alt="" />
                        <span>Title</span>
                    </li>
                    <li>
                        <img width="680" height="380" src="images/banner/83293260.jpg" alt="" />
                        <span>Title</span>
                    </li>
                    <li>
                        <img width="680" height="380" src="images/banner/83293278.jpg" alt="" />
                        <span>Title</span> 
                    </li>
                    <li>
                        <img width="680" height="380" src="images/banner/83293291.jpg" alt="" />
                        <span>Title</span> 
                    </li>
                    <li>
                        <img width="680" height="380" src="images/banner/83293300.jpg" alt="" />
                        <span>Title</span> 
                    </li>
                    <li>
                        <img width="680" height="380" src="images/banner/83293339.jpg" alt="" />
                        <span>Title</span>
                    </li>
                    <li>
                        <img width="680" height="380" src="images/banner/83293353.jpg" alt="" />
                        <span>Title</span> 
                    </li>
                    <li>
                        <img width="680" height="380" src="images/banner/83293410.jpg" alt="" />
                        <span>Title</span>
                    </li>
                    <li>
                        <img width="680" height="380" src="images/banner/83293412.jpg" alt="" />
                        <span>Title</span> 
                    </li>
                    <li>
                        <img width="680" height="380" src="images/banner/83293418.jpg" alt="" />
                        <span>Title</span> 
                    </li>
                    <li>
                        <img width="680" height="380" src="images/banner/83293442.jpg" alt="" />
                        <span>Title</span> 
                    </li>
                    <li>
                        <img width="680" height="380" src="images/banner/83293447.jpg" alt="" />
                        <span>Title</span> 
                    </li>
                    <li>
                        <img width="680" height="380" src="images/banner/83293458.jpg" alt="" />
                        <span>Title</span> 
                    </li>
                    <li>
                        <img width="680" height="380" src="images/banner/83293493.jpg" alt="" />
                        <span>Title</span>
                    </li>
                    
                    <!--
                        <c:forEach items="${gallery}" var="picture">
                            <li>
                                <img width="680" height="380" src="${gallery.picture}" alt="${gallery.title}" />
                                <span>Title</span>
                            </li>
                        </c:forEach>
                    -->
                   
                </ul>
                    
            </div>
	
             <div id="listBox" class="listBox">
                <ul class="cf">
                    <li class="on">
                    
                    <i class="arr2"></i><img width="118" height="64" src="images/banner/83293792.jpg" alt="title" /></li>
                    <li><i class="arr2"></i><img width="118" height="64" src="images/banner/83293780.jpg" alt="title" /></li>
                    <li><i class="arr2"></i><img width="118" height="64" src="images/banner/83293781.jpg" alt="title" /></li>
                    <li><i class="arr2"></i><img width="118" height="64" src="images/banner/83293782.jpg" alt="title" /></li>
                    <li><i class="arr2"></i><img width="118" height="64" src="images/banner/83293783.jpg" alt="title" /></li>
                    <li><i class="arr2"></i><img width="118" height="64" src="images/banner/83293793.jpg" alt="title" /></li>
                    <li><i class="arr2"></i><img width="118" height="64" src="images/banner/83293794.jpg" alt="title" /></li>
                    <li><i class="arr2"></i><img width="118" height="64" src="images/banner/83293795.jpg" alt="title" /></li>
                    <li><i class="arr2"></i><img width="118" height="64" src="images/banner/83293809.jpg" alt="title" /></li>
                    <li><i class="arr2"></i><img width="118" height="64" src="images/banner/83293810.jpg" alt="title" /></li>
                    <li><i class="arr2"></i><img width="118" height="64" src="images/banner/83293811.jpg" alt="title" /></li>
                    <li><i class="arr2"></i><img width="118" height="64" src="images/banner/83293812.jpg" alt="title" /></li>
                    <li><i class="arr2"></i><img width="118" height="64" src="images/banner/83293831.jpg" alt="title" /></li>
                    <li><i class="arr2"></i><img width="118" height="64" src="images/banner/83293832.jpg" alt="title" /></li>
                    
                    <!--
                        <c:forEach items="${gallery}" var="picture">
                            <li><i class="arr2"></i><img width="118" height="64" src="${gallery.picture}" alt="title" /></li>
                        </c:forEach>
                    -->
                    <!--
                            <li><i class="arr2"></i><img width="118" height="64" src="${gallery[0].picture}" alt="title" /></li></li>
                            <li><i class="arr2"></i><img width="118" height="64" src="${gallery[1].picture}" alt="title" /></li></li>
                            <li><i class="arr2"></i><img width="118" height="64" src="${gallery[2].picture}" alt="title" /></li></li>
                               ...
                               ...
                    -->
                </ul>
             </div>	
        </div>

        <script type="text/javascript">
            (function(){

                function G(s){
                        return document.getElementById(s);
                }

                function getStyle(obj, attr){
                        if(obj.currentStyle){
                                return obj.currentStyle[attr];
                        }else{
                                return getComputedStyle(obj, false)[attr];
                        }
                }

                function Animate(obj, json){
                        if(obj.timer){
                                clearInterval(obj.timer);
                        }
                        obj.timer = setInterval(function(){
                                for(var attr in json){
                                        var iCur = parseInt(getStyle(obj, attr));
                                        iCur = iCur ? iCur : 0;
                                        var iSpeed = (json[attr] - iCur) / 5;
                                        iSpeed = iSpeed > 0 ? Math.ceil(iSpeed) : Math.floor(iSpeed);
                                        obj.style[attr] = iCur + iSpeed + 'px';
                                        if(iCur == json[attr]){
                                                clearInterval(obj.timer);
                                        }
                                }
                        }, 30);
                }

                var oPic = G("picBox");
                var oList = G("listBox");

                var oPrev = G("prev");
                var oNext = G("next");
                var oPrevTop = G("prevTop");
                var oNextTop = G("nextTop");

                var oPicLi = oPic.getElementsByTagName("li");
                var oListLi = oList.getElementsByTagName("li");
                var len1 = oPicLi.length;
                var len2 = oListLi.length;

                var oPicUl = oPic.getElementsByTagName("ul")[0];
                var oListUl = oList.getElementsByTagName("ul")[0];
                var w1 = oPicLi[0].offsetWidth;
                var w2 = oListLi[0].offsetWidth;

                oPicUl.style.width = w1 * len1 + "px";
                oListUl.style.width = w2 * len2 + "px";

                var index = 0;

                var num = 5;
                var num2 = Math.ceil(num / 2);

                function Change(){

                        Animate(oPicUl, {left: - index * w1});

                        if(index < num2){
                                Animate(oListUl, {left: 0});
                        }else if(index + num2 <= len2){
                                Animate(oListUl, {left: - (index - num2 + 1) * w2});
                        }else{
                                Animate(oListUl, {left: - (len2 - num) * w2});
                        }

                        for (var i = 0; i < len2; i++) {
                                oListLi[i].className = "";
                                if(i == index){
                                        oListLi[i].className = "on";
                                }
                        }
                }

                oNextTop.onclick = oNext.onclick = function(){
                        index ++;
                        index = index == len2 ? 0 : index;
                        Change();
                }

                oPrevTop.onclick = oPrev.onclick = function(){
                        index --;
                        index = index == -1 ? len2 -1 : index;
                        Change();
                }

                for (var i = 0; i < len2; i++) {
                        oListLi[i].index = i;
                        oListLi[i].onclick = function(){
                                index = this.index;
                                Change();
                        }
                }

            })()
        </script>
        
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
