<%@page import="com.mvc.prectice.login.dto.LoginDto"%>
<%@page import="org.springframework.web.context.request.SessionScope"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.mvc.prectice.board.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<link rel="stylesheet" href="resources/css/board.css">
<style type="text/css">
.btn-success:hover{
	background-color: lightgray;
	color: black;
	border-color: lightgray;

}

</style>
</head>

<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
	
	function pageChange(){
		var sel = $('#cntPerPage').val();
		var category = $('#category').val();
		location.href="boardlist.do?nowPage=${paging.nowPage}&cntPerPage="+sel+"&boardcategory="+category;
	}
	
	function movePage(p){
		var sel = $('#cntPerPage').val();
		var category = $('#category').val();
		location.href="boardlist.do?nowPage="+p+"&cntPerPage="+sel+"&boardcategory="+category;
	}
	
	function prevPage(){
		var sel = $('#cntPerPage').val();
		var category = $('#category').val();
		location.href="boardlist.do?nowPage=${paging.startPage - 1 }&cntPerPage="+sel+"&boardcategory="+category;
	}
	
	function nextPage(){
		var sel = $('#cntPerPage').val();
		var category = $('#category').val();
		location.href="boardlist.do?nowPage=${paging.endPage+1 }&cntPerPage="+sel+"&boardcategory="+category;
	}
	
	$(function(){
		  $('#searchBtn').click(function() {
		   self.location = "boardlist.do"
		     + '?nowPage=1'
		     + "&cntPerPage=" + $('#cntPerPage').val()
		     + "&boardcategory="+$('#category').val()
		     + "&searchType="
		     + $("#search_type option:selected").val()
		     + "&keyword="
		     + encodeURIComponent($('#keywordInput').val());
		    });
		 });   


	
</script>
<style type="text/css">
	
	#pageselect a {
		cursor: pointer;
	}
</style>
<body>
<%@ include file="/WEB-INF/views/form/header.jsp" %>
	<div style="margin-left: auto; margin-right: auto; width: 80%;">
		<div><!-- 옵션선택 -->
			<select id="cntPerPage" name="sel" onchange="pageChange()">
				<option value="5"
					<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
				<option value="10"
					<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
				<option value="15"
					<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
				<option value="20"
					<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
			</select>
			
			<select id="category" name="board_category" onchange="pageChange()" style="float:right;">
				<option value="1" <c:if test="${boarddto.board_category == 1}">selected</c:if>>전체</option>
				<option value="2" <c:if test="${boarddto.board_category == 2}">selected</c:if>>공지사항</option>
				<option value="3" <c:if test="${boarddto.board_category == 3}">selected</c:if>>자유게시판</option>
				<option value="4" <c:if test="${boarddto.board_category == 4}">selected</c:if>>불만사항</option>
				<option value="5" <c:if test="${boarddto.board_category == 5}">selected</c:if>>카풀리스트</option>
			</select>
		</div>
	
		<input type="hidden" name="command" value="list">
		<input type="hidden" name="nowPage" value="1">

	<table style="width:100%" class="table table-striped table-hover">

		<colgroup>
			<col width="50"/>
			<col width="100"/>
			<col width="300"/>
			<col width="50"/>
			<col width="50"/>
		</colgroup>
		
		<thead>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${notice }" var="boarddto">
				 <tr style="font-weight:bold;">
					<td>${boarddto.board_no }</td>
					<td>${boarddto.board_writer }</td>
					<td><a href="boarddetail.do?board_no=${boarddto.board_no }">${boarddto.board_title }</a></td>
					<td>${boarddto.board_views }</td>
					<td>
					<c:set var="reg_date" value="${boarddto.board_regdate }"/>
					<%
						Date now = new Date();
						SimpleDateFormat format_date = new SimpleDateFormat("MM-dd");
						String nowdate = format_date.format(now);
						Date date = (Date)pageContext.getAttribute("reg_date");
						String regdate = format_date.format(date);
						if(nowdate.equals(regdate)){
					%>
						<fmt:formatDate value="${boarddto.board_regdate }" pattern="HH:mm"/>
					<%
						} else {
					%>
						<fmt:formatDate value="${boarddto.board_regdate }" pattern="MM-dd"/>
					<%
						}
					%>
					</td>
				</tr>
			</c:forEach>
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
							<td>${boarddto.board_views }</td>
							<td>
							<c:set var="reg_date" value="${boarddto.board_regdate }"/>
							<%
								Date now = new Date();
								SimpleDateFormat format_date = new SimpleDateFormat("MM-dd");
								String nowdate = format_date.format(now);
								Date date = (Date)pageContext.getAttribute("reg_date");
								String regdate = format_date.format(date);
								if(nowdate.equals(regdate)){
							%>
								<fmt:formatDate value="${boarddto.board_regdate }" pattern="HH:mm"/>
							<%
								} else {
							%>
								<fmt:formatDate value="${boarddto.board_regdate }" pattern="MM-dd"/>
							<%
								}
							%>
							</td>

						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			
		</tbody>
			<tr>
				<td colspan="4" align="right">
					<input type="button" value="글작성" class="btn btn-success" onclick="location.href='boardinsert.do'"/>
				</td>
			</tr>
		<tfoot>
		
		</tfoot>
	
	
	</table>
	
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
		
		<c:if test="${paging.endPage < paging.lastPage}">
			<a onclick="nextPage()">&gt;</a>
		</c:if>
	</div>
	
	<div class="search">
		<table>
			<colgroup>
				<col width="200px;">
				<col width="300px;">
				<col width="150px;">
			</colgroup>
		<tr>
			<th>
			<select id="search_type" name="searchType" style="color: black !important; font-weight: normal !important;">
				<option value="n"<c:out value="${boarddto.searchType == null ? 'selected' : ''}"/>>---------</option>
				<option value="t"<c:out value="${boarddto.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
				<option value="w"<c:out value="${boarddto.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
				<option value="tc"<c:out value="${boarddto.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
			</select>
			</th>
	
			<th>
				<input type="text" name="keyword" id="keywordInput" value="${boarddto.keyword}" style="color: black !important; font-weight: normal !important;"/>
			</th>
			<th>
				<button id="searchBtn" class="btn btn-info">검색</button>			
			</th>
		</tr>
		</div>
		</table>
	</div>
	

	<%@ include file="../form/footer.jsp" %>
</body>
</html>