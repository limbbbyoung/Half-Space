<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- html 태그 내에 넣을 부분 -->
<!-- BootStrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Styles -->
<link rel="stylesheet" href="/resources/login/join.css">
<!-- 글씨체 -->
<link href="https://webfontworld.github.io/sandbox/SBAggro.css" rel="stylesheet">
<sec:authentication property="principal" var="prin"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
					<div class="row" style="width: 100%; padding: 20px; margin: auto;">
						<div class="box-header">
							
						</div><!-- header -->
						<div class="box-body">
							<input type="text" name="name" id="teamName" class="form-control" placeholder="여기에 댓글을 작성하세요.">
						
						</div><!-- body -->
						<div class="box-footer" style="margin-top: 15px; text-align: right;">
					        <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
					        <input type="hidden" name="tno" id="newTno" class="form-control" value="">
					        <button type="button" id="registBtn" class="btn btn-primary">댓글 작성</button>
						</div><!-- footer -->
					</div>


</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

			$("#registBtn").on("click", function(){
				
				let replyer = $("#newReplyWriter").val();
				let tno = $("#newReplyText").val();
				
				$.ajax({
					type : 'post',
					url : '/manager' + tno,
					beforeSend : function(xhr) {
						 xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
						 },
					headers: {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : 'text',
					data : JSON.stringify({
						bno : bno,
						replyer : replyer,
						reply_content : reply
					}),
					success : function(result){
						if(result == "SUCCESS"){
							
							alert("등록되었습니다.");
							getAllList();
							$("#newReplyText").val('');
						}
					}
					
				});
			});
</script>
</html>