<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.mvc.prectice.fullcalendar.dto.FullCalendarDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- fullcalendar -->
<link href="resources/fullcalendar/fullcalendar-4.3.1/core/main.css"rel="stylesheet" />
<link href="resources/fullcalendar/fullcalendar-4.3.1/daygrid/main.css"rel="stylesheet" />
<link href="resources/fullcalendar/fullcalendar-4.3.1/timegrid/main.css"rel="stylesheet" />
<link href="resources/fullcalendar/fullcalendar-4.3.1/list/main.css"rel="stylesheet" />
<script src="resources/fullcalendar/fullcalendar-4.3.1/core/main.js"></script>
<script src="resources/fullcalendar/fullcalendar-4.3.1/interaction/main.js"></script>
<script src="resources/fullcalendar/fullcalendar-4.3.1/daygrid/main.js"></script>
<script src="resources/fullcalendar/fullcalendar-4.3.1/timegrid/main.js"></script>
<script src="resources/fullcalendar/fullcalendar-4.3.1/list/main.js"></script>
<link href="resources/fullcalendar/custom/css/schedule.css" rel="stylesheet">
<script src="resources/fullcalendar/custom/js/fullcalendar.js"></script>
<style type="text/css">
html, body {
	left: 30px;
	margin: 0;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#external-events {
	position: fixed;
	z-index: 2;
	top: 20px;
	left: 20px;
	width: 150px;
	padding: 0 10px;
	border: 1px solid #ccc;
	background: #eee;
}

.demo-topbar+#external-events { /* will get stripped out */
	top: 60px;
}

#external-events .fc-event {
	margin: 1em 0;
	cursor: move;
}

#calendar-container {
	position: relative;
	z-index: 1;
	margin-left: 200px;
}

#calendar {
	max-width: 900px;
	margin: 20px auto;
}

</style>
<script type="text/javascript">
	document.addEventListener('DOMContentLoaded', function() {
		console.log("캘린더인가!!!!!!!!!");
		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			
			plugins : [ 'dayGrid','interaction' ],
			defaultView: 'dayGridMonth',
			selectable: true,
			header : {
				left : 'prev',
				center : 'title',
				right : 'next,  today'
			},
			locale : 'ko',
			editable : true,
			droppable: true,
			displayEventTime: false,
			allDaySlot: false,
			eventSources : [ 
				{
				url : '/prectice/planList.do',
				type : 'POST',
				success : function(msg) {
					console.log(msg);
				},
				error : function() {
					alert('제발.... 돼라');
				},
				color:'red'
			}],
			  eventRender: function(info){
				
				plan_no = info.event.extendedProps.plan_no;
				console.info(plan_no);
			  },
			  eventClick: function(info){
					
				  plan_no = info.event.extendedProps.plan_no;
				  var openpopup;
				  var popurl = "fullcalendardetail.do?plan_no="+plan_no;
				  var popoption = "width = 600, height = 600 left = 100, top=50,location=no"
				  openpopup = window.open(popurl, "fullcalendardetail", popoption); 
				  },
			  eventResize: function(info) {
				    alert(info.event.title + " end is now " + info.event.end.toISOString());

					if (!confirm("is this okay?")) {
					  info.revert();
				    }
			    }
		});

		calendar.render();
	});
	
	//---------------------------

</script>
</head>
<%@ include file="/WEB-INF/views/form/header.jsp" %>
<body>

	    <div class="row">
          <div class="col-lg-12">
            <section class="panel">
              <div class="panel-body">
              <!-- schedule start -->
                 <div id='calendar' style="position : relative;">
                 		<div>
                 			<button class = "add-button" type = "button" onclick="click_add();">일정 추가</button>
                 		</div>
                 </div>

              </div>
            </section>
          </div>
        </div>


  <!-- custom form validation script for this page-->
  <script src="resources/fullcalendar/origin/js/form-validation-script.js"></script>
  <!--custome script for all page-->
  <script src="resources/fullcalendar/origin/js/scripts.js"></script>
  <!-- 부트스트랩 기본 템플릿 end -->
  <%@ include file="/WEB-INF/views/form/footer.jsp" %>

</body>
</html>