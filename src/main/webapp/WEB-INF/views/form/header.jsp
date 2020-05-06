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
<style type="text/css">

	header{
		height:40px;
    	width: 100%;
		border: 1px dotted red;
	}

</style>
</head>
<body>
<header align="right">

	<c:choose>
		<c:when test="${empty logininfo }">
			<a href="login.do">로그인</a> <a href="agreement.do">회원가입</a>	
		</c:when>
		<c:otherwise>
			<input type="button" value="내정보" onclick="">
			<input type="button" value="로그아웃" onclick="">
		</c:otherwise>
	</c:choose>

</header>
</body>
</html>