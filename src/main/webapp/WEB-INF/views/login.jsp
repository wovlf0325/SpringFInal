<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>  

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

   
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
	<br/>
	
	<a href="naverLogin.do"><img width="90" height="45" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a><br/>
	<a href="kakaoLogin.do"><img src="https://developers.kakao.com/tool/resource/static/img/button/login/simple/ko/kakao_login_btn_simple_medium.png"/></a>
	
</body>
</html>