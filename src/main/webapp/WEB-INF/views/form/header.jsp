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
<style type="text/css">
body {
  background: #ede9de; 
}
.container {
  left: 50%;
  margin: auto -50px;
  position: absolute;
  top: 50%;
}
.swing div {
  border-radius: 50%;
  float: left;
  height: 1em;
  width: 1em;
}
.swing div:nth-of-type(1) {
  background: -webkit-linear-gradient(left, #385c78 0%, #325774 100%);
  background: linear-gradient(to right, #385c78 0%, #325774 100%);
}
.swing div:nth-of-type(2) {
  background: -webkit-linear-gradient(left, #325774 0%, #47536a 100%);
  background: linear-gradient(to right, #325774 0%, #47536a 100%);
}
.swing div:nth-of-type(3) {
  background: -webkit-linear-gradient(left, #4a5369 0%, #6b4d59 100%);
  background: linear-gradient(to right, #4a5369 0%, #6b4d59 100%);
}
.swing div:nth-of-type(4) {
  background: -webkit-linear-gradient(left, #744c55 0%, #954646 100%);
  background: linear-gradient(to right, #744c55 0%, #954646 100%);
}
.swing div:nth-of-type(5) {
  background: -webkit-linear-gradient(left, #9c4543 0%, #bb4034 100%);
  background: linear-gradient(to right, #9c4543 0%, #bb4034 100%);
}
.swing div:nth-of-type(6) {
  background: -webkit-linear-gradient(left, #c33f31 0%, #d83b27 100%);
  background: linear-gradient(to right, #c33f31 0%, #d83b27 100%);
}
.swing div:nth-of-type(7) {
  background: -webkit-linear-gradient(left, #da3b26 0%, #db412c 100%);
  background: linear-gradient(to right, #da3b26 0%, #db412c 100%);
}
.shadow {
  clear: left;
  padding-top: 1.5em;
}
.shadow div {
  -webkit-filter: blur(1px);
  filter: blur(1px);
  float: left;
  width: 1em;
  height: .25em;
  border-radius: 50%;
  background: #e3dbd2;
}
.shadow .shadow-l {
  background: #d5d8d6;
}
.shadow .shadow-r {
  background: #eed3ca;
}
@-webkit-keyframes ball-l {
  0%, 50% {
    -webkit-transform: rotate(0) translateX(0);
    transform: rotate(0) translateX(0);
  }
  100% {
    -webkit-transform: rotate(50deg) translateX(-2.5em);
    transform: rotate(50deg) translateX(-2.5em);
  }
}
@keyframes ball-l {
  0%, 50% {
    -webkit-transform: rotate(0) translate(0);
    transform: rotate(0) translateX(0);
  }
  100% {
    -webkit-transform: rotate(50deg) translateX(-2.5em);
    transform: rotate(50deg) translateX(-2.5em);
  }
}
@-webkit-keyframes ball-r {
  0% {
    -webkit-transform: rotate(-50deg) translateX(2.5em);
    transform: rotate(-50deg) translateX(2.5em);
  }
  50%,
  100% {
    -webkit-transform: rotate(0) translateX(0);
    transform: rotate(0) translateX(0);
  }
}
@keyframes ball-r {
  0% {
    -webkit-transform: rotate(-50deg) translateX(2.5em);
    transform: rotate(-50deg) translateX(2.5em);
  }
  50%,
  100% {
    -webkit-transform: rotate(0) translateX(0);
    transform: rotate(0) translateX(0)
  }
}
@-webkit-keyframes shadow-l-n {
  0%, 50% {
    opacity: .5;
    -webkit-transform: translateX(0);
    transform: translateX(0);
  }
  100% {
    opacity: .125;
    -webkit-transform: translateX(-1.57em);
    transform: translateX(-1.75em);
  }
}
@keyframes shadow-l-n {
  0%, 50% {
    opacity: .5;
    -webkit-transform: translateX(0);
    transform: translateX(0);
  }
  100% {
    opacity: .125;
    -webkit-transform: translateX(-1.75);
    transform: translateX(-1.75em);
  }
}
@-webkit-keyframes shadow-r-n {
  0% {
    opacity: .125;
    -webkit-transform: translateX(1.75em);
    transform: translateX(1.75em);
  }
  50%,
  100% {
    opacity: .5;
    -webkit-transform: translateX(0);
    transform: translateX(0);
  }
}
@keyframes shadow-r-n {
  0% {
    opacity: .125;
    -webkit-transform: translateX(1.75em);
    transform: translateX(1.75em);
  }
  50%,
  100% {
    opacity: .5;
    -webkit-transform: translateX(0);
    transform: translateX(0);
  }
}
.swing-l {
  -webkit-animation: ball-l .425s ease-in-out infinite alternate;
  animation: ball-l .425s ease-in-out infinite alternate;
}
.swing-r {
  -webkit-animation: ball-r .425s ease-in-out infinite alternate;
  animation: ball-r .425s ease-in-out infinite alternate;
}
.shadow-l {
  -webkit-animation: shadow-l-n .425s ease-in-out infinite alternate;
  animation: shadow-l-n .425s ease-in-out infinite alternate;
}
.shadow-r {
  -webkit-animation: shadow-r-n .425s ease-in-out infinite alternate;
  animatio
  }
</style>
<script type="text/javascript">
document.addEventListener("DOMContentLoaded", function() {
  	requestAnimationFrame(function() {
			document.getElementById("wall").style.width = "100%";
      });
    });
</script>
</head>
<body>
<header align="right">

	<c:choose>
		<c:when test="${empty logininfo }">
			<a href="login.do">로그인</a> <a href="agreement.do">회원가입</a>	
			<a href="fullcalendar.do">풀캘린더</a>
			<a href="loading.do">로딩</a>
		</c:when>
		<c:otherwise>
			<input type="button" value="내정보" onclick="">
			<input type="button" value="로그아웃" onclick="logout.do">
		</c:otherwise>
	</c:choose>

<div aria-busy="true" aria-label="Loading" role="progressbar" class="container">
  <div class="swing">
    <div class="swing-l"></div>
    <div></div>
    <div></div>
    <div></div>
    <div></div>
    <div></div>
    <div class="swing-r"></div>
  </div>
  <div class="shadow">
    <div class="shadow-l"></div>
    <div></div>
    <div></div>
    <div></div>
    <div></div>
    <div></div>
    <div class="shadow-r"></div>
  </div>
 </div>



</header>
</body>
</html>