<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 로그인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
<c:if test="${!empty msg}">
	alert('${msg}');
</c:if>
	$(function() {
		$("form input[type='button']").click(function(){
			if ($("#id").val().trim() == '') {
				alert('아이디를 입력하세요');
				$("#id").focus();
				return false;
			}
			if ($("#pwd").val().trim() == '') {
				alert('비밀번호를 입력하세요');
				$("#pwd").focus();
				return false;
			}
			// 폼전송
			$(".loginFrm").submit();
		});
	});
</script>
<!-- 카카오 로그인 API S -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type='text/javascript'>
$(function() {
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('f6434329e433f642218a332bfb4f5b48');
    
    /*
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        alert(JSON.stringify(authObj));
      },
      fail: function(err) {
         alert(JSON.stringify(err));
      }
    });
    */
    
    $("#kakaoBtn").click(function() {
        // 로그인 창을 띄웁니다.
        Kakao.Auth.loginForm({
			success: function(authObj) {
           		console.log(JSON.stringify(authObj));

				Kakao.API.request({
					url: '/user/write2.do',
					success: function(res) {

						console.log('kakao id : '+res.id);
						console.log('kakao email : '+res.kakao_account.email);
						console.log('kakao birthday : '+res.kakao_account.birthday);
						console.log('kakao gender : '+res.kakao_account.gender);
						console.log('kakao nickname : ' +res.properties['nickname']);
				 	},
				 	fail: function(error) {
						alert(JSON.stringify(error));
						console.log("1");
				 	}
				});
			},
			fail: function(err) {
			  alert(JSON.stringify(err));
			  console.log("2");
			}
        });
        
    });
  //]]>
});
</script>
</head>
<body>
<h2>회원 로그인</h2>
<form action="login.do" method="post" class="loginFrm">
<input type="hidden" name="url" value="${param.url }"/>
<table border="1">
	<tr>
		<td>아이디</td>
		<td>
			<input type="text" name="id" id="id">
		</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td>
			<input type="password" name="pwd" id="pwd">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="button" value="로그인">
		</td>
	</tr>
</table>
<a href="write2.do" id="kakaoBtn"><img src="../img/kakao_loginform.png"></a>
</form>
</body>
</html>