<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<style>
	#frm{
		visibility : hidden;
	}
	#loginfrm{
		left : 30%;
		visibility : hidden;
	
	}
	
	
</style>

<script type='text/javascript'>

<c:if test="${!empty msg}">
alert('${msg}');
</c:if>

Kakao.init('f6434329e433f642218a332bfb4f5b48');

Kakao.Auth.login({
	success: function(authObj) {
	
		Kakao.API.request({
			url: '/v2/user/me',
			success: function(res) {
				console.log(res);
				var id = res.id;
				var email = res.kakao_account.email;
				var nickname = res.properties['nickname'];
				document.getElementById("kakao_id").value = id;
				document.getElementById("email").value = email;
				document.getElementById("name").value = nickname;
				document.getElementById("id").value = email;
				$("#login_id").val(email);
				document.getElementById("login_pwd").value = 11111111;
				document.getElementById("pwd").value = 11111111;
				
				$.ajax({
					url:'/MS/user/isDuplicateId.do',
					data:{id:$("#id").val()},
					type:'HTML',
					method:'GET',
					cache:false,
					async:false,
					success:function(data) {
						//console.log(data);
								if (data == 'true') {
											$(function() {
													$("#loginFrm").submit();
											});
									}
								else{
									$(function() {
										formCheck();
									});
								}
							}
							
						});	
			}
		})
		 console.log(authObj);
		 var token = authObj.access_token;
		},
		fail: function(err){
			alert(JSON.stringify(err));
		}
	});
	
						
</script>
<script>

function formCheck() {
	// 폼에 있는 모든 데이터를 한번에 읽어오는 방법
	var data = $("#frm").serialize();
	//console.log(data);
	$.ajax({
		url:'/MS/user/insertKakao.do',
		data:data,
		type:'HTML',
		method:'POST',
		cache:false,
		success:function(data) {
			//console.log(data);
			if (data == 'true') {
				// 모든 입력란을 초기화
				//$("input[type='text'], input[type='password']").val("");
				//$("#frm")[0].reset();
				location.href="write2.do";
			} else {
				alert("등록 실패");
			}
		}
	});
}

</script>
</head>
<body>
<form action="insertKakao.do" method="post" id="frm" onsubmit="return false;">
<table border="1">
	<tr>
		<td>카카오아이디</td>
		<td>
			<input type="text" name="kakao_id" id="kakao_id" readonly><br>
		</td>
	</tr>
		<input type="hidden" name="id" id="id">
		<input type="hidden" name="pwd" id="pwd">
	<tr>
		<td>이름</td>
		<td><input type="text" name="name" id="name" readonly></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="email" id="email" readonly></td>
	</tr>
</table>
</form>

<form action="write2.do" method="post" id="loginFrm">
<input type="hidden" name="url" value="${param.url }"/>

<input type="hidden" name="id" id="login_id">
<input type="hidden" name="pwd" id="login_pwd">

</form>

</body>
</html>