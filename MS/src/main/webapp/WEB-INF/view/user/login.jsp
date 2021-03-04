<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
  
<link rel="apple-touch-icon" type="image/png" href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png">
<meta name="apple-mobile-web-app-title" content="CodePen">
<link rel="mask-icon" type="" href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111">

<link rel="shortcut icon" type="image/x-icon" href="<%=request.getContextPath()%>/img/ms_icon.png">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/loginform1.css" type="text/css">

<title>Login</title>
  
  
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/smoothness/jquery-ui.css">
  


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
<c:if test="${!empty msg}">
	alert('${msg}');
</c:if>
	$(function() {
		$("#button").click(function(){
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
			if($("#pwd").val().length <8){
				alert('비밀번호는 8자 이상입니다.');
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

<body translate="no">
<form action="login.do" method="post" class="loginFrm">
<input type="hidden" name="url" value="${param.url }"/>
<div class="login">
  <div class="login_title">
    <span>Login to your account</span>
  </div>
  <div class="login_fields">
    <div class="login_fields__user">
      <div class="icon">
        <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/217233/user_icon_copy.png">
      </div>
      <input placeholder="Username" type="text" name="id" id="id">
        <div class="validation">
          <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/217233/tick.png">
        </div>
      
    </div>
    <div class="login_fields__password">
      <div class="icon">
        <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/217233/lock_icon_copy.png">
      </div>
      <input placeholder="Password" type="password" name="pwd" id="pwd">
      <div class="validation">
        <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/217233/tick.png">
      </div>
    </div>
    <div class="login_fields__submit">
      <input type="button" value="Log In" id="button">
      <div class="forgot">
        <a href="write.do">Sign Up?</a>
      </div>
      <div>
			<a href="write2.do" id="kakaoBtn" ><img src="../img/kakao_loginform.png" id="kakao_img"></a>			
      </div>
    </div>
  </div>
  <div class="success">
    <h2>Authentication Success</h2>
    <p>Welcome back</p>
  </div>
  <div class="disclaimer">
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce semper laoreet placerat. Nullam semper auctor justo, rutrum posuere odio vulputate nec.</p>
  </div>
</div>
<div class="authent">
  <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/217233/puff.svg">
  <p>Authenticating...</p>
</div>
</form>

<script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
<script id="rendered-js">


$('input[type="text"],input[type="password"]').focus(function () {
  $(this).prev().animate({ 'opacity': '1' }, 200);
});
$('input[type="text"],input[type="password"]').blur(function () {
  $(this).prev().animate({ 'opacity': '.5' }, 200);
});

$('input[type="text"],input[type="password"]').keyup(function () {
  if (!$(this).val() == '') {
    $(this).next().animate({ 'opacity': '1', 'right': '30' }, 200);
  } else {
    $(this).next().animate({ 'opacity': '0', 'right': '20' }, 200);
  }
});

var open = 0;
$('.tab').click(function () {
  $(this).fadeOut(200, function () {
    $(this).parent().animate({ 'left': '0' });
  });
});
//# sourceURL=pen.js
</script>
