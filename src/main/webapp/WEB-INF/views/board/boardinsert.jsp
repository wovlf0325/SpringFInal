<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <!-- Bootstrap core CSS -->
 	<link rel="stylesheet" href="resources/css/board.css">
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/theme.css" rel="stylesheet">
    <link href="resources/css/bootstrap-reset.css" rel="stylesheet">
    <!-- <link href="css/bootstrap.min.css" rel="stylesheet">-->

    <!--external css-->
    <link href="resources/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="resources/css/flexslider.css"/>
    <link href="resources/assets/bxslider/jquery.bxslider.css" rel="stylesheet" />
    <link rel="stylesheet" href="resources/css/animate.css">
    <link rel="stylesheet" href="resources/assets/owlcarousel/owl.carousel.css">
    <link rel="stylesheet" href="resources/assets/owlcarousel/owl.theme.css">

    <link href="resources/css/superfish.css" rel="stylesheet" media="screen">
    <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <!-- <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'> -->


    <!-- Custom styles for this template -->
    <link rel="stylesheet" type="text/css" href="resources/css/component.css">
    <link href="resources/css/style.css" rel="stylesheet">
    <link href="resources/css/style-responsive.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="resources/css/parallax-slider/parallax-slider.css" />
   	
    <script type="text/javascript" src="resources/js/parallax-slider/modernizr.custom.28468.js">
    </script>
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

		<table border="1" class="table table-striped table-hover">
			<tr>
				<th>작성자</th>
				<td><input type="text" name="board_writer" value="${sessionScope.logininfo.member_id }"></td>
			</tr>
			
			<tr>
				<th>제목</th>
				<td><input type="text" name="board_title"></td>
			</tr>
			
			<tr>
				<th>카테고리</th>
				<td>
					<select name="board_category">
						<c:if test="${sessionScope.logininfo.member_id eq 'admin'  }">
							<option value="2">공지사항</option>
						</c:if>
						<option value="3">자유게시판</option>
						<option value="4">불만사항</option>
						<option value="5">카풀리스트</option>
					</select>
				</td>
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