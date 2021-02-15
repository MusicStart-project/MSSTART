<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:if test="${empty authUser}">
<!-- 현재 URL 가져오는 방법 request.getAttribute("javax.servlet.forward.request_uri") -->
<input type="button" value="로그인" onclick="location.href='/MS/user/login.do'">
</c:if>
<c:if test="${!empty authUser}">
${authUser.name }님 반갑습니다.
<input type="button" value="로그아웃" onclick="location.href='/MS/user/logout.do'">
</c:if>
<input type="button" value="main" onclick="location.href='/MS/main.do';">
<input type="button" value="user" onclick="location.href='/MS/user/index.do';">
<input type="button" value="album" onclick="location.href='/MS/album/index.do';">
<input type="button" value="album1" onclick="location.href='/MS/album/index.do?A_no=1';">
<input type="button" value="album2" onclick="location.href='/MS/album/index.do?A_no=2';">
