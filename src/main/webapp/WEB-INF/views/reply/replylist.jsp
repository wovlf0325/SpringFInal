<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	

	
	function replydelete(replyno){
		
		if(confirm("이 댓글을 정말 삭제하시겠습니까?")) {
			$.ajax({
				type:"get",
				url:"replydelete.do?reply_no="+replyno,
				success:function(){
					alert("댓글이 삭제되었습니다.");
					listReply();
				},
				error:function(){
					alert("ajax실패")
				}
			})
		}
	}
	
	
	//댓글 수정 - 댓글 내용 출력을 input폼으로 변경
	function replyupdate(replyno, reply_content){
		var a ='';
		
		a += '<div><input type="text" value="'+reply_content+'" id="reply_content"><br/>';
		a += '<input type="button" value="수정" onclick="replyupdateres('+replyno+')" ></div>';
		$('.'+replyno).html(a);
		
	}
	
	function replyupdateres(replyno){
		
		var reply_content_update = $('input[id=reply_content]').val();
		
		console.log(reply_content_update);
		
		$.ajax({
			type:"post",
			url:"replyupdate.do?reply_no="+replyno+"&reply_content="+reply_content_update,
			success:function(){
				alert("댓글이 수정되었습니다.");
				listReply();
			},
			error:function(){
				alert("ajax실패")
			}
		})
	}
	
	


</script>
</head>
<body>
	
		<c:forEach var="row" items="${replylist }">
			
				<div>
					${row.member_id }
				</div>
				<div class="${row.reply_no }">
					<div>
						<input type="text" readonly="readonly" class="form-control" value="${row.reply_content }">
					</div>
					<div>
						<fmt:formatDate value="${row.reply_regdate }" pattern="yyyy-MM-dd HH:mm:ss"/>
					</div>
					<div>
						<c:if test="${sessionScope.logininfo.member_id == row.member_id  }">
							<input type="button" class="btn btn-info" value="삭제" id="replydelete" onclick="replydelete(${row.reply_no})">
							<input type="button" class="btn btn-info" value="수정" id="replyupdate" onclick="replyupdate(${row.reply_no },'${row.reply_content}')">
									
						</c:if>
					</div>
				</div>
			
		</c:forEach>

</body>
</html>