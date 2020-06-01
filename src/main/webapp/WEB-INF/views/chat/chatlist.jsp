<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%> 

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../form/header.jsp" %>
<div style="margin-left: auto; margin-right: auto; width: 40%; text-align: center;">
	<form action="createchatroom.do" method="post" style="margin-left: auto; margin-right: auto;">
		<input type="text" name="chatroom_title">
		<input type="submit" value="방 생성">
	</form>
	<br/><br/>

	<table border="1" style="margin-left: auto; margin-right: auto;">
		<colgroup>
			<col width="400px">
			<col width="100px">
		</colgroup>
		<c:forEach items="${chatroomlist }" var="roomdto">		
			<tr>
				<td>${roomdto.chatroom_title }</td>
				<td rowspan="2" align="center" onclick="location.href='joinchatroom.do?chatroom_no=${roomdto.chatroom_no}&member_no=${logininfo.member_no }'">입장</td>
			</tr>
			<tr>
				<td>참여자수 : ${roomdto.chatroom_totalcount }</td>
			</tr>
		</c:forEach>
	</table>
</div>
<%@ include file="../form/footer.jsp" %>

</body>
</html>