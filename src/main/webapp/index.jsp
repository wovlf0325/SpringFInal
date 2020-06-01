<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link href="resources/css/landingpage.css" rel="stylesheet">
  <title>Coliving</title>
  
  <style type="text/css">
@import  url(https://fonts.googleapis.com/css?family=Montserrat);
$width: 15px;
$height: 15px;

$bounce_height: 30px;

body {
  position: relative; 
  width: 100%;
  height: 100vh;
  font-family: Montserrat;
}

.wrap {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.text {
  color: #fbae17;
  display: inline-block;
  margin-left: 5px;
}

.bounceball {
  position: relative;
  display: inline-block;
  height: 37px;
  width: $width;
  &:before {
    position: absolute;
    content: '';
    display: block;
    top: 0;
    width: $width;
    height: $height;
    border-radius: 50%;
    background-color: #fbae17;
    transform-origin: 50%;
    animation: bounce 500ms alternate infinite ease;
  }
}

@keyframes bounce {
  0% {
    top: $bounce_height;
    height: 5px;
    border-radius: 60px 60px 20px 20px;
    transform: scaleX(2);
  }
  35% {
    height: $height;
    border-radius: 50%;
    transform: scaleX(1);
  }
  100% {
    top: 0;
  }
}
.loadings{
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
        $(".loadings").css("display","none");
     },2000)
    
</script>

</head>
<body class="postid-4397">

<%@ include file="WEB-INF/views/form/header.jsp" %>

<div class="loadings">
<div class="wrap">
  <div class="loading">
    <div class="bounceball"></div>
    <div class="text">LOADING</div>
  </div>
</div>
</div>


  <div class="outer-container">
    <div class="header-img-container">
      <h1 class="header-title">What is coliving? Commmon's Complete Guide to Coliving</h1>
      
    </div>

    <div class="intro-paragraph">
      <p>
        Welcome to your one-stop hub for coliving. Coliving is a modern form of communal living in which residents get a private bedroom in a furnished home with shared common areas. Coliving is popular in major cities as a means of affordable living for students, workers, digital noamds, or individuals relocating. Unlike traditional apartments, coliving is attractive to tenants due to affordability, flexibility, included amenities, and a sense of community. In the context of the urban housing crisis and developers in the real estate market, coliving is one of the best and most direct means to achieve optimal density, affordable housing, and an urban community in areas such as New York and the Bay Area.</p>
    </div>
    
<!--     SECTION 1 : START -->
    <div class="section-1">
      <hr class="title-hr">
      <h1 class="title">What is coliving?</h1>
      <div class="title-container">
        <div class="img-container">
          <img src="https://assets.blinkloader.com/1968894823/1402132156_Grand-Kitchen-Slider.jpeg" class="title-img" alt="">

        </div>

        <div class="txt-wrapper">
          <div class="content">
            <p>At Common, our homes are designed to facilitate the sharing of spatial and program operations of a home while eliminating the pain points of living with roommates. That means we provide everything from toilet paper to professional cleaning
              services — for free. Through smart architectural design, community event planning, and resident support, coliving at Common aims to make home sharing desirable and affordable for all types of residents all while creating new, diverse opportunities
              and a strong community.</p>
          </div>
        </div>
      </div>
  </div>
</body>
</html>