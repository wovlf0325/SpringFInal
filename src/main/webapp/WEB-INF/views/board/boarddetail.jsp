<%@page import="com.mvc.prectice.board.dto.BoardDto"%>
<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="resources/css/board.css">
  <!-- Bootstrap core CSS -->
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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		listReply();//댓글 목록 불러오기
		
		$("#btnReply").click(function(){
			var reply_content = $("#reply_content").val();
			var board_no = "${boarddto.board_no}";
			var param ="reply_content="+reply_content+"&board_no="+board_no;
			$.ajax({
				type:"post",
				url:"replyinsert.do",
				data:param,
				success:function(){
					alert("댓글이 등록되었습니다.");
					$('textarea[id=reply_content]').val("");
					listReply();
				},
				error:function(){
					alert("ajax실패");
					console.log(res);
					listReply();
				}
			});
		});
		
	});
	
	function listReply(){
		$.ajax({
			type:"get",
			url:"replylist.do?board_no=${boarddto.board_no}",
			success: function(result){
				$("#listReply").html(result);
			}		
		})
	}
	

</script>
</head>
<body>
	
	<h1>Detail</h1>
	
	<table border="1" class="table table-striped table-hover">
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
			<td><textarea rows="10" cols="60" readonly="readonly" >${boarddto.board_content }</textarea></td>
		</tr>
		
		<tr>
			<td colspan="2">
			<input type="button" class="btn btn-warning" value="수정" onclick="location.href='boardupdateform.do?board_no=${boarddto.board_no}'">
			<input type="button" class="btn btn-warning" value="삭제" onclick="location.href='boarddelete.do?board_no=${boarddto.board_no}'">
			<input type="button" class="btn btn-warning" value="목록" onclick="location.href='boardlist.do'">
		</tr>
		
	</table>
	<!-- 댓글 입력 -->
	<div>
		<br>
		<textarea rows="4" cols="60" id="reply_content" placeholder="댓글을 작성해주세요" class="form-control"></textarea>
		<br>
		<input type="button" class="btn btn-warning" id="btnReply" value="댓글작성"/>
	
	</div>
	
	<!-- 댓글 출력 -->
	<div>
		<div id="listReply"></div>
	</div>
	

</body>
</html>