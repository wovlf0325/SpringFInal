<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 보낸쪽지함, 받은쪽지함 구별 위해 로그인한 아이디가 쪽지 보낸이와 같을 때 보낸 쪽지함, 
		  그렇지 않을 때 받은 쪽지함으로 함 -->
	<c:set var="from" value="${letterdto.letter_from }"></c:set>
	<c:choose>
		<c:when test="${sessionScope.logininfo.member_id == from}">
			<h1>보낸쪽지</h1>
		</c:when>
		<c:otherwise>
			<h1>받은쪽지</h1>
		</c:otherwise>
	</c:choose>
	
	
	<form action="letterdelete.do">
	<input type="hidden" name="chk" value="${letterdto.letter_no }"/>
	<input type="hidden" name="command" value="deleteone"/>
	<table border="1">
	
	
		<c:choose>
			<c:when test="${sessionScope.logininfo.member_id == from}">
				<tr>
					<th>받은이</th>
					<td>${letterdto.letter_to }</td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<th>작성자</th>
					<td>${letterdto.letter_from }</td>
				</tr>
			</c:otherwise>
		</c:choose>
		
		
		<tr>
			<th>제목</th>
			<td>${letterdto.letter_title }</td>
		</tr>
		
		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="60" readonly="readonly">${letterdto.letter_content }</textarea></td>
		</tr>
		
		<tr>
			<td colspan="2" align="right">
			
				<c:choose>
					<c:when test="${sessionScope.logininfo.member_id == from}">
					</c:when>
					<c:otherwise>
						<input type="button" value="답장" onclick="window.open('letterinsert.do?from=${letterdto.letter_from }', '','width=390px, height=350px, left=350px, top=100px ');return false;" target="_blank"/>
						<input type="submit" value="삭제" >
					</c:otherwise>
				</c:choose>
				<input type="button" value="닫기" onclick="self.close()"/> 
			</td>
		</tr>
	
	</table>
	</form>



</body>
</html>