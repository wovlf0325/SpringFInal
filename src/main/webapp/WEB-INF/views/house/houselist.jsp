<%@page import="java.net.URLDecoder"%>
<%@page import="com.mvc.prectice.login.dto.LoginDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
#container {
	width: 800px;
	display: grid;
	grid-template-rows: repeat(2, 200px);
	grid-template-columns: repeat(3, 1fr);
	grid-auto-rows: 200px;
	column-gap: 10px;
	row-gap: 10px;
}

#recent {
    background-color: rgba(232, 232, 232, 1);
    text-align: center;
    height: 60%;
    width: 13%;
}

#in {
 display: inline-block;
}

.image{
	width: 100px;
	height: 100px;
}
</style>
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
<%@ include file="/WEB-INF/views/form/header.jsp" %>



<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script type="text/javascript">

function movePage(p){
	location.href="houselist.do?nowPage="+p;
}

function prevPage(){
	var sel = $('#cntPerPage').val();
	location.href="houselist.do?nowPage=${paging.startPage - 1 }";
}

function nextPage(){
	var sel = $('#cntPerPage').val();
	location.href="houselist.do?nowPage=${paging.endPage+1 }";
}
</script>

</head>
<body>

	<h1>LIST</h1>
	
	<div>
		<a href="houseinsert.do">하우스등록</a>
	</div>

	<c:choose>
		<c:when test="${empty houselist }">
			<tr>
				<td colspan="3" align="center">작성된 글이 없습니다.</td>
			</tr>

		</c:when>
		<c:otherwise>

			<div class="container" id="container">

				<c:forEach items="${houselist }" var="housedto">

					<div class="item" style="cursor: pointer"
						onclick="location.href='housedetail.do?house_id=${housedto.house_id}'">
						<img src="resources/images/houseimgstorage/${housedto.house_image }"
							width="90%" height="90%"><br /> 
							${housedto.house_name }
						<p/>
					</div>

				</c:forEach>
			</div>
		</c:otherwise>
	</c:choose>
	

 	<div id="pageselect" style="display: block;" align="center">
		<c:if test="${paging.startPage != 1 }">
			<a onclick="prevPage()">&lt;</a>
		</c:if>
		
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				
				<c:when test="${p != paging.nowPage }">
					<a onclick="movePage(${p })">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		
		<c:if test="${paging.endPage > paging.lastPage}">
			<a onclick="nextPage()">&gt;</a>
		</c:if>
	</div>



<%
	Cookie[] cook = request.getCookies();
	

	if(cook != null){
		
		
		
		out.println("<div style='overflow:auto;position:fixed;right:20px;bottom:80px;' id='recent'>");
		out.println("<div id='in'>");
		out.println("<a><최근 본 하우스></a>");
		
		for(Cookie c: cook){
			
			LoginDto logindto = (LoginDto) session.getAttribute("logininfo");
			String id = logindto.getMember_id();
			
			if(c.getName().indexOf("image")!=-1 && c.getName().indexOf(id) != -1){
 				String cookieValue = c.getValue();
 				String image = URLDecoder.decode(cookieValue, "UTF-8");
 				out.println("<img src='resources/images/houseimgstorage/"+image+"' class='image'><br/>");
 			}
			
			if (c.getName().indexOf("name") != -1 && c.getName().indexOf(id) != -1) {
				String cookieValue = c.getValue();
				String name = URLDecoder.decode(cookieValue, "UTF-8");
				//out.println("name: "+name);
				out.println(name + "<br/>");
			}

			if(c.getName().indexOf("url")!=-1 && c.getName().indexOf(id) != -1){
 				String cookieValue = c.getValue();
 				String url = URLDecoder.decode(cookieValue, "UTF-8");
 				out.println("<a href="+url+">하우스 보러가기</a><br/>---------------------<br/>");
 			}
	
		}
		
		out.println("</div>");
		out.println("</div>");
		
	} else {
		out.println("최근본 게시물이 없습니다.");
	}
%>    

<%@ include file="/WEB-INF/views/form/footer.jsp" %>

</body>
</html>