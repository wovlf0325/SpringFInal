<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<body>
    <div>
    	<input type="text" id="chatroomnum" value="${chatroomnum }" style="display: none;">
        <input type="text" id="sender" value="${sessionScope.logininfo.member_id }" style="display: none;">
        <input type="text" id="messageinput" onkeydown="enter();">
    </div>
    <div>
        <!-- <button type="button" onclick="openSocket();" style="display: none;">Open</button>
        <button type="button" onclick="closeSocket();" style="display: none;">Close</button> -->
        <button type="button" onclick="send();">Send</button>
        <button type="button" onclick="chatout();">Back</button>
    </div>
    <!-- Server responses get written here -->
    <c:forEach items="${chatlist }" var="dto">
    	<div>${dto.massage_content }  /  <fmt:formatDate value="${dto.massage_regtime }" pattern="HH:mm"/></div>
    </c:forEach>
    <div id="messages"></div>
    <!-- websocket javascript -->
    <script type="text/javascript">
        var ws;
        var messages=document.getElementById("messages");
        
        window.onload = function openSocket(){
            if(ws!==undefined && ws.readyState!==WebSocket.CLOSED){
                writeResponse("WebSocket is already opened.");
                return;
            }
            //웹소켓 객체 만드는 코드
            ws=new WebSocket("ws://localhost:8787/prectice/echo.do");
            
            ws.onopen=function(event){
                if(event.data===undefined) return;
                
                writeResponse(event.data);
            };
            ws.onmessage=function(event){
            	var roomnum = event.data.split(",")[1];
            	if(roomnum == document.getElementById("chatroomnum").value || roomnum == 0){
	                writeResponse(event.data.split(",")[0]);
            	}
            };
            ws.onclose=function(event){
                writeResponse("Connection closed");
            };
        }
        
        function send(){
            var text=document.getElementById("messageinput").value+","+document.getElementById("sender").value+","+document.getElementById("chatroomnum").value;
            ws.send(text);
            messageinsert();
            text="";
            document.getElementById("messageinput").value = "";
        }
        
        /* function closeSocket(){
            ws.close();
        } */
        function writeResponse(text){
            messages.innerHTML+="<br/>"+text;
        }
        
        function enter() {
    		if (event.keyCode == 13) {
    			send();
    			document.getElementById("messageinput").value = "";
    		}
    	}
        
        function chatout(){
        	location.href="chatout.do?chatroom_no="+document.getElementById("chatroomnum").value + "&member_no="+${logininfo.member_no};
        }
        
        function messageinsert(){
        	var message = document.getElementById("sender").value + " : "+ document.getElementById("messageinput").value;
        	var chatroom_no = document.getElementById("chatroomnum").value;
        	console.log(message);
        	console.log(chatroom_no);
        	$.ajax({
        		url:"messageinsert.do?message="+message+"&chatroom_no="+chatroom_no+"&member_no=${logininfo.member_no}",
        		type:"POST",
        		success:function(){
        			console.log("ajax 작동 성공");
        		},
        		error:function(){
        			console.log("ajax 작동 실패");
        		}
        	});
        }
  </script>
</body>

</html>