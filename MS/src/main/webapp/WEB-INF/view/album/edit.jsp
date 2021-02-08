<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/MS/smarteditor/js/HuskyEZCreator.js"></script><!-- 에디터에서 사용될 스크립트 -->
<script src="/MS/js/common.js"></script>
<script>
var oEditor;
$(document).ready(function() {
	oEditor = setEditor("content"); // textarea의 id값을 매개변수로
});
// submit(image) 버튼인 경우
// form에 onsubmit 속성 부여
function formCheck() {
	if ($("#title").val().trim() == '') {
		alert('제목을 입력하세요');
		$("#title").focus();
		return false;
	}
	oEditor.getById['Lyrics'].exec("UPDATE_CONTENTS_FIELD",[]); // 에디터있던 내용을 textarea에 담기
}
</script>
</head>
<body>
<form action="update.do" method="post" enctype="multipart/form-data" id="frm" onsubmit="return formCheck();">
<input type="hidden" name="no" value="${vo.no }">
<table border="1" style="width:800px">
	<tr>
		<td>제목</td>
		<td><input type="text" name="title" id="title" value="${vo.title }"></td>
	</tr>
	<tr>
		<td>가사</td>
		<td><textarea name="lyrics" id="Lyrics" style="width:100%">${vo.lyrics }</textarea></td>
	</tr>
	<tr>
		<td>앨범 번호</td>
		<td>
			<select name="A_no">
                        <option value="1">1번 앨범</option>
                        <option value="2">2번 앨범</option>
                        <option value="3">3번 앨범</option>
                    </select>
		</td>
	</tr>
	<tr>
		<td>첨부파일</td>
		<td>
			<input type="file" name="file">
		</td>
	</tr>
</table>
<input type="submit" value="수정" id="submitBtn">
</form>
</body>
</html>