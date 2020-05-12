<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
	footer {
    	height:100px;
    	width: 100%;
		border: 1px dotted red;
	}
	 #toast {
            visibility: hidden;     
            bottom: 100px;                    
            border-radius: 25px;   
            background-color: #666666;    
            color: #FFFFFF;    
            padding: 15px 25px;     
        }
        #toast.show {
            visibility: visible;    
            animation: fade-in 1000ms, fade-out 1000ms 2000ms;
        }
      
        @keyframes fade-in {
 			
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        @keyframes fade-out {
       		
            from {
                opacity: 1;
            }
            to {
                opacity: 0;
            }
        }
</style>
</head>
<body>
<div id="toast" style="border:1px dotted blue;
	width:25%; 
	height:130px;
	float:right; 
	position:relative; 
	margin: -2% 0% 0% 69%;
	cursor:pointer;"><img alt="letter" src="resources/images/letteralram.png" style="width:27%; height:130px;"/>
		<div style="margin:-28% 0% 0% 37%;">
			<p>보낸사람: <a id="letterfrom"></a><p>
			<p>제목: <a id="lettertitle"></a></p>
			<p>내용: 
				<a id="lettercontent"></a>
			</p>
		</div>
	</div>
<footer>
	<address style="margin-left:25%;">Copy Allright reserved...</address>
</footer>
</body>
<script type="text/javascript">
	var memberid = "";
	var lastLetterSeq = 0;
	const toast = document.getElementById('toast');  // id가 toast인 요소 div
	let isToastShown = false;
	memberid = "${sessionScope.logininfo.id}";
	
	$(function(){
		if(${!empty sessionScope.logininfo}){       // 세션에 로그인정보가 있을시에만 작동
			getLastLetterSeq();         // 처음에 마지막 쪽지번호를 먼저 알아야된다.(시간차보다 먼저 실행되어야 함)
			AjaxLetterCall();           // 시간차로 계속해서 처음에 뽑은 쪽지번호와 비교 & 쪽지내용 출력		
		}	
	});

	function getLastLetterSeq(){
		$.ajax({
			url:"getLastLetterSeq.do",
			type:"post",
			dataType:"text",
			data:{"id":memberid},
			success:function(data){
				console.log("처음에 한번나와야되는 seq::" + data);
				lastLetterSeq = data;
			},
			error:function(){
				console.log("통신 실패");
			}
		})	
	}
	
	function AjaxLetterCall(){
		
		console.log("세션에 저장되어있을 시 계속 나와야되는 id:" + memberid);
		$.ajax({
			url:"ajaxLetterCall.do",
			type:"post",
			dataType:"json",
			data:{"id":memberid},
			success:function(data){
				//console.log(data);
				$.each(data, function(key, val){
					if(key == "letter_from"){         //Toast방식의 쪽지에 내용을 지속적으로 갱신
						$("#letterfrom").text(data.letter_from);
					}
					if(key == "letter_title"){    //Toast방식의 쪽지에 내용을 지속적으로 갱신
						$("#lettertitle").text(data.letter_title);
					}
					if(key =="letter_content"){   //Toast방식의 쪽지에 내용을 지속적으로 갱신
						var lettercontent = data.letter_content.substr(0,7)+".....";
						$("#lettercontent").text(lettercontent);
					}
					if(key == "letter_no"){
						console.log("letterseq::" + data.letter_no);            //지속적으로 갱신할 letterseq
						console.log("lastLetterSeq::" + lastLetterSeq);     //처음에 한번만 사용할 lastLetterSeq

						if(lastLetterSeq < data.letter_no){            // 새로운 쪽지가 도착하면
							//if (isToastShown) return;   // 토스트 메시지가 띄어져 있다면(true상태일 경우) 함수를 끝냄
					  		 isToastShown = true;
					  		 toast.classList.add('show');    // show라는 클래스를 추가해서 토스트 메시지를 띄우는 애니메이션을 발동시킴
					      	 setTimeout(function () {
					      	 // 3000ms 후에 show 클래스를 제거함
					      	 toast.classList.remove('show');
					      	 isToastShown = false;
					  	 	}, 3000);
						
						}
						lastLetterSeq = val;      // 쪽지를 띄우고 다시 같은 값으로 맞춰준다.
					}
					
				});
			},
			error:function(){
				console.log("통신 에러");
			}
		})
		setTimeout(AjaxLetterCall,10000);
	}
	
	
</script>
</html>