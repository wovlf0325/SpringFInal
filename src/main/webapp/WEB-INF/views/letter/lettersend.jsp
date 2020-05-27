<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	window.onload=function(){
		var reads = document.getElementsByName("read");
		var readChks = document.getElementsByName("readChk");
		console.log(reads);
		console.log(readChks);
		for(var i = 0; i < reads.length; i++){
			console.log(reads[i].value);
			console.log(readChks[i]);
			if(reads[i].value == 'N'){
				readChks[i].style.fontWeight = "bold";
				readChks[i].style.color = "#f66a78";
			}
		}
	};
	
	
	function readchange(){
		var reads = document.getElementsByName("read");
		for(var i = 0; i < reads.length; i++){
			reads[i].value == 'Y';
		}
	}
</script>

</head>
<body>
	<h1>보낸쪽지함</h1>
	<input type="button" value="받은 쪽지함" onclick="location.href='letterlist.do'">
	<form action="letterdelete.do" method="post">
		<input type="hidden" name="command" value="multidelete"/>
		<input type="hidden" name="command_2" value="send"/>
		<table border="1">
		
			<colgroup>
				<col width="100"/>
				<col width="300"/>
				<col width="50"/>
			</colgroup>
			
			<thead>
				<tr>
					<th>받은이</th>
					<th>제목</th>
					<th>보낸 날짜</th>
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<c:choose>
						<c:when test="${empty lettersend }">
							<tr >
								<td colspan="5" align="center">- - - - - - - - - - 보낸 쪽지가 없습니다. - - - - - - - - - -</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${lettersend }" var="dto">
							<input type="hidden" name="read" value="${dto.letter_read }"/>
								<tr name="readChk">
									<td align="center">${dto.letter_to }</td>
									<td align="center"><a href="letterdetail.do?letter_to=${dto.letter_to }&letter_no=${dto.letter_no }"  onclick="readchange();window.open(this.href,'','width=390px, height=350px, left=650px, top=100px ');return false;" target="_blank">${dto.letter_title }</a></td>
									<td align="center"><fmt:formatDate value="${dto.letter_regdate }" pattern="YYYY/MM/dd" type="date"/></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tr>
					
				
			
			</tbody>
		
		
		
		</table>
	</form>

</body>
</html>