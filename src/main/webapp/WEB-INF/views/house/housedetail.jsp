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

	<h1> 코리빙하우스 상세보기 </h1>
	
	<table border="1" class="table table-striped table-hover" style="margin-left: auto; margin-right: auto;">
		<tr>
			<th>코리빙하우스 이름</th>
			<td>${housedto.house_name }</td>
		</tr>
		
		<tr>
			<th>코리빙하우스 전화번호 </th>
			<td>${housedto.house_phone }</td>
		</tr>
		
		<tr>
			<th>코리빙하우스 주소</th>
			<td>${housedto.house_addr }</td>
		</tr>
		
		<tr>
			<th>코리빙하우스 상세사진 </th>
			<td><img src="resources/images/houseimgstorage/${housedto.house_image }"></td>
		</tr>
		
		<tr>
			<th>코리빙하우스 상세설명 </th>
			<td>${housedto.house_content }</td>
		</tr>	
		
		<tr>
			<th>코리빙하우스 계약서</th>
			<td>${housedto.house_document }</td>
		</tr>
		
		<tr>
			<th>코리비하우스 현재상황</th>
			<td>
				<c:if test="${housedto.house_status eq 1}">
					<c:out value="모집중"/>
				</c:if>
				<c:if test="${housedto.house_status eq 2}">
					<c:out value="모집완료"/>
				</c:if>
			</td>
		</tr>	
		
		
		
		<tr>
			<th>입주신청하기</th>
			<td>
				<input type="button" class="btn btn-info" value="입주신청하기" onclick="window.open('payment.do?house_name=${housedto.house_name}&house_id=${housedto.house_id }','결제하기', 'width=500, height=500, location=no, status=no, scrollbars=yes');">
			</td>
		</tr>
		
		
		<tr>
			<td colspan="2" align="right">
			<input type="button" class="btn btn-info" value="수정 " onclick="location.href='houseupdateform.do?house_id=${housedto.house_id }'">
			<input type="button" class="btn btn-info" value="삭제" onclick="location.href='housedelete.do?house_id=${housedto.house_id }'">
			<input type="button" class="btn btn-info" value="목록" onclick="location.href='houselist.do'">
			</td>
		</tr>	
		
	</table>



</body>
</html>