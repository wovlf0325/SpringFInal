<%@page import="com.mvc.prectice.login.dto.LoginDto"%>
<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%> 

<%-- <%
	Cookie[] cook = request.getCookies();
	

	if(cook != null){
		out.println("<div style='position:fixed;right:20px;bottom:20px;'>");
		
		out.println("<h3>최근 본 게시물</h3>");
		for(Cookie c: cook){
			
			LoginDto logindto = (LoginDto) session.getAttribute("logininfo");
			String id = logindto.getMember_id();
			
			if(c.getName().indexOf("url")!=-1 && c.getName().indexOf(id) != -1){
 				String cookieValue = c.getValue();
 				String url = URLDecoder.decode(cookieValue, "UTF-8");
 				out.println("<a href="+url+">게시물 보기</a><br/>");
 			}
	
			if (c.getName().indexOf("title") != -1 && c.getName().indexOf(id) != -1) {
				String cookieValue = c.getValue();
				String title = URLDecoder.decode(cookieValue, "UTF-8");
				//out.println("name: "+name);
				out.println("제목: " + title + "<br/>");
			}

			if (c.getName().indexOf("content") != -1 && c.getName().indexOf(id) != -1) {

				String cookieValue = c.getValue();
				String content = URLDecoder.decode(cookieValue, "UTF-8");
				//out.println("name: "+name);
				out.println("내용: " + content + "<br/><br/>---------------------<br/>");
			}

		}
		out.println("</div>");
	} else {
		out.println("최근본 게시물이 없습니다.");
	}
%> --%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
	*{
		border: 1px dotted red;
	}
	
</style>
<body>
<%@ include file="form/header.jsp" %>


<section style="height:800px;">

<h1>Main Home Page</h1>
<a href="updateform.do">내 정보</a> 
<a href="boardlist.do?nowPage=1">게시판</a>


</section>
<%@ include file="form/footer.jsp" %>
</body>
</html>