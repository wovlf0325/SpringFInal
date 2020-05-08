<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="form/header.jsp" %>
<section style="height:800px;">
<h1>Main Home Page</h1>
<a href="boardlist.do?nowPage=1">게시판</a>

</section>
<%@ include file="form/footer.jsp" %>
</body>
</html>