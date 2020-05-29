<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<header align="right">

	<c:choose>
		<c:when test="${empty logininfo }">
			<a href="login.do">로그인</a> <a href="agreement.do">회원가입</a>
		</c:when>
		<c:otherwise>
			<a href="updateform.do">내 정보</a>
			<a href="logout.do">로그아웃</a>
			<a href="letterlist.do">쪽지함</a>
			<a href="fullcalendar.do">풀캘린더</a>
			<a href="loading.do">로딩</a>
		</c:otherwise>
	</c:choose>


</header>
</body>
</html>