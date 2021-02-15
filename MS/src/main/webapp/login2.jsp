<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type='text/javascript'>
Kakao.init('f6434329e433f642218a332bfb4f5b48');

Kakao.Auth.login({
	success: function(authObj) {
	
		Kakao.API.request({
			url: '/v2/user/me',
			success: function(res) {
				console.log(res);
				
					var id = res.id;
					var email = res.kakao_account.email;
					var name = res.properties.nickname;
					var html = '<BR>' + email +'<BR>'+name;
					
					$('body').append(html);
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
</body>
</html>