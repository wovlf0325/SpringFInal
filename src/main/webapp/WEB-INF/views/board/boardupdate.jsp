<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="boardupdateres.do" method="post">
		<input type="hidden" name="board_no" value="${boarddto.board_no }">
		<table border="1">
			<tr>
				<th>작성자</th>
				<td>${boarddto.board_writer }</td>
			</tr>
			
			<tr>
				<th>제목</th>
				<td><input type="text" name="board_title" value="${boarddto.board_title }"></td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td><textarea rows="10" cols="60" name="board_content">${boarddto.board_content }</textarea></td>
			</tr>
			
			<tr>
				
				<td colspan="2" align="right">
					<input type="submit" value="수정"/>
					<input type="button" value="취소" onclick="location.href='boarddetail.do?board_no=${boarddto.board_no}'"/>
				</td>
			</tr>
		
		</table>
		
	</form>

</body>
</html>