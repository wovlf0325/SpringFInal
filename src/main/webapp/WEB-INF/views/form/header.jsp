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
<header align="right">

	<c:choose>
		<c:when test="${empty logininfo }">
			<a href="login.do">로그인</a> <a href="agreement.do">회원가입</a>
		</c:when>
		<c:otherwise>
			<a href="myinfo.do">내정보</a>
			<a href="logout.do">로그아웃</a>
			<a href="letterlist.do">쪽지함</a>
			<a href="fullcalendar.do">풀캘린더</a>
			<a href="loading.do">로딩</a>
		</c:otherwise>
	</c:choose>

</header>

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
                      "dropdown" data-toggle="dropdown" href="index.jsp">Home <i class="fa fa-angle-down"></i>
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
                      "dropdown" data-toggle="dropdown" href="#">Feature <i class="fa fa-angle-down"></i>
                      </a>
                      <ul class="dropdown-menu">
                          <li>
                              <a href="typography.html">Typography</a>
                          </li>
                          <li>
                              <a href="button.html">Buttons</a>
                          </li>
                          <li>
                              <a href="form.html">Form</a>
                          </li>
                          <li>
                              <a href="table.html">Table</a>
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
                      "dropdown" data-toggle="dropdown" href="#">Pages <i class="fa fa-angle-down"></i>
                      </a>
                      <ul class="dropdown-menu">
                          <li>
                              <a href="about.html">About</a>
                          </li>
                          <li>
                              <a href="404.html">404 page</a>
                          </li>
                          <li>
                              <a href="career.html">career</a>
                          </li>
                          <li>
                              <a href="login.html">Login</a>
                          </li>
                          <li>
                              <a href="registration.html">Registration</a>
                          </li>
                          <li>
                              <a href="faq.html">FAQ</a>
                          </li>
                          <li class="dropdown-submenu">
                              <a href="#" tabindex="-1">Pricing table</a>
                              <ul class="dropdown-menu">
                                  <li class="dropdown-submenu"></li>
                                  <li>
                                      <a href="price-table-one.html">Pricing table one</a>
                                  </li>
                                  <li>
                                      <a href="price-table-two.html">Pricing table two</a>
                                  </li>
                              </ul>
                          </li>
                          <li>
                              <a href="service.html">Service</a>
                          </li>
                          <li>
                              <a href="terms.html">Terms & Condition</a>
                          </li>
                          <li>
                              <a href="privacy.html">Privacy policy</a>
                          </li>
                      </ul>
                  </li>
                  <li class="dropdown">
                      <a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover=
                      "dropdown" data-toggle="dropdown" href="#">Portfolio <i class="fa fa-angle-down"></i>
                      </a>
                      <ul class="dropdown-menu">
                          <li>
                              <a href="portfolio-3-col.html">Portfolio 3 column</a>
                          </li>
                          <li>
                              <a href="portfolio-4-col.html">Portfolio 4 column</a>
                          </li>
                          <li>
                              <a href="portfolio-single-image.html">Portfolio Single Image</a>
                          </li>
                          <li>
                              <a href="portfolio-single-video.html">Portfolio Single Video</a>
                          </li>
                      </ul>
                  </li>
                  <li class="dropdown">
                      <a class="dropdown-toggle" data-close-others="false" data-delay="0" data-hover=
                      "dropdown" data-toggle="dropdown" href="#">Blog <i class="fa fa-angle-down"></i>
                      </a>
                      <ul class="dropdown-menu">
                          <li>
                              <a href="blog.html">Blog</a>
                          </li>
                          <li>
                              <a href="blog-two-col.html">Blog two column</a>
                          </li>
                          <li>
                              <a href="blog-detail.html">Blog Single Image</a>
                          </li>
                          <li>
                              <a href="blog-detail-video.html">Blog single video</a>
                          </li>
                      </ul>
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