<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.container {
	width: 800px;
	display: grid;
	grid-template-rows: repeat(2, 200px);
	grid-template-columns: repeat(3, 1fr);
	grid-auto-rows: 200px;
	column-gap: 10px;
	row-gap: 10px;
}
</style>

<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script type="text/javascript">

function movePage(p){
	location.href="houselist.do?nowPage="+p;
}

function prevPage(){
	var sel = $('#cntPerPage').val();
	location.href="houselist.do?nowPage=${paging.startPage - 1 }";
}

function nextPage(){
	var sel = $('#cntPerPage').val();
	location.href="houselist.do?nowPage=${paging.endPage+1 }";
}
</script>

</head>
<body>

	<h1>LIST</h1>
	
	<div>
		<input type="button" value="글쓰기"
			onclick="location.href='houseinsert.do'">
	</div>


	<c:choose>
		<c:when test="${empty houselist }">
			<tr>
				<td colspan="3" align="center">작성된 글이 없습니다.</td>
			</tr>

		</c:when>
		<c:otherwise>
			<div class="container" id="contatiner">
				<c:forEach items="${houselist }" var="housedto">

					<div class="item" style="cursor: pointer"
						onclick="location.href='housedetail.do?house_id=${housedto.house_id}'">
						<img src="resources/images/houseimgstorage/${housedto.house_image }"
							width="90%" height="90%"><br /> 
							${housedto.house_name }
						<p/>
					</div>

				</c:forEach>
			</div>
		</c:otherwise>
	</c:choose>
	

 	<div id="pageselect" style="display: block;" align="center">
		<c:if test="${paging.startPage != 1 }">
			<a onclick="prevPage()">&lt;</a>
		</c:if>
		
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				
				<c:when test="${p != paging.nowPage }">
					<a onclick="movePage(${p })">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		
		<c:if test="${paging.endPage > paging.lastPage}">
			<a onclick="nextPage()">&gt;</a>
		</c:if>
	</div>

	






</body>
</html>