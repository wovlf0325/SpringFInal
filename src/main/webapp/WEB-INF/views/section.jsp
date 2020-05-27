<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>     
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="form/header.jsp" %>
<section style="height:800px;">

<h1>Main Home Page</h1>
<a href="updateform.do">내 정보</a> 
<a href="boardlist.do?nowPage=1">게시판</a>
<a href="houselist.do">코리빙 하우스</a>
<a href="read.do">read.jsp</a>
<a href="payment.do">결제하기</a>
<a href="fullcalendar.do">풀캘린더</a>

</section>
<%@ include file="form/footer.jsp" %>
</body>
</html>