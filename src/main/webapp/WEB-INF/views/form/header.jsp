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
	         <a href="myinfo.do">내정보</a>
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
                      <a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover=
                      "dropdown" data-toggle="dropdown" href="houselist.do">코리빙하우스 <i class="fa fa-angle-down"></i>
                      </a>
                      <ul class="dropdown-menu">
                          <li>
                              <a href="index.html">Home Parallax</a>
                          </li>
                          <li>
                              <a href="index1.html">Home Seq-slider1</a>
                          </li>
                          <li>
                              <a href="index2.html">Home Seq-slider2</a>
                          </li>
                      </ul>
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
                          </li>
                          <li class="dropdown-submenu">
                              <a href="#" tabindex="-1">More options</a>
                              <ul class="dropdown-menu">
                                  <li>
                                      <a href="#" tabindex="-1">Second level</a>
                                  </li>
                                  <li class="dropdown-submenu">
                                      <a href="#">Even More..</a>
                                      <ul class="dropdown-menu">
                                          <li>
                                              <a href="#">3rd level</a>
                                          </li>
                                          <li>
                                              <a href="#">3rd level</a>
                                          </li>
                                      </ul>
                                  </li>
                                  <li>
                                      <a href="#">Second level</a>
                                  </li>
                                  <li>
                                      <a href="#">Second level</a>
                                  </li>
                              </ul>
                          </li>
                      </ul>
                  </li>
                  <li class="dropdown">
                      <a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover=
                      "dropdown" data-toggle="dropdown" href="fullcalendar.do">일정/관리 <i class="fa fa-angle-down"></i>
                      </a>
                      
                  </li>
                  <li class="dropdown">
                      <a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover=
                      "dropdown" data-toggle="dropdown" href="#">채팅 <i class="fa fa-angle-down"></i>
                      </a>
                      
                  </li>
                 
              </ul>
          </div>
      </div>
    </header>
    <!--header end-->
</body>
</html>