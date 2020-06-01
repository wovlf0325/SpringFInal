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
</head>
<body>
	<form action="letterinsertres.do" method="post">
		<table border="1" class="table table-striped table-hover">
		
			<tr>
				<th>보내는이</th>
				<td>
					<input type="text" name="letter_from" readonly="readonly" value="${letterdto.letter_from }">
				</td>
			</tr>
			
			<tr>
				<th>받는이</th>
				<c:if test="${from == null }">
					<td>
						<input type="text" name="letter_to">
					</td>
				</c:if>
				
				 <c:if test="${from != null }">
				 	<td>
				 		<input type="text" name="letter_to" readonly="readonly" value="${from }">
					</td>
				 </c:if>
				
			</tr>
			
			<tr>
				<th>제목</th>
				<td><input type="text" name="letter_title"/></td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td><textarea name="letter_content" rows="20" cols="50"></textarea></td>
			</tr>
			
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="쪽지 보내기"/>
					<input type="button" value="취소" onclick="self.close()"/> 
				</td>
			</tr>
		</table>
	</form>
</body>
</html>