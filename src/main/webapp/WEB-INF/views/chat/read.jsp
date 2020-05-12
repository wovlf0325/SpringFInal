<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

<script type="text/javascript">

	var socket = null;
	
	function connect(){
		console.log("connect function");
		var ws = new WebSocket("ws://localhost:8787/replyEcho?seq=1");
		socket = ws;
		
		ws.onopen = function(){
			console.log('Info: connection opened.');
			
		};
		
		ws.onmessage = function(event){
			console.log(event.data+'\n');
		};
		
		ws.onclose = function(event){
			console.log('Info: connection closed');
			//setTimeout(function() {connect();}, 1000);
		};
		
		ws.onerror = function(err){
			console.log('Error',err);
		};
		
		
	}
	
	function msg(){
		
		event.preventDefault();
		if(socket.readyState !== 1) return;
		
		let msg = $('#msg').val();
		socket.send(msg);
		alert(msg);
		
	}
		

	
	connect();

	
	
	




</script>
</head>
<body>

<h1>read.jsp</h1>

<div class="well">
	<input type="text" id="msg" value="1212" class="form-control"/>
	<button id="btnSend" class="btn btn-primary" onclick="msg()">Send Message</button>


</div>

</body>
</html>