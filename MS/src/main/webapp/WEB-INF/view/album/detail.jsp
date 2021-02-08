<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<table border="1">
	<tr>
		<td>노래 번호</td>
		<td>${vo.no }</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>${vo.title}</td>
	</tr>
	<tr>
		<td>가사</td>
		<td>${vo.lyrics}</td>
	</tr>
	<tr>
		<td>앨범 번호</td>
		<td>${vo.a_no}</td>
	</tr>
	
	<tr>
		<td>첨부파일</td>
		<td><a href="/MS/common/download.jsp?path=/upload/&r_file=${vo.filename}&o_file=${vo.filename_org}" target="_blank">${vo.filename_org}</a></td>
	</tr>
</table>
<input type="button" value="수정" onclick='location.href="edit.do?no=${vo.no}";'>
<input type="button" value="삭제" onclick="del();">
<input type="button" value="목록" onclick='location.href="index.do";'>

<script>
function del() {
	/*
	if (confirm("정말 삭제하시겠습니까?")) {
		location.href="delete.do?no=${vo.no}";
	}
	*/
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
<!-- 
<form action="commentInsert.do" method="post">
<input type="hidden" name="board_no" value="${vo.no }">
<input type="hidden" name="User_no" value="${authUser.no }">
<table border="1">
	<tr>
		<td>
			<textarea name="content"></textarea>
		</td>
	</tr>
</table>
<input type="submit" value="댓글저장">

</form>
<table border="1">
<c:if test="${empty clist }">
<tr>
<td>등록된 댓글이 없습니다.</td>
</tr>
</c:if>
<c:forEach var="vo" items="${clist }">
	<tr>
	<td>
		${vo.content }
		<c:if test="${vo.user_no==auth.no }">
		<input type="button" value="삭제 " onclick="goDel(${vo.no});">
		&nbsp;&nbsp;${vo.regdate }
		</c:if>
	</td>
	</tr>
	<script>
function goDel(no){
	if (confirm('삭제하시겠습니다?')){
		location.href='/user/board/commentDelete?no='+no+'&board_no=${vo.no}';
	}
}
</script>
</c:forEach>

</table>
 -->
</body>
</html>