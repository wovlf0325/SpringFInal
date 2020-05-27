<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function uploadimg(){
	$("input[name=file]").trigger('click');
}

</script>
</head>
<body>
	<h1> 코리빙하우스 수정하기</h1>
	
	<form action="houseupdateres.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="house_id" value="${housedto.house_id }"/>
		
		<div class="inputArea">
		<label for="house_name">코리빙하우스 이름</label>
		<input type="text" name="house_name" value="${housedto.house_name }"/>
	</div>
	
	<div class="inputArea">
		<label for="house_phone">코리빙하우스 전화번호</label>
		<input type="text" name="house_phone" value="${housedto.house_phone }"/>
	</div>
	
	<div class="inputArea">
		<label for="house_addr">코리빙하우스 주소</label>
		<input type="text" name="house_addr" value="${housedto.house_addr }"/>
	</div>
	
	<div class="inputArea">
		<label for="house_image">코리빙하우스 이미지</label>
		<input type="file" name="file" value="" onchange="readURL(this);" style="display:none;"/>
		<img id="house_img" alt="default_img" src="resources/images/houseimgstorage/${housedto.house_image }" width="100" height="100"/>
		<input type="button" value="하우스이미지 등록" onclick="uploadimg();"/>
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
	
	<div class="inputArea">
		<label for="house_content">코리빙하우스 상세정보</label>
		<textarea rows="5" cols="10" name="house_content">${housedto.house_content }</textarea>
	</div>
	
	<div class="inputArea">
		<label for="house_document">코리빙하우스 계약서</label>
		<input type="text" name="house_document" value="${housedto.house_document }" />
	</div>
	
	<div class="inputArea">
		<label for="house_status">코리빙하우스 모집현황</label>
		<input type="radio" name="house_status" value="1"> 모집중
		<input type="radio" name="house_status" value="2"> 모집완료
	</div>
	
		
	
		<div class="inputArea">
			<input type="submit" value="수정"/>
			<input type="button" value="취소" onclick="location.href='housedetail.do?house_id=${housedto.house_id }'">
		</div>
		

</form>
		
		
	

</body>
</html>