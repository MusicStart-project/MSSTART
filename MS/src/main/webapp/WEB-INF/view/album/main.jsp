<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">

<title>Main Page</title>
<style>

#intro_content{
	position: absolute;
	left:0%;
}

#intro{
	text-align: center;
	background-image: url('https://pm1.narvii.com/6811/85b4e886c823657fac2dc5257aa0253b2a8d4b40v2_hq.jpg');
}

#intro_font{
	font-size : 300%;
	font-family: 'Linux Libertine','Georgia','Times',serif;
}
#intro_img{
    width: auto; height: auto;
    max-width: 80%;
    max-height: 80%;

}

body{
	margin : 0;
	overflow-x:hidden;
	overflow-y:hidden;
}


#overlay {
	position: absolute;
	z-index: 2;
	top: 0;
	left: 0;
	width: 100%;
	height:100%;
	display: flex;
	align-items: center;
	justify-content: center;
	opacity: 1;
	background-color: #000000;
	color: #ffffff;
}


a, button, input, select, span {
	pointer-events: auto;
}
talbe{
	frame=void
	
	}
a.title:hover {
   text-decoration: underline; 
}

.title{
  text-decoration: none;
  color : #232323;
  cursor: pointer;
  
  }
<!-- light box css -->
.black_overlay{
        display: none;
        position: absolute;
        top: 0%;
        left: 0%;
        width: 100%;
        height: 100%;
        background-color: black;
        z-index:1001;
        -moz-opacity: 0.8;
        opacity:.80;
        filter: alpha(opacity=80);
    }
    
    .white_content {
        display: none;
        position: absolute;
        top: 25%;
        left: 22.627%;
        width: 50%;
        height: 50%;
        padding: 16px;
        border: 16px solid rgb(21, 34, 54);
        background-color: rgb(255, 255, 255);
        
        z-index:1002;
        overflow: auto;
        
    }
    .album_content {
        display: none;
        position: absolute;
        top: 15%;
        left: 33%;
        width: 33%;
        height: 70%;
        padding: 16px;
        border: 12px solid rgb(50, 50, 50);
        background-color: rgb(255, 255, 255);
        opacity:.80;
        z-index:1002;
        overflow: auto;
    }
    
    .song{
    	height:50px;
    	padding-left:11px;
    	text-align:left;
    	color:#232323;
    	font-family:-apple-system,BlinkMacSystemFont,AppleSDGothicNeo,Helvetica,"\B9D1\C740   \ACE0\B515",Malgun Gothic,"\B3CB\C6C0",Dotum,sans-serif;
    	}
    	
    .singer{
    	text-align:center;
    	color : #808080;
    	font-size: 13px;
    	text-align: center;
    	font-family:-apple-system,BlinkMacSystemFont,AppleSDGothicNeo,Helvetica,"\B9D1\C740   \ACE0\B515",Malgun Gothic,"\B3CB\C6C0",Dotum,sans-serif;
    	
    }
    
    .likebut{
    	width:40px;
    	text-align: center;
    }
</style>
<script src="./js/three.js"></script>
<script src="./js/OrbitControls.js"></script>
<script src="./js/3Dink.js"></script>
<script src="./js/dat.gui.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>

$(function(){
	// 추천버튼 클릭시(추천 추가 또는 추천 제거)
	$(".favorite").click(function(){
		//location.href='liked.do';
		<c:if test="${empty authUser }">
		location.href='user/login.do';
		</c:if>
		<c:if test="${!empty authUser }">
		var val = $(this).text();
		var obj = $(this);
		$.ajax({
			url: "like.do",
            type: "POST",
            data: {
                music_no: $(this).data("no"),
                user_no: ${authUser.no}
            },
            success: function () {
            	//alert(val+"성공");
            	if (val=='♥') {
            		obj.text('♡');
            	} else {
            		obj.text('♥');
            	}
            },
           
		});
		</c:if>
	});
}
);

function music_click(){
	
	<c:if test="${empty authUser }">
	location.href='user/login.do';
	</c:if>
	<c:if test="${!empty authUser }">
	window.open('album/detail.do?no=${vo.no}','test', 'menubar=no, status=no, toolbar=no, location=no, resizable=no, width=400, height=650');
	</c:if>
	
}


</script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bio.css" type="text/css">
</head>
<body>

<div id="intro" class="white_content">
	<div style="position: absolute;left:0%; ">	
	<div id="main" class="container">
  <div class="col-1">
    <div class="header-info">
      <h2 id="title">Post Malone</h2>
    </div>
    <div id="img-div">
      <img src="./img/intro_img.jpg" alt="Post Malone Tribute" id="image" class="img-resp">
      <div class="icons">
      </div>
      <div class="playlist">
        <div>
      </div>
    </div>
  </div>
  <div class="col-2">
    <div id="tribute-info">
      <h2 class="display-2">Bio</h2>
      <p>Austin Post, well-known by the stage name Post Malone, is a popular American songwriter, singer, guitarist and recording artist born on July 4, 1995, in Syracuse, New York. He became famous after “White Iverson”, his first single released on SoundCloud
        in 2015 (February) which got a million views only within the first month. The singer signed a contract with Republic Records and keeps recording more music, such as “Too Young” (another popular song). His fans recognize him because of gold teeth
        and braids in his hair, and this rapper is white.
      </p>
      <h2 class="display-2">Albums</h2>
      <div class="album-gallery">
        <div class="album-info">
          <img class="album-thumbnail" src="./img/album1.png" alt="Hollywood's Bleeding Album Cover">
          <p class="album-title">Hollywood's Bleeding</p>
          <p class="album-year">2019</p>
        </div>
        <div class="album-info">         
          <img class="album-thumbnail" src="./img/album2.jpg" alt="Beerbongs and Betleys">
          <p class="album-title">Beerbongs & Bentleys</p>
          <p class="album-year">2018</p>
        </div>
        <div class="album-info">
          <img class="album-thumbnail" src="http://s3.amazonaws.com/hiphopdx-production/2016/11/Post-Malone-Stoney-album-cover-640x640.jpg" alt="Stoney Album Cover">
          <p class="album-title">Stoney</p>
          <p class="album-year">2016</p>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
    <a href = "javascript:void(0)" onclick = "document.getElementById('intro').style.display='none';" align="right">Close</a>
	</div>
</div>

<div id="container" class="black_overlay"></div>

<div id="album1" class="album_content" >
	<div id=album1_list>
	<table border="0" width="100%" cellspacing="0">
	<c:forEach var="vo" items="${list}">
	<c:if test="${vo.a_no == 1}">
		<tr onmouseover="this.style.background='#d2d2d2'" onmouseout="this.style.background='white'">
		<td class = "song"><a href="javascript:void(0)" class="title" onclick = "music_click()">${vo.title }</a></td>
		<td class ="singer">Post Malone</td>
		<td class="likebut" >
		<input type="hidden" id="music_no" name="no" value="${vo.no }">		
			<c:if test="${!empty authUser }">
			<span class="favorite" style="color:red; cursor:pointer;" data-no="${vo.no }">♥</span>
			</c:if>
			<c:if test="${empty authUser }">
			<span class="favorite"  style="color:red; cursor:pointer;">♡</span>
			</c:if></td>
		</tr>
	</c:if>
	</c:forEach>
		
	</table>

	</div>
    <a href = "javascript:void(0)" onclick = "document.getElementById('album1').style.display='none';" style="margin-left:45%">Close</a>
	</div>

<div id="album2" class="album_content">
<div id=album2_list>
	<table border="0" width="100%" cellspacing="0">
	<c:forEach var="vo" items="${list}">
	<c:if test="${vo.a_no == 2}">
		<tr onmouseover="this.style.background='#d2d2d2'" onmouseout="this.style.background='white'">
		<td class="song"><a href="javascript:void(0)" class="title" onclick = "music_click()">${vo.title }</a></td>
		<td style="color : gray; font-size: 13px; text-align: center;" class="singer">Post Malone</td>
		<td class="likebut" >
		<input type="hidden" id="music_no" name="no" value="${vo.no }">		
			<c:if test="${!empty authUser }">
			<span class="favorite" style="color:red;" data-no="${vo.no }">♥</span>
			</c:if>
			<c:if test="${empty authUser }">
			<span class="favorite"  style="color:red;">♡</span>
			</c:if></th>
		</tr>
	</c:if>
	</c:forEach>
	</table>

	</div>
    <a href = "javascript:void(0)" onclick = "document.getElementById('album2').style.display='none';" style="margin-left:45%">Close</a>
</div>
<div id="board" class="white_content">
	<iframe id="iframe" style="position: relative;
         border: none;
         height: 100%;
         width: 100%;
        "src="http://localhost/MS/admin/board/index.do"></iframe>
    <a href = "javascript:void(0)" onclick = "document.getElementById('board').style.display='none';" style="margin-left:45%">Close</a>	
</div>
    
<audio loop id="music" preload="auto" style="display: none">
		<source src="./upload/1613375880426.mp3" type="audio/mpeg">
</audio>

<!-- 비디오 설정들 -->
<video id="video" loop crossOrigin="anonymous" playsinline style="display:none" controls autoplay muted="muted">
<source src="./video/newbackground.mp4" type='video/mp4; '>
</video> 
<video id="intro_video" loop crossOrigin="anonymous" playsinline style="display:none" controls autoplay muted="muted">
<source src="./video/background1.mp4" type='video/mp4; '>
<source src="./video/newbackground.mp4" type='video/mp4; '>
</video> 
<video id="album1_video" loop crossOrigin="anonymous" playsinline style="display:none" controls autoplay muted="muted">
<source src="./video/background2.mp4" type='video/mp4; '>
<source src="./video/newbackground.mp4" type='video/mp4; '>
</video> 
<video id="album2_video" loop crossOrigin="anonymous" playsinline style="display:none" controls autoplay muted="muted">
<source src="./video/background3.mp4" type='video/mp4; '>
<source src="./video/newbackground.mp4" type='video/mp4; '>
</video> 
<video id="board_video" loop crossOrigin="anonymous" playsinline style="display:none" controls autoplay muted="muted">
<source src="./video/background4.mp4" type='video/mp4; '>
<source src="./video/newbackground.mp4" type='video/mp4; '>
</video> 

<script type="text/javascript">

//변수선언
// 오브젝트 갯수
const num = 4;
var width = window.innerWidth;
var height = window.innerHeight;

//우측상단 gui 모델 선언


var scene = new THREE.Scene();
var camera = new THREE.PerspectiveCamera(45, width / height, 0.1, 10000);

const container = document.getElementById( 'container' );
const audioElement = document.getElementById( 'music' );  

camera.position.x = 0.1;
camera.position.y = 0;
camera.position.z = 0;
camera.getEffectiveFOV();

//렌더링시 자연스러운 효과 추가 
var renderer = new THREE.WebGLRenderer( { antialias: true, preserveDrawingBuffer: true } );
var controls = new THREE.OrbitControls( camera, renderer.domElement );

renderer.setSize(width, height);

container.appendChild( renderer.domElement );

// 그림자 맵 사용
renderer.shadowMapEnabled = true;
renderer.shadowMap.type = THREE.PCFSoftShadowMap;
	
	
	
 
/*grid Helper    
var axes = new THREE.AxesHelper(200);
                           // 길이
scene.add(axes);

var grideHelper = new THREE.GridHelper( 200,10 );

scene.add(grideHelper);
*/
	
	

	//camera controler
	function control(){    
		controls.enablePan = false;
		controls.enableZoom = false;
		controls.rotateSpeed = 0.7;
		controls.zoomSpeed = 5;
		controls.minDistance = 3;
		controls.maxDistance = 1000;
		controls.minPolarAngle = Math.PI/2;
		controls.maxPolarAngle = Math.PI/2;
		controls. enableKeys = false;
		controls.autoRotate = true;
		controls.autoRotateSpeed = -0.3;
		controls.keys = {
			LEFT: 65, //left arrow
			UP: 87, // up arrow
			RIGHT: 68, // right arrow
			BOTTOM: 83 // down arrow
		};  
		controls.keyPanSpeed = 15.0;
	
		//카메라기준 페닝으로 변경 
		controls.screenSpacePanning = true;   
	}
	
	control();
	
	
	// create a global audio source
	const listener = new THREE.AudioListener();
	camera.add( listener );
	
	
	//배경 비디오 호출
	var video = [];
	video[0] = document.getElementById( 'video' );
	video[1] = document.getElementById( 'intro_video' );
	video[2] = document.getElementById( 'album1_video' );
	video[3] = document.getElementById( 'album2_video' );
	video[4] = document.getElementById( 'board_video' );
	
	for (var i = 0; i<5; i++)
		{
			video[i].play();	
		
		}
	
	var Ontexture = new THREE.VideoTexture( video[0] );
	scene.background = Ontexture;
	
	var box = [];
	
	// 소개
	box[0] = new THREE.Mesh(new THREE.BoxGeometry(5,30,30),new THREE.MeshBasicMaterial({map: new THREE.TextureLoader().load('./img/intro.jpg'), side:THREE.FrontSide,transparent: true, opacity : 0.5}));
	box[0].position.set(-60,0,0);
	
	// 앨범 1 왼쪽
	box[1] = new THREE.Mesh(new THREE.BoxGeometry(5,30,30),new THREE.MeshBasicMaterial({map: new THREE.TextureLoader().load('./img/album1.png'), side:THREE.FrontSide,transparent: true, opacity : 0.5}));
	box[1].position.set(0,0,60);
	box[1].rotation.set(0,Math.PI/2,0);
	
	// 앨범 2 오른쪽
	box[2] = new THREE.Mesh(new THREE.BoxGeometry(5,30,30),new THREE.MeshBasicMaterial({map: new THREE.TextureLoader().load('./img/album2.jpg'), side:THREE.FrontSide,transparent: true, opacity : 0.5}));
	box[2].position.set(0,0,-60);
	box[2].rotation.set(0,Math.PI/2,0);

	// 자유 게시판 3
	box[3] = new THREE.Mesh(new THREE.BoxGeometry(5,30,30),new THREE.MeshBasicMaterial({map: new THREE.TextureLoader().load('./img/board.jpg'), side:THREE.FrontSide,transparent: true, opacity : 0.5}));
	box[3].position.set(60.1,0,0);
	
	for (var i = 0; i<num; i++){
		scene.add(box[i]);	
	}
	
	
	// 전체 밝기(텍스쳐가 Basic이 아닌 경우)
	var ambientLight = new THREE.AmbientLight( 0xFFFFFF, 1 );    
	scene.add(ambientLight);    


// 윈도우 크기에 따른 화면 조정 함수
 window.addEventListener('resize', function()
{    
	var width = window.innerWidth;
    var height = window.innerHeight;
   	renderer.setSize(width, height);
   	camera.aspect = width / height;
	camera.updateProjectionMatrix();
	
});

	// 마우스 좌표 이동에 따른 변화
 container.addEventListener( 'mousemove', onMouseMove, false );
 function onMouseMove( event ) {
     var x,y;
     x = (event.clientX / window.innerWidth) * 2 - 1;
     y = -(event.clientY / window.innerHeight) * 2 + 1;
    var dir = new THREE.Vector3(x, y, -1);
    dir.unproject(camera);
     
     var ray = new THREE.Raycaster(camera.position, dir.sub(camera.position).normalize())
    
     var intersect = [];
     var scenein = ray.intersectObjects(scene.children); 
     for (var i = 0; i < num; i++){ 
        intersect[i] = ray.intersectObject(box[i]);     
       if ( intersect[i].length > 0 ) {
             box[i].material.transparent = false;
        	 //audioElement.play();
             }
      if ( scenein.length == 0 ) {
         	box[i].material.transparent = true;
     	   	
     
             }       
           }                                    
      }
 
 // 마우스 클릭으로 좌표값에 의한 이벤트
 container.addEventListener( 'click', onClick, false );
 function onClick( event ) {
     var x,y;
     x = (event.clientX / window.innerWidth) * 2 - 1;
     y = -(event.clientY / window.innerHeight) * 2 + 1;
    var dir = new THREE.Vector3(x, y, -1);
    dir.unproject(camera);
     
     var ray = new THREE.Raycaster(camera.position, dir.sub(camera.position).normalize())
    
     var intersect = [];
     var scenein = ray.intersectObjects(scene.children); 
     
     for (var i = 0; i < num; i++){ 
        intersect[i] = ray.intersectObject(box[i]);     
       if ( intersect[i].length > 0 ) {
    	  if( i == 0){
    	  document.getElementById('intro').style.display='block';
     	  document.getElementById('container').style.display='block';
     	  document.getElementById('album2').style.display='none'
     	  document.getElementById('album1').style.display='none'
     	  document.getElementById('board').style.display='none'
     	  scene.background = new THREE.VideoTexture( video[i+1] );
    	  }
    	  
    	  if( i == 1){
        	  document.getElementById('album1').style.display='block';
         	  document.getElementById('container').style.display='block';
         	  document.getElementById('album2').style.display='none'
              document.getElementById('board').style.display='none'
              document.getElementById('intro').style.display='none'
         	  scene.background = new THREE.VideoTexture( video[i+1] );
         }
    	
    	  if( i == 2){
        	  document.getElementById('album2').style.display='block';
         	  document.getElementById('container').style.display='block';
         	  document.getElementById('intro').style.display='none'
              document.getElementById('album1').style.display='none'
              document.getElementById('board').style.display='none'
         	  scene.background = new THREE.VideoTexture( video[i+1] );
        }
    	  
    	if( i == 3){
    		
    		
    		  <c:if test="${empty authUser }">
    		  location.href='user/login.do';
    		  </c:if>
    		  
    		  <c:if test="${!empty authUser }">
        	  document.getElementById('board').style.display='block';
         	  document.getElementById('container').style.display='block';
         	  document.getElementById('album2').style.display='none'
              document.getElementById('album1').style.display='none'
              document.getElementById('intro').style.display='none'
         	  scene.background = new THREE.VideoTexture( video[i+1] );
         	  </c:if>
        }
    	  
      	  audioElement.pause();
             }
           }                                    
      }

 // 화면 출력 및 애니메이팅, 루프함수
function render (){
	 renderer.render(scene,camera);
 }

var loop = function(){
	 render();
	 controls.update();
	 requestAnimationFrame( loop ); 
}
	 
loop();	 

</script>
</body>
</html>