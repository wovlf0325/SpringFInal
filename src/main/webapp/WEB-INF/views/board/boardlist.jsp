<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
</head>
<script type="text/javascript">
	function selChange(){
		var sel = document.getElementById('cntPerPage').value;
		location.href="boardlist.do?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}


</script>
<body>
	<h1>LIST</h1>
	
		<div><!-- 옵션선택 -->
			<select id="cntPerPage" name="sel" onchange="selChange()">
				<option value="5"
					<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
				<option value="10"
					<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
				<option value="15"
					<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
				<option value="20"
					<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
			</select>
		</div>
	
	<table border="1">
		<colgroup>
			<col width="50"/>
			<col width="100"/>
			<col width="300"/>
			<col width="100"/>
		</colgroup>
		
		<thead>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
		</thead>
		
		<tbody>
			<c:choose>
				<c:when test="${empty boardlist }">
				<tr>
					<td colspan="4" align="center">작성된 글이 없습니다.</td>
				</tr>
				
				</c:when>
				<c:otherwise>
					<c:forEach items="${boardlist }" var="boarddto">
						<tr>
							<td>${boarddto.board_no }</td>
							<td>${boarddto.board_writer }</td>
							<td><a href="boarddetail.do?board_no=${boarddto.board_no }">${boarddto.board_title }</a></td>
							<td>${boarddto.board_regdate }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			
		</tbody>
			<tr>
				<td colspan="4" align="right">
					<input type="button" value="글작성" onclick="location.href='boardinsert.do'"/>
				</td>
			</tr>
		<tfoot>
		
		</tfoot>
	
	
	</table>
	
	<div style="display: block;">
		<c:if test="${paging.startPage != 1 }">
			<a href="boardlist.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				
				<c:when test="${p != paging.nowPage }">
					<a href="boardlist.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="boardlist.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>

</body>
</html>