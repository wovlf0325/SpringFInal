<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<% session = request.getSession(true); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <link rel="stylesheet" href="resources/css/board.css">
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
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function uploadimg(){
   $("input[name=file]").trigger('click');
}



</script>

<style type="text/css">

.inputArea{
   width:500px;
}

</style>



<body>

<h1> 코리빙하우스 등록하기 </h1>

   <form action="houseinsertres.do" method="post" enctype="multipart/form-data" class="bs-example">
      <input type="hidden" name="house_keeper" value="${sessionScope.logininfo.member_no }"/>

   <div class="form-group row">
      <label for="house_name" class="col-sm-2 col-form-label">코리빙하우스 이름</label>
      <div class="col-sm-3">
      <input type="text" class="form-control" name="house_name"/>
      </div>
   </div>
   
   <div class="form-group row">
      <label for="house_phone" class="col-sm-2 col-form-label">코리빙하우스 전화번호</label>
      <div class="col-sm-3">
      <input type="text" class="form-control" name="house_phone"/>
      </div>
   </div>
   
   <div class="form-group row">
      <label for="house_addr" class="col-sm-2 col-form-label" >코리빙하우스 주소</label>
      <div class="col-sm-3">
      <input type="text" class="form-control" name="house_addr"/>
      </div>
   </div>
   
   <div class="form-group row">
      <label for="house_image" class="col-sm-2 col-form-label" > 코리빙하우스 이미지</label>
      <div class="col-sm-3">
      <input type="file" name="file" value="" onchange="readURL(this);" style="display:none;"/>
      <img id="house_img" alt="default_img" src="resources/images/houseimgstorage/defaulthouse.jpg" width="100" height="100"/>
      <input type="button" value="하우스이미지 등록" class="form-control-file" id="exampleFormControlFile1" onclick="uploadimg();"/>
      </div>

<script type="text/javascript">
   
   function readURL(input) {
   if (input.files && input.files[0]) {
   var reader = new FileReader();
      reader.onload = function (e) {
      $('#house_img').attr('src', e.target.result);
      $('#house_img').show();
      }
   reader.readAsDataURL(input.files[0]);
   }
}
</script>
   </div>
   
   <div class="form-group row">
      <label for="house_content" class="col-sm-2 col-form-label">코리빙하우스 상세정보</label>
      <div class="col-sm-3">
      <textarea rows="5" cols="10" class="form-control" name="house_content"></textarea>
      </div>
   </div>
   
   <div class="form-group row">
      <label for="house_document" class="col-sm-2 col-form-label">코리빙하우스 계약서</label>
      <div class="col-sm-3">
         <input type="text" class="form-control" name="house_document"/>
      </div>
   </div>
   
   <div class="form-group row">
      <label for="house_status" class="col-sm-2 col-form-label" >코리빙하우스 모집현황</label>
      <input type="radio" name="house_status" value="1"> 모집중
      <input type="radio" name="house_status" value="2"> 모집완료
   </div>
   
      
   
      <div class="inputArea">
         <input type="submit" value="등록하기"/>
      </div>
      

</form>


      
      
</body>
