<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>글쓰기</h1>

	<form action="boardinsertres.do">

		<table border="1">
			<tr>
				<th>작성자</th>
				<td><input type="text" name="board_writer"></td>
			</tr>
			
			<tr>
				<th>제목</th>
				<td><input type="text" name="board_title"></td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td><textarea rows="6" cols="60" name="board_content"></textarea></td>
				<!-- 총 6개의 row들! -->
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="submit" value="작성">
					<input type="button" value="취소" onclick="location.href='boardlist.do'">
				</td>
			</tr>
		
		
		</table>
	</form>

</body>
</html>