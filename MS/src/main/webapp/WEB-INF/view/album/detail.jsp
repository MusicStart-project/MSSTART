<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${vo.title}</title>

<style>
.top_content{
--swiper-theme-color: #007aff;
--swiper-navigation-size: 44px;
font-family: -apple-system,BlinkMacSystemFont,AppleSDGothicNeo,Helvetica,"\B9D1\C740   \ACE0\B515",Malgun Gothic,"\B3CB\C6C0",Dotum,sans-serif;
font-size: 14px;
line-height: 1.25em;
text-align: left;
margin:0;
padding: 0;
display: table-cell;
vertical-align: middle;

}

.img_box{

--swiper-theme-color: #007aff;
--swiper-navigation-size: 44px;
font-family: -apple-system,BlinkMacSystemFont,AppleSDGothicNeo,Helvetica,"\B9D1\C740   \ACE0\B515",Malgun Gothic,"\B3CB\C6C0",Dotum,sans-serif;
font-size: 14px;
line-height: 1.25em;
text-align: center;
margin: 0;
padding: 0;
float: left;
width: 110px;
height: 110px;
margin-right: 18px;
margin-left:5px;
}
.info{
	--swiper-theme-color: #007aff;
--swiper-navigation-size: 44px;
font-family: -apple-system,BlinkMacSystemFont,AppleSDGothicNeo,Helvetica,"\B9D1\C740   \ACE0\B515",Malgun Gothic,"\B3CB\C6C0",Dotum,sans-serif;
font-size: 15px;
line-height: 1.45em;
margin: 0;
padding: 0;
display: table;
overflow: hidden;
height: 100px;
margin-right: 34px;
text-align: left;
}

.lyrics{

--swiper-theme-color: #007aff;
--swiper-navigation-size: 44px;
font-family: -apple-system,BlinkMacSystemFont,AppleSDGothicNeo,Helvetica,"\B9D1\C740   \ACE0\B515",Malgun Gothic,"\B3CB\C6C0",Dotum,sans-serif;
font-size: 14px;
line-height: 1.25em;
margin: 0;
overflow-x: hidden;
overflow-y: auto;
width: 368px;
max-height: 349px;
margin-top: 25px;
padding: 0 35px;
color: #666;
text-align: left;
outline: none;
}

.lyrics_text{
--swiper-theme-color: #007aff;
--swiper-navigation-size: 44px;
font-family: -apple-system,BlinkMacSystemFont,AppleSDGothicNeo,Helvetica,"\B9D1\C740   \ACE0\B515",Malgun Gothic,"\B3CB\C6C0",Dotum,sans-serif;
color: #666;
text-align: left;
margin: 0;
padding: 0;
font-size: 14px;
line-height: 22px;
white-space: pre-line;
}
.whitespace{

--swiper-theme-color: #007aff;
--swiper-navigation-size: 44px;
font-family: -apple-system,BlinkMacSystemFont,AppleSDGothicNeo,Helvetica,"\B9D1\C740   \ACE0\B515",Malgun Gothic,"\B3CB\C6C0",Dotum,sans-serif;
color: #666;
text-align: left;
font-size: 14px;
line-height: 22px;
white-space: pre-wrap;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div class="top_content">
	<div class="img_box">
		<c:if test="${vo.a_no ==1}">
		<img src="/MS/img/album1.png" alt="Hollywood's Bleeding 앨범 커버" style="height: 100px; width: 100px;">
		</c:if>
		<c:if test="${vo.a_no ==2}">
		<img src="/MS/img/album2.jpg" alt="beerbongs & bentleys 앨범 커버" style="height: 100px; width: 100px;">
		</c:if>
	</div>
		<div class="info">
		<p><b>${vo.title}</b><p>
		<span>post malon</span>
		</div>
</div>
<div> 
	<audio controls style="margin-left:15px; width:350px">
 	 <source src="/MS/upload/${vo.filename}" type="audio/mpeg">
	<p>Your browser does not support the audio element.</p>
	</audio></div>
<div class="lyrics">
 		<p class="lylics_text"><span class="whitespace"> ${vo.lyrics}</span></p>
</div>
	
<script>
function del() {
	if (confirm('정말 삭제하시겠습니까?')) {
		$.ajax({
			url:'delete.do',
			data:{no:${vo.no}},
			type:'HTML',
			method:'GET',
			cache:false,
			async:false,
			success:function(res) {
				//console.log(data);
				if (res == 'true') {
					alert('정상적으로 삭제되었습니다.');
					location.href='index.do';
				} else {
					alert('삭제 오류');
				}
			}
		});
	}
}
</script>
</body>
</html>