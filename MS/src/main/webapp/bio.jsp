<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bio.css" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="main" class="container">
  <div class="col-1">
    <div class="header-info">
      <h2 id="title">Post Malone</h2>
    </div>
    <div id="img-div">
      <img src="/img/intro_img.jpg" alt="Post Malone Tribute" id="image" class="img-resp">
      <p id="img-caption">Follow Me:</p>
      <div class="icons">
        <i class="fab fa-facebook fa-2x"></i>
        <i class="fab fa-twitter fa-2x"></i>
        <i class="fab fa-instagram fa-2x"></i>
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
          <img class="album-thumbnail" src="/img/album1.png" alt="Hollywood's Bleeding Album Cover">
          <p class="album-title">Hollywood's Bleeding</p>
          <p class="album-year">2019</p>
        </div>
        <div class="album-info">         
          <img class="album-thumbnail" src="/img/album2.jpg" alt="Beerbongs and Betleys">
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
</body>
</html>