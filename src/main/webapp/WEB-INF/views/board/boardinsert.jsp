<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<!-- include summernote-ko-KR -->
<script src="/resources/js/summernote-ko-KR.js"></script>
<title>Insert title here</title>
<script>
$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: 'content',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	});
</script>
</head>
<body>

	<h1>글쓰기</h1>

	<form action="boardinsertres.do" method="post">

		<table border="1">
			<tr>
				<th>작성자</th>
				<td><input type="text" name="board_writer" value="${sessionScope.logininfo.member_id }"></td>
			</tr>
			
			<tr>
				<th>제목</th>
				<td><input type="text" name="board_title"></td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td>
					<textarea id="summernote" name="board_content"></textarea>
					<input type="button" value="취소" style="float: right;" onclick="history.back()">
					<input id="subBtn" type="submit" value="글 작성" style="float: right;" onclick="goWrite(this.form)"/>
				</td>
				<!-- 총 6개의 row들! -->
			</tr>
		
		</table>
	</form>

</body>
</html>