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
    <meta name="description" content="Developed By M Abdur Rokib Promy">
    <meta name="author" content="cosmic">
    <meta name="keywords" content="Bootstrap 3, Template, Theme, Responsive, Corporate, Business">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>
      Coliving | Home
    </title>


    <style type="text/css">
    .top{
    	color: lightgray;
    }
    
    
    
    </style>
    
    <!-- Bootstrap core CSS -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/theme.css" rel="stylesheet">
    <link href="resources/css/bootstrap-reset.css" rel="stylesheet">
    <!-- <link href="css/bootstrap.min.css" rel="stylesheet">-->

    <!--external css-->
    <link href="resources/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" href="resources/css/flexslider.css"/>
    <link href="resources/assets/bxslider/jquery.bxslider.css" rel="stylesheet" />
    <link rel="stylesheet" href="resources/css/animate.css">
    <link rel="stylesheet" href="resources/assets/owlcarousel/owl.carousel.css">
    <link rel="stylesheet" href="resources/assets/owlcarousel/owl.theme.css">

    <link href="resources/css/superfish.css" rel="stylesheet" media="screen">
    <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
    <!-- <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'> -->
    <!-- Custom styles for this template -->
    <link rel="stylesheet" type="text/css" href="resources/css/component.css">
    <link href="resources/css/style.css" rel="stylesheet">
    <link href="resources/css/style-responsive.css" rel="stylesheet" />

    <link rel="stylesheet" type="text/css" href="resources/css/parallax-slider/parallax-slider.css" />
    <script type="text/javascript" src="resources/js/parallax-slider/modernizr.custom.28468.js">
    </script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js">
    </script>
    <script src="js/respond.min.js">
    </script>
    <![endif]-->

</head>
<body>
	<c:choose>
	      <c:when test="${empty logininfo }">
	      	 <br/>
	     	 <br/>
			<div align="right" style="margin-right:18%;" class="top">
	         <a href="login.do">로그인</a>
	         &nbsp;&nbsp;&nbsp;&nbsp; 
	         <a href="agreement.do">회원가입</a>
	         </div>
	         <br/>
	         <br/>
	      </c:when>
	      <c:otherwise>
	  	     <br/>	
	     	 <div align="right" style="margin-right:10%;" class="top">
	         <a>${logininfo.member_id }님</a>
	         &nbsp;&nbsp;&nbsp;
	         <a href="updateform.do">내정보</a>
	         &nbsp;&nbsp;&nbsp;
	         <a href="letterlist.do">쪽지함</a>
	         &nbsp;&nbsp;&nbsp;
	         <a href="logout.do">로그아웃</a>
	         &nbsp;&nbsp;&nbsp;
	         </div>
	         <br/>
	         <br/>
	      </c:otherwise>
	   </c:choose>
	   

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


	
<!-- <div class="loading">
<div id="man">
  <div id="eye-l"></div>
  <div id="eye-r"></div>
  <div id="nose"></div>
  <div id="mouth"></div>
</div>
<div id="wall">로딩중이오이다...</div>
</div> -->


<!--header start-->
    <header class="head-section">
      <div class="navbar navbar-default navbar-static-top container">
          <div class="navbar-header">
              <button class="navbar-toggle" data-target=".navbar-collapse" data-toggle="collapse" type="button">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="index.jsp">Co<span>living</span></a>
          </div>
          <div class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                  <li class="dropdown">
                      <a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover="dropdown" 
                      data-toggle="dropdown" href="houselist.do">코리빙하우스 </a>
                  </li>
                  <li class="dropdown">
                      <a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover=
                      "dropdown" data-toggle="dropdown" href="boardlist.do?nowPage=1">게시판 <i class="fa fa-angle-down"></i>
                      </a>
                      <ul class="dropdown-menu">
                          <li>
                              <a href="boardlist.do?nowPage=1&cntPerPage=10&boardcategory=2">공지게시판</a>
                          </li>
                          <li>
                              <a href="boardlist.do?nowPage=1&cntPerPage=10&boardcategory=3">자유게시판</a>
                          </li>
                          <li>
                              <a href="boardlist.do?nowPage=1&cntPerPage=10&boardcategory=4">불만게시판</a>
                          </li>
                          <li>
                              <a href="boardlist.do?nowPage=1&cntPerPage=10&boardcategory=5">카풀게시판</a>
                      </ul>

                  </li>
                  <li class="dropdown">
                      <a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover=
						"dropdown" data-toggle="dropdown" href="fullcalendar.do">일정/관리 
                      </a>
                      
                  </li>
                  
                  <li class="dropdown">
                      <a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover=
                      "dropdown" data-toggle="dropdown" href="chatlist.do">채팅
                      </a>
                  </li>
             
                  <li>
                      <a href="contact.html">Contact</a>
                  </li>
                  <li><input class="form-control search" placeholder=" Search" type="text"></li>
              </ul>
          </div>
      </div>
    </header>
    <!--header end-->
</body>
</html>