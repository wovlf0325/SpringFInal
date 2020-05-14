<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<!-- fullcalendar end -->

<!-- 부트스트랩 기본 템플릿 -->
<!-- Bootstrap CSS -->
<link href="resources/fullcalendar/origin/css/bootstrap.min.css" rel="stylesheet">
<!-- bootstrap theme -->
<link href="resources/fullcalendar/origin/css/bootstrap-theme.css" rel="stylesheet">
<!--external css-->
<!-- font icon -->
<link href="resources/fullcalendar/origin/css/elegant-icons-style.css" rel="stylesheet" />
<link href="resources/fullcalendar/origin/css/font-awesome.min.css" rel="stylesheet" />
<!-- Custom styles -->
<link href="resources/fullcalendar/origin/css/style.css" rel="stylesheet">
<link href="resources/fullcalendar/origin/css/style-responsive.css" rel="stylesheet" />

<!-- custom -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	
<link href="resources/fullcalendar/custom/css/schedule.css" rel="stylesheet">
<script src='resources/fullcalendar/custom/js/schedule.js'></script>

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
				success : function() {
					alert('성공')
				},
				error : function() {
					alert('제발.... 돼라');
				},
				color:'red'
			}],
			
			  eventClick: function(event) {
				    var title = event.event._def.title;
				    
				    $.ajax({
				    	url : '/prectice/'
				    });
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
        
  <!-- javascripts -->
  <script src="resources/fullcalendar/origin/js/jquery.js"></script>
  <script src="resources/fullcalendar/origin/js/bootstrap.min.js"></script>
  <!-- nice scroll -->
  <script src="resources/fullcalendar/origin/js/jquery.scrollTo.min.js"></script>
  <script src="resources/fullcalendar/origin/js/jquery.nicescroll.js" type="text/javascript"></script>
  <!-- jquery validate js -->
  <script type="text/javascript" src="resources/fullcalendar/origin/js/jquery.validate.min.js"></script>

  <!-- custom form validation script for this page-->
  <script src="resources/fullcalendar/origin/js/form-validation-script.js"></script>
  <!--custome script for all page-->
  <script src="resources/fullcalendar/origin/js/scripts.js"></script>
  <!-- 부트스트랩 기본 템플릿 end -->
</body>
</html>