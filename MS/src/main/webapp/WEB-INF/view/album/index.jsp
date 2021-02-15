<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="user.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>앨범 목록</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
function moveWrite() {
	
	location.href='write.do';
	
}
</script>
</head>
<body>
<h2>앨범목록</h2>

<%@ include file="/WEB-INF/view/include/common.jsp" %>
${reqPage }/${totalPage } 

<br>
<table border="1">
	<tr>
		<td>노래 번호</td>
		<td>제목</td>
		<td>앨범 번호</td>
	</tr>
<c:forEach var="vo" items="${list}">
	<tr>
		<td>${vo.no }</td>
		<td><a href="detail.do?no=${vo.no }">${vo.title }</a></td>
		<td>${vo.a_no }</td>
	</tr>
</c:forEach>
</table>
<c:if test="${startPage > 10}">
<a href="index.do?reqPage=${startPage-1 }">[이전]</a>
</c:if>
<c:forEach var="rp" begin="${startPage }" end="${endPage }">
<a href="index.do?reqPage=${rp }">[${rp }]</a>
</c:forEach>
<c:if test="${totalPage > endPage }">
<a href="index.do?reqPage=${endPage+1 }">[다음]</a>
</c:if>
<a href="javascript:moveWrite();"><input type="button" value="등록"></a>
<br>
</body>
</html>








