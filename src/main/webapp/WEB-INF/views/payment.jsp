<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
 
 <script type="text/javascript">

 
 $.ajax({
	url:"getLoginInfo.do",
	type:"get",
	dataType:"json",
	success:function(data){
		console.log(data)
		$("#phone").val(data.member_phone);
		$("#email").val(data.member_email);
		$("#name").val(data.member_name);
	
	},
	error:function(){
		console.log("통신 실패");
	}
})

function requestPay(){
	 var IMP = window.IMP; // 생략가능
     IMP.init('imp63445837'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
     var msg;
     var amount = $("#amount").val();
     var name = $("#name").val();
     var member_email = $("#email").val();
     var phone = $("#phone").val();
     var productName = $("#productName").val();
     var house_id = $("#house_id").val();

   	  
     
     if (amount == null|| amount == "") {
    	 alert("금액 입력");
     } else if (name == null|| name == "") {
    	 alert("이름 입력");
     } else if (email == null|| email == "") {
    	 alert("이메일 입력");
     } else if (phone == null|| phone == "") {
    	 alert("연락처 입력");
     } else if (productName == null|| productName == "") {
    	 alert("상품명 입력");
     } else {
    	 var reqParam = {
 	         pg : 'kakaopay',
 	         pay_method : 'card', 
 	         merchant_uid : 'merchant_' + new Date().getTime(),
 	         name : productName,
 	         house_id : house_id,
 	         amount : amount,
 	         buyer_email : email,
 	         buyer_name : name,
 	         buyer_tel : phone,
 	         buyer_postcode : '123-456',
 	         m_redirect_url : 'http://localhost:8787/prectice/test.html' 
 	     };
		IMP.request_pay(reqParam, function(rsp) {
			console.log(rsp)
			if (rsp.success) {
				// 2
				var payParam = {
					email : member_email,
					house_id : house_id,
					memberName : name,
					paymentUID : rsp.imp_uid,
					paymentAmount : rsp.paid_amount
				}
				$.ajax({
					url : "paymentProc.do",
					type: 'POST',
					data: payParam,
					dataType: 'json',
					success : function (data) {
						if (data.result > 0) {
							var msg = '결제가 완료되었습니다.';
							msg += '회원이름 : ' + name;
							msg += '카드 승인번호 : ' + rsp.apply_num;
							msg += '고유ID : ' + rsp.imp_uid;
							msg += '상점 거래ID : ' + rsp.merchant_uid;
							msg += '결제 금액 : ' + rsp.paid_amount;
							msg += '카드 승인번호 : ' + rsp.apply_num;
							//alert("결제가 완료되었습니다.");
							// 5
							location.href = "paycomplete.do?uid="+rsp.imp_uid+"&name="+name+"&amount="+rsp.paid_amount+"&member_email="+email;
						}
					}
				})
			} else {
				alert(rsp.error_msg);
			}
		});	 
     }
     
}
</script>




</head>
<body>



	

<label for="username">NAME</label>
<input type="text" name="name" id = "name" placeholder="NAME을 입력해주세요." autocomplete="off" required />
<br>
<label for="username">PHONE</label>
<input type="text" name="phone" id = "phone" placeholder="PHONE을 입력해주세요." autocomplete="off" required />
<br>
<label for="username">EMAIL</label>
<input type="text" name="email" id = "email" placeholder="EMAIL을 입력해주세요." autocomplete="off" required />
<br>
<label for="username">가계약 금액</label>
<input type="text" name="amount" id = "amount" value="50000" autocomplete="off" required />
<br>
<label for="username">가계약 하우스</label>
<input type="text" name="productName" id = "productName" value="${house_name }" placeholder="상품명을 입력해주세요." autocomplete="off" required />
<input type="hidden" name="house_id" id="house_id" value="${house_id }">
<br>
<div>
			<p>
				<input name="" value="T" type="checkbox">
				결제정보를 확인하였으며, 구매진행에 동의합니다.
			</p>
</div>
		<div>
		<a class="" id="payCancel" onclick=""><button>취소</button></a>
		<a class=""	id="payCo" onclick="requestPay()"><button>결제하기</button></a>
		</div>
	


		












</body>
</html>