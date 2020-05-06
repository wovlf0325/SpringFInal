<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Detail</h1>
	
	<table border="1">
		<tr>
			<th>작성자</th>
			<td>${boarddto.board_writer }</td>
		</tr>
		
		<tr>
			<th>제목</th>
			<td>${boarddto.board_title }</td>
		</tr>
		
		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="60" readonly="readonly">${boarddto.board_content }</textarea></td>
		</tr>
		
		<tr>
			<td colspan="2">
			<input type="button" value="수정" onclick="location.href='boardupdateform.do?board_no=${boarddto.board_no}'">
			<input type="button" value="삭제" onclick="location.href='boarddelete.do?board_no=${boarddto.board_no}'">
			<input type="button" value="목록" onclick="location.href='boardlist.do'">
		</tr>
		
		
		
	</table>

</body>
</html>