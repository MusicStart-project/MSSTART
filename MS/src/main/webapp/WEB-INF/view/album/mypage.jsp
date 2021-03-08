<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage</title>
<script>
function music_click(no){
	
	<c:if test="${empty authUser }">
	location.href='user/login.do';
	</c:if>
	<c:if test="${!empty authUser }">
	window.open('album/detail.do?no='+no+'','test', 'menubar=no, status=no, toolbar=no, location=no, resizable=no, width=400, height=650');
	</c:if>
	
}
var i=1;
</script>
</head>
<body>
<table border=1>
	<c:forEach var="vo" items="${list}">
				
				<tr onmouseover="this.style.background='#d2d2d2'" onmouseout="this.style.background='white'">
					<td>
						<script>
							document.write(i);
							i+=1;
						</script>
					</td>
					<td><input type="hidden" name="no" value="${vo.no }">
					<a href="javascript:void(0)" onclick = "music_click(${vo.no})">${vo.title }</a></td>
					<td><input type="hidden" name="a_no" value="${vo.a_no }">
					<c:if test="${vo.a_no == 1 }">
						<p>beerbongs & bentleys</p>
					</c:if>
					<c:if test="${vo.a_no == 2 }">
						<p>hollywood's bleeding</p>
					</c:if>
					</td>
				</tr>
	</c:forEach>
</table>
</body>
</html>