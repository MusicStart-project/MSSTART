<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage</title>
<script>
function music_click(no){
	
	<c:if test="${empty authUser }">
	location.href='user/login.do';
	</c:if>
	<c:if test="${!empty authUser }">
	window.open('album/detail.do?no='+no+'','test', 'menubar=no, status=no, toolbar=no, location=no, resizable=no, width=400, height=650');
	</c:if>
	
}
var i=1;
</script>
<style>
.song {
	color:#fff;
	text-decoration: none;
}
</style>
<link rel="stylesheet" href="./css/album.css" type="text/css">
</head>
<body style="background:#121212">

	
	  <div class="overview__albums">
	  	<div class="overview__albums__head">
        
          <span class="section-title" style="font-size:30px">My Page</span>
          
          <span class="view-type">
          
            <c:if test="${!empty authUser }">
			<input type="button" style="cursor:pointer; font-weight:bold; font-size: 20px;width:100%;height:100%;border:0;background:#121212;color:#AAAAAA;"onclick="location.href='/MS/user/logout.do'" value="Log out"/>
			</c:if>
            
          </span>
        
        </div>
	 	 <div class="album__info">
          
            <div style="margin:0 auto;">
            
              <img src="./img/post-malone.jpg" alt="When It's Dark Out "style="border-radius:250px 250px 250px 250px" width="500px"height="400px">
              
            </div>
            
         </div>
         
         <div style="color:white;position:relative;text-align:center;">
         	<h3>${authUser.name}</h3>	
         	<button style="float:right; position:absolute;top: -200%;left: 64%;background:none;padding:0px 0px;width:45px;height:45px;" onclick="location.href='/MS/user/edit.do?no=${authUser.no}'"><img height="45px"width="45px" src="./img/setting_icon.png"></button>
         </div>
              
        
        
        <div class="album">        
          
          <div class="album__tracks">
          
            <div class="tracks">
              
              <div class="tracks__heading">
              
                <div class="tracks__heading__number">#</div>
                
                <div class="tracks__heading__title ">Favorite Song</div>
                
                <div class="tracks__heading__length">
                
                  <i class="ion-ios-stopwatch-outline"></i>
                  
                </div>
                
                <div class="tracks__heading__popularity">
                
                  <i class="ion-thumbsup"></i>
                  
                </div>
                
              </div>
		 <c:forEach var="vo" items="${list}">
              <div class="track">

                <div class="track__number">
                		<script>
							document.write(i);
							i+=1;
						</script></div>

                <div class="track__added">

                  <i class="ion-checkmark-round added"></i>

                </div>

                <div class="track__title">
                	<input type="hidden" name="no" value="${vo.no }">
					<a href="javascript:void(0)" class="song" onclick = "music_click(${vo.no})">${vo.title }</a>
				</div>

                <div class="track__explicit">

                <span>					
  
			    </span>

                </div>
                
                <div class="track__length" style="font-size:13px">                	
                	<c:if test="${vo.a_no == 1 }">
                		<p>Hollywood's Bleeding</p>
						
					</c:if>
					<c:if test="${vo.a_no == 2 }">
						<p>Beerbongs & Bentleys</p>
					</c:if>
				</div>
                
                <div class="track__popularity">
                
                  <i class="ion-arrow-graph-up-right"></i>
                  
                </div>

              </div>
       	  </c:forEach>
            </div>
            
          </div>
          
        </div>
        
      </div>

</body>
</html>