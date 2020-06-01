<%@page import="com.mvc.prectice.login.dto.LoginDto"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%> 


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<style type="text/css">
#main_image{
	margin-left: 10%;
}
</style>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>

<body>
<%@ include file="form/header.jsp" %>


<img src="resources/images/coliving_main.jpg" id="main_image">

<%@ include file="form/footer.jsp" %>
</body>
</html>