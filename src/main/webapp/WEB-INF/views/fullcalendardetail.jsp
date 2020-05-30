<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mvc.prectice.fullcalendar.dto.FullCalendarDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	<!-- datepicker -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- custom -->
	<link href="resources/fullcalendar/custom/css/schedule.css" rel="stylesheet" />	
	<script src="resources/fullcalendar/custom/js/schedule.js" type="text/javascript"></script>

</head>
<body>
	

	<div class = "group-head">
		<h1 class = "zTree-h1"> 일정내용 </h1>
	</div>
	<div class = "group-body">
		<div class = "top">
			<h3 class = "subject" id = "subject">${fullcalendarDto.plan_title }</h3>
		</div>
		<div class = "domain">
			<h3 class = "zTree-h3"> 시작 </h3>
		</div>
		<div class = "domain">
			<h3 class = "date" id = "startDate">${fullcalendarDto.plan_start }</h3>
		</div>
		<div class = "domain">
			<h3 class = "zTree-h3"> 종료 </h3>
		</div>
		<div class = "domain">
			<h3 class = "date" id = "endDate">${fullcalendarDto.plan_end }</h3>
		</div>
		<button class = "ok-button" type= "button" onclick="location.href='fullcalendarupdateform.do?plan_no=${fullcalendarDto.plan_no}'">수정</button>
		<button class = "ok-button" type= "button" onclick="location.href='fullcalendardelete.do?plan_no=${fullcalendarDto.plan_no}'">삭제</button>
		<button class = "ok-button" type= "button" onclick="window.close()">취소</button>
	</div>	
</body>
</html>