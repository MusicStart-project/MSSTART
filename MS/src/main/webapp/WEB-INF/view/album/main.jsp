<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>webgl test</title>

<script src="../js/three.js"></script>
<script src="../js/OrbitControls.js"></script>
<script src="../js/3Dink.js"></script>
</head>
<body>

<video id="video" loop crossOrigin="anonymous" playsinline style="display:none" controls autoplay muted="muted">
<source src="../video/background.mp4" type='video/mp4; codecs="avc1.42E01E, mp4a.40.2"'>
</video> 

<script>
var width = window.innerWidth;
var height = window.innerHeight;
var scene = new THREE.Scene();
var camera = new THREE.PerspectiveCamera(45, width / height, 0.1, 10000);
var controls;
camera.position.x = 30;
camera.position.y = 0;
camera.position.z = 0;
   
camera.getEffectiveFOV();
var renderer = new THREE.WebGLRenderer( { antialias: true, preserveDrawingBuffer: true } );
   
renderer.setSize(width, height);
document.body.appendChild( renderer.domElement );
renderer.shadowMapEnabled = true;
renderer.shadowMap.type = THREE.PCFSoftShadowMap;

//camera controler
function control(){    
controls = new THREE.OrbitControls( camera, renderer.domElement );
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

//배경 비디오
var video = document.getElementById( 'video' );
video.play();
var texture = new THREE.VideoTexture( video );

scene.background = texture;

//테스트 상자

var box = new THREE.Mesh(new THREE.BoxGeometry(30,30,30),new THREE.MeshBasicMaterial({map: new THREE.TextureLoader().load('../img/Circles.PNG'), side:THREE.FrontSide,transparent: true, opacity : 0.5}));
box.position.set(-27,0,0);
scene.add(box);
var ambientLight = new THREE.AmbientLight( 0xFFFFFF, 1 );    
scene.add(ambientLight);    

 window.addEventListener('resize', function()
{    var width = window.innerWidth;
    var height = window.innerHeight;
   renderer.setSize(width, height);
   camera.aspect = width / height;
	camera.updateProjectionMatrix();
	
});

 
 function render(){
	 renderer.render(scene,camera);
	 }

	 var loop = function()
	 {

	 render();     
	 controls.update();
	 requestAnimationFrame( loop );
	   
	 }
	    
	 loop();
</script>
</body>
</html>