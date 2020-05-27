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

</head>
<body>

	<h1>LIST</h1>



	<c:choose>
		<c:when test="${empty houselist }">
			<tr>
				<td colspan="3" align="center">작성된 글이 없습니다.</td>
			</tr>

		</c:when>
		<c:otherwise>
			<div class="container">
				<c:forEach items="${houselist }" var="housedto">

					<div class="item" style="cursor: pointer"
						onclick="location.href='housedetail.do?house_id=${housedto.house_id}'">
						<img
							src="resources/images/houseimgstorage/${housedto.house_image }"
							width="90%" height="90%"><br /> ${housedto.house_name }
						<p />
					</div>

				</c:forEach>
			</div>
		</c:otherwise>
	</c:choose>





	<div>
		<input type="button" value="글쓰기"
			onclick="location.href='houseinsert.do'">
	</div>









</body>
</html>