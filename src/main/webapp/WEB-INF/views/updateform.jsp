<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="form/header.jsp" %>

<table style="margin-left: auto; maring-right: auto; width: 80%;" align="center">
	<tr>
		<td>
		<form id="updateForm" name="updateForm" method="post" action="updateMember.do">
		<input type="hidden" name="member_no" value="${logininfo.member_no }">
			추가 입력 정보 <br/>
			관심사 : <input type="text" name="member_interest" placeholder="관심사" value="${logindto.member_interest }">
			선호지역 : <input type="text" name="member_area" placeholder="선호지역" value="${logindto.member_area }">

			<a href="javascript:updateForm.submit();">입력</a>
			<br/>
			내 상태 : 
			<c:if test="${logininfo.member_status eq 1}">
				<c:out value="탐색중"/>
			</c:if>
			<c:if test="${logininfo.member_status eq 2}">
				<c:out value="계약중"/>
			</c:if>
			<c:if test="${logininfo.member_status eq 3}">
				<c:out value="거주중 "/>
				<c:out value=" 하우스번호 : ${logininfo.house_id }"/>
			</c:if>
		</form>
		</td>
	
	<br/><br/><br/><br/>
	
	<td>
	<table border="1" style="margin-left: auto; maring-right: auto; width: 80%; text-align: center">
	<caption>하우스리스트</caption>
	<colgroup>
	 	<col width="50px">
	 	<col width="50px">
	 	<col width="200px">
	 	<col width="150px">
	 	<col width="200px">
	 	<col width="100px">
	</colgroup>
		<tr>
			<th>번호</th>
			<th>키퍼</th>
			<th>이름</th>
			<th>번호</th>
			<th>주소</th>
			<th>상태</th>
		</tr>
		<c:choose>
			<c:when test="${empty house_list }">
				<tr>
					<td colspan="6" align="center">등록된 거주지가 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${house_list }" var="houseDto">
					<tr>
						<td>${houseDto.house_id }</td>
						<td>${houseDto.house_keeper }</td>
						<td><a href="housedetail.do?house_id=${houseDto.house_id }">${houseDto.house_name }</a></td>
						<td>${houseDto.house_phone }</td>
						<td>${houseDto.house_addr }</td>
						<td>
							<c:if test="${houseDto.house_status eq 1}">
								<c:out value="모집중"/>
							</c:if>
							<c:if test="${houseDto.house_status eq 2}">
								<c:out value="모집완료"/>
							</c:if>
						</td>
					</tr>
				</c:forEach>		
			</c:otherwise>
		</c:choose>
	</table>
	</td>
	</tr>
	
	<tr>
	<td>
	<br/><br/>
	<table border="1" style="width: 80%;">
	<caption>게시물리스트</caption>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>카테고리</th>
		</tr>
		<c:choose>
			<c:when test="${empty board_list }">
				<tr>
					<td colspan="6" align="center">작성한 게시물이 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${board_list }" var="boardDto">
					<tr>
						<td>${boardDto.board_no }</td>
						<td><a href="boarddetail.do?board_no=${boardDto.board_no }">${boardDto.board_title }</a></td>
						<td>${boardDto.board_content }</td>
						<td><fmt:formatDate value="${boardDto.board_regdate }" pattern="YYYY-MM-dd"/></td>
						<td>${boardDto.board_views }</td>
						<td>${boardDto.board_category }</td>
					</tr>
				</c:forEach>		
			</c:otherwise>
		</c:choose>
	</table>
	</td>
	
	<td>
	<table border="1" style="margin-left: auto; maring-right: auto; width: 80%;">
	<caption>결제리스트</caption>
		<tr>
			<th>결제번호</th>
			<th>승인번호</th>
			<th>결제금액</th>
		</tr>
		<c:choose>
			<c:when test="${empty payment_list }">
				<tr>
					<td colspan="3" align="center">결제한 내역이 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${payment_list }" var="payment">
					<tr>
						<td>${payment.paymentNo }</td>
						<td>${payment.paymentUID }</td>
						<td>${payment.paymentAmount }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	</td>
	</tr>
</table>

<%@include file="form/footer.jsp" %>
</html>