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

</style>

<script src="./js/three.js"></script>
<script src="./js/OrbitControls.js"></script>
<script src="./js/3Dink.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

</head>
<body>

<audio loop id="music" preload="auto" style="display: none">
		<source src="./upload/1613375880426.mp3" type="audio/mpeg">
</audio>

<video id="video" loop crossOrigin="anonymous" playsinline style="display:none" controls autoplay muted="muted">
<source src="./video/background.mp4" type='video/mp4; codecs="avc1.42E01E, mp4a.40.2"'>
</video> 


<script type="text/javascript">

//변수선언
var width = window.innerWidth;
var height = window.innerHeight;

var scene = new THREE.Scene();
var camera = new THREE.PerspectiveCamera(45, width / height, 0.1, 10000);

camera.position.x = 30;
camera.position.y = 0;
camera.position.z = 0;
camera.getEffectiveFOV();

 
var renderer = new THREE.WebGLRenderer( { antialias: true, preserveDrawingBuffer: true } );
var controls = new THREE.OrbitControls( camera, renderer.domElement );

renderer.setSize(width, height);
document.body.appendChild( renderer.domElement );

// 그림자 맵 사용
renderer.shadowMapEnabled = true;
renderer.shadowMap.type = THREE.PCFSoftShadowMap;
	

	
	
	
	//렌더링시 자연스러운 효과 추가
	  
	//camera controler
	function control(){    
		controls.enablePan = false;
		controls.enableZoom = true;
		controls.rotateSpeed = 0.7;
		controls.zoomSpeed = 17;
		controls.minDistance = 3;
		controls.maxDistance = 1000;
		controls.minPolarAngle = Math.PI/2;
		controls.maxPolarAngle = Math.PI/2;
		controls. enableKeys = false;
		controls.autoRotate = true;
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
	var texture = new THREE.VideoTexture( video );
	scene.background = texture;
	
	var box = [];
	
	//테스트 상자
	box[0] = new THREE.Mesh(new THREE.BoxGeometry(30,30,30),new THREE.MeshBasicMaterial({map: new THREE.TextureLoader().load('./img/Circles.PNG'), side:THREE.FrontSide,transparent: true, opacity : 0.5}));
	box[0].position.set(-27,0,0);
	scene.add(box[0]);
	
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


 document.addEventListener( 'mousemove', onMouseMove, false );
 function onMouseMove( event ) {
     var x,y;
     x = (event.clientX / window.innerWidth) * 2 - 1;
     y = -(event.clientY / window.innerHeight) * 2 + 1;
    var dir = new THREE.Vector3(x, y, -1);
    dir.unproject(camera);
     
     var ray = new THREE.Raycaster(camera.position, dir.sub(camera.position).normalize())
    
     var intersect = [];
     var scenein = ray.intersectObjects(scene.children); 
     for (var i = 0; i < 1; i++){ 
        intersect[i] = ray.intersectObject(box[i]);     
       if ( intersect[i].length > 0 ) {
             box[i].material.transparent = false;
             }
     
      if ( scenein.length == 0 ) {
         box[i].material.transparent = true;
     	 const audioElement = document.getElementById( 'music' );    	
     	 audioElement.play();
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