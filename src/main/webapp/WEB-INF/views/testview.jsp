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
		var id = ${result }.response.id;
		var name = ${result }.response.name;
		var email = ${result }.response.email;
		 $("input[name=member_id]").val(id);
		 $("input[name=member_name]").val(name);
		 $("input[name=member_email]").val(email);
		
	  });
	
	$(document).ready(function(){
		var id = ${result }.response.id;
		var profile_image = ${result }.response.profile_image_url;
		
		$.ajax({
				url:"idchk.do",
				type:"post",
				data:{"id":id},
				success:function(data){
					if(data == 0){  //db저장x
	    				$(".idchkRes").html("<label class='idchkRes' title='y'>회원가입</label>");
	    			}else{			//db저장o 
	    				$(".idchkRes").html("<label class='idchkRes' title='n'>로그인</label>");
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

	<br>
	<h2 style="text-align: center" id="name"></h2>
	<h4 style="text-align: center" id="email"></h4>


	<div class="sign form">
	<form id="signupSNS" method="post" action="naverSignupRes.do">
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