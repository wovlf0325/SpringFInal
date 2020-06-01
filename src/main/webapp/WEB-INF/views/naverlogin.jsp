<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%> 

<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		$("#signForm").hide();
		//naver 정보 
		var id = ${result }.response.id;
		var name = ${result }.response.name;
		var email = ${result }.response.email;
		
		
	  });
	
	$(document).ready(function(){
		var id = ${result }.response.id;
		var name = ${result }.response.name;
		var email = ${result }.response.email;
		var pw = "1111";
		
		$.ajax({
				url:"idchk.do",
				type:"post",
				data:{"id":id},
				success:function(data){
					if(data == 0){  //db저장x
						  $("#signForm").show();
						  $("input[name=member_id]").val(id);
						  $("input[name=member_name]").val(name);
						  $("input[name=member_email]").val(email);
						
	    			}else{	//db 저장o -> 로그인페이지	
	    				$("#signForm").hide();
	    				$("#loginForm").show();
	    				$("input[name=member_id]").val(id);
	    				$("#loginSNS").submit();
	    				
	    				
	    			}
				},
				error:function(){
					alert("통신에러");
				}
		});
	});	
	

	
</script>

</head>
<body>

	<div id="signForm">
	<form id="signupSNS" method="post" action="snsSignupRes.do">
		<input type="hidden" name="command" value=""><br/>
		<input type="hidden" name="member_id" value=""><br/>
		<input type="hidden" name="member_pw" value="1111"><br/>
		
		<label for ="member_name">Name</label>
		<input type="text" name="member_name" readonly="readonly"><br/>
		
		<label for ="member_email">E-mail</label>
		<input type="text" name="member_email" readonly="readonly"><br/>
	
		<input type="submit" name="" value="회원가입">
	
	</form>
	</div>
	
	<div id="loginForm">
		<form id="loginSNS" method="post" action="loginRes.do">
			<input type="hidden" name="member_id" value=""><br/>
			<input type="hidden" name="member_pw" value="1111"><br/>
		</form>
	
	</div>
	
	
	
	<!-- 
<script>
    $(function () {
      $("body").hide();
      $("body").fadeIn(1000);  // 1초 뒤에 사라 지자 
     
      setTimeout(function(){$("body").fadeOut(1000);},1000);
      setTimeout(function(){location.href= "${pageContext.request.contextPath}/"},2000);
// 2초 뒤에 메인 화면 으로 가자  
    
    })
  </script>  --> 


</body>
</html>