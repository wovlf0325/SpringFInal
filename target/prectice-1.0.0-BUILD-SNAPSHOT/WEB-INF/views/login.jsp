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
	<h1>로그인</h1>
	<form action="loginRes.do" method="post">
		<input type="text" name="member_id" placeholder="아이디 입력"/>
		<input type="password" name="member_pw" placeholder="비밀번호 입력"/>
		<input type="submit" value="로그인"/>
	</form>	
</body>
</html>