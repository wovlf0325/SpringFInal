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
	<form action="letterinsertres.do" method="post">
		<table border="1">
		
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