<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<style type="text/css">

#wall {
  position:relative;
  width: 100%;
  height: 150px;
  top: -10px;
  background: #fff;
  text-align: center;
  padding-top: 30px;
  font-family: Quicksand, Helvetica, sans;
  color: red;
}

#eye-l, #eye-r {
  position:absolute;
  z-index: 20;
  width: 10px;
  height: 10px;
  border-radius: 50%;
  background: white;
  margin-top:5px;
  left: 5px;
  margin-left: -5px;
  -webkit-animation: search 2s infinite;
  box-sizing: border-box;
  border: 3px solid red;
}

#eye-r {
  margin-left: 5px;
}

#nose {
  position:relative;
  width: 15px;
  height: 15px;
  border: 3px solid red;
  border-radius: 50%;
  border-top-color: transparent;
  background: white;
  top:12px;
  left:-7px;
  -webkit-transform: rotate(35deg);
  -webkit-animation: noser 2s infinite;
}

#mouth{
  position:relative;
  width: 6px;
  height: 6px;
  border-radius: 50%;
  background: red;
  margin-top:20px;
  float:left;
  margin-left: 3px;
  -webkit-animation: search 2s infinite;
}

#man {
  position:relative;
  width: 50px;
  height: 70px;
  border: 5px solid red;
  border-radius: 50%;
  margin-left:50%;
  left: -25px;
  -webkit-animation: pop 8s infinite;
}

@-webkit-keyframes search {
  0%, 100% { -webkit-transform:translate(0px, 0px);}
  50% {-webkit-transform:translate(32px, 0px);}
}

@-webkit-keyframes noser {
  0%, 100% { -webkit-transform:translate(0px, 0px) rotate(35deg);}
  50% {-webkit-transform:translate(43px, 0px) rotate(-35deg);}
}

@-webkit-keyframes pop {
  0%, 100% { -webkit-transform:translate(0px, 80px)}
  20%, 80% { -webkit-transform:translate(0px, 10px)}
}
.loading{
    width:100%;
    height:100%;
    position:fixed;
    left:0px;
    top:0px;
    background:#fff;
    z-index:1000; /* 이 값으로 레이어의 위치를 조정합니다. */
}
</style>
<script>

  	setTimeout(function(){
  		$(".loading").css("display","none");
  	},2000)
    
</script>
</head>
<body>
<header align="right">
<a href="logo.do"><img align="left" width="70" height="90" src="https://s3.orbi.kr/data/file/united2/1838c353-5e34-48fe-814c-83c353e2a2e1D013A0F3-D20B-4FBD-ABA0-E4C5213C9C3E.jpeg"></a>
	<c:choose>
		<c:when test="${empty logininfo }">
			<a href="login.do">로그인</a> <a href="agreement.do">회원가입</a>	
		</c:when>
		<c:otherwise>
			<a href="updateform.do">내 정보</a>
			<a href="logout.do">로그아웃</a>
			<a href="letterlist.do">쪽지함</a>
			<a href="fullcalendar.do">풀캘린더</a>
			<a href="loading.do">로딩</a>
			<a href="chart.do">차트</a>
			<a href="mainchart.do">메인차트</a>
		</c:otherwise>
	</c:choose>

<div class="loading">
<div id="man">
  <div id="eye-l"></div>
  <div id="eye-r"></div>
  <div id="nose"></div>
  <div id="mouth"></div>
</div>
<div id="wall">로딩중이오이다...</div>
</div>

</header>
</body>
</html>