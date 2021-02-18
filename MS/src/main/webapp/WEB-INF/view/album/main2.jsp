<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">

<title>Main Page</title>
<style>

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


a, button, input, select {
	pointer-events: auto;
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
        left: 25%;
        width: 50%;
        height: 50%;
        padding: 16px;
        border: 16px solid rgb(21, 34, 54);
        background-color: rgb(255, 255, 255);
        opacity:.80;
        z-index:1002;
        overflow: auto;
    }
</style>
<script src="./js/three.js"></script>
<script src="./js/OrbitControls.js"></script>
<script src="./js/3Dink.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

</head>
<body>

<div id="intro" class="white_content">
	<p>intro</p>
    <a href = "javascript:void(0)" onclick = "document.getElementById('intro').style.display='none';">Close</a>
</div>

<div id="container" class="black_overlay"></div>

<div id="album1" class="white_content">
	<div id="table">
	<table>
	<tr>
	<td>
	</td>
	</tr>
	</table>
	</div>
	<p>album1</p>
    <a href = "javascript:void(0)" onclick = "document.getElementById('album1').style.display='none';">Close</a>
</div>

<div id="album2" class="white_content"><p>album2</p>
    <a href = "javascript:void(0)" onclick = "document.getElementById('album2').style.display='none';">Close</a>
</div>

<div id="board" class="white_content"><p>board</p>
    <a href = "javascript:void(0)" onclick = "document.getElementById('board').style.display='none';">Close</a>
</div>
    
<audio loop id="music" preload="auto" style="display: none">
		<source src="./upload/1613375880426.mp3" type="audio/mpeg">
</audio>

<video id="video" loop crossOrigin="anonymous" playsinline style="display:none" controls autoplay muted="muted">
<source src="./video/newbackground.mp4" type='video/mp4; '>
</video> 

<script type="text/javascript">

//변수선언
// 오브젝트 갯수
const num = 4;
var width = window.innerWidth;
var height = window.innerHeight;

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
	
	
	
 
//grid Helper    
var axes = new THREE.AxesHelper(200);
                           // 길이
scene.add(axes);

var grideHelper = new THREE.GridHelper( 200,10 );

scene.add(grideHelper);

	
	

	
	  
	//camera controler
	function control(){    
		controls.enablePan = true;
		controls.enableZoom = true;
		controls.rotateSpeed = 0.7;
		controls.zoomSpeed = 5;
		controls.minDistance = 3;
		controls.maxDistance = 1000;
		//controls.minPolarAngle = Math.PI/2;
		//controls.maxPolarAngle = Math.PI/2;
		controls. enableKeys = false;
		controls.autoRotate = false;
		controls.autoRotateSpeed = 0.3;
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
	var video = document.getElementById( 'video' );
	video.play();
	var Ontexture = new THREE.VideoTexture( video );
	var texture
	scene.background = Ontexture;
	
	var box = [];
	
	// 소개
	box[0] = new THREE.Mesh(new THREE.BoxGeometry(5,30,30),new THREE.MeshBasicMaterial({map: new THREE.TextureLoader().load('./img/Circles.PNG'), side:THREE.FrontSide,transparent: true, opacity : 0.5}));
	box[0].position.set(-60,0,0);
	
	// 앨범 1 왼쪽
	box[1] = new THREE.Mesh(new THREE.BoxGeometry(5,30,30),new THREE.MeshBasicMaterial({map: new THREE.TextureLoader().load('./img/Circles.PNG'), side:THREE.FrontSide,transparent: true, opacity : 0.5}));
	box[1].position.set(0,0,60);
	box[1].rotation.set(0,Math.PI/2,0);
	
	// 앨범 2 오른쪽
	box[2] = new THREE.Mesh(new THREE.BoxGeometry(5,30,30),new THREE.MeshBasicMaterial({map: new THREE.TextureLoader().load('./img/Circles.PNG'), side:THREE.FrontSide,transparent: true, opacity : 0.5}));
	box[2].position.set(0,0,-60);
	box[2].rotation.set(0,Math.PI/2,0);

	// 자유 게시판 3
	box[3] = new THREE.Mesh(new THREE.BoxGeometry(5,30,30),new THREE.MeshBasicMaterial({map: new THREE.TextureLoader().load('./img/Circles.PNG'), side:THREE.FrontSide,transparent: true, opacity : 0.5}));
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
    	  }
    	  
    	  if( i == 1){
        	  document.getElementById('album1').style.display='block';
         	  document.getElementById('container').style.display='block';
         }
    	
    	  if( i == 2){
        	  document.getElementById('album2').style.display='block';
         	  document.getElementById('container').style.display='block';
        }
    	  
    	if( i == 3){
        	  document.getElementById('board').style.display='block';
         	  document.getElementById('container').style.display='block';
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