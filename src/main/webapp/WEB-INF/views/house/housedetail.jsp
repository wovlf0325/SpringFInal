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

	<h1> 코리빙하우스 상세보기 </h1>
	
	<table border="1">
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
			<td>${housedto.house_status }</td>
		</tr>	
		
		<tr>
			<td colspan="2" align="right">
			<input type="button" value="수정 " onclick="location.href='houseupdateform.do?house_id=${housedto.house_id }'">
			<input type="button" value="삭제" onclick="location.href='housedelete.do?house_id=${housedto.house_id }'">
			<input type="button" value="목록" onclick="location.href='houselist.do'">
			</td>
		</tr>			
					
	
	</table>



</body>
</html>