<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- jQuery -->
    <script src="https://code.jquery.com/jquery.min.js"></script>
    <!-- google charts -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
	google.charts.load('current,{'packages':['corechart']} );
	google.charts.setOnLoadCallback(numGraph1);
	google.charts.setOnLoadCallback(numGraph2);
	
	function numGraph1() {
		var date = new google.visualization.DataTable();
		data.addColumn('String', '관심사');
		data.addRows([
			['관심사','관심정도'],
			
		]);
		
	
	function numGraph2() {
		var date = new google.visualization.DataTable();
		data.addColumn('String', '선호지역');
		
	}
	
	</script>

</head>
<body>

	<h1>관심사 그래프</h1>
	
	
</body>
</html>