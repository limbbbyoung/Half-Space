<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/comment/modal.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>Ajax 테스트</h2>
	
	<div>
		<div>
			REPLYER <input type="text" name="replyer" id="newReplyWriter">
		</div>
		<div>
			REPLY TEXT <input type="text" name="reply" id="newReplyText">
		</div>
		<button id="replyAddBtn">ADD REPLY</button>
	</div>
	
	<ul id="comments">
	
	</ul>
	
	<div id="modDiv" style="display:none;">
		<div class="modal-title"></div>
		<div>
			<input type="text" id="replyText">
		</div>
		<div>
			<button type="button" id="replyModBtn">Modify</button>
			<button type="button" id="replyDelBtn">Delete</button>
			<button type="button" id="closeBtn">Close</button>
		</div>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script type="text/javascript">
		let bno = 1;
		
		// 버튼 클릭시
		$("#ajaxRequestBtn").on("click", function() {
			$.getJSON("/comment/all/" + bno, function(data){
				let str = "";
				$(data).each(
					function() {
						console.log(this);
						str += `<li data-cno='\${this.cno}' class='replyLi'>\${this.pono}:\${this.c_content}<button>수정/삭제</button></li>`;
				});
				console.log(str);
				$("#comments").html(str);
				
			});
			
		});
		
		// 댓글 전체 불러오기
		function getAllList() {
			$.getJSON("/comment/all/" + bno, function(data) {
				
				let str = "";
				console.log(data.length);
				
				$(data).each(
					function() {
						str += `<li data-rno='\${this.cno}' class='replyLi'>\${this.pono} \${this.user_id} \${this.c_content}<button>수정/삭제</button></li>`;
					});
				$("#comments").html(str);
			});
		}
		
		getAllList();
		
		// 글 등록 로직
		$("#replyAddBtn").on("click", function() {
			
			let replyer = $("#newReplyWriter").val();
			let reply = $("#newReplyText").val();
			
			$.ajax({
				type : 'post',
				url : '/comment',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					cno : cno,
					user_id : replyer,
					c_content : reply
				}),
				success : function(result) {
					if (result === "Success") {
						alert("등록되었습니다.");
						getAllList();
						$("#newReplyWriter").val('');
						$("#newReplyText").val('');
					}
				},
				error : function(result) {
					if (result.statusText === "error") {
						alert("등록에 실패하였습니다.");
					}
				}
			}); // 전체가 javascript의 객체, JSON의 형식과 비슷하다.
		}); // 글 등록 로직 종료

		$("#comment").on("click", ".replyLi button", function() {

			let reply = $(this).parent();
			let cno = reply.attr("data-cno");
			let replytext = reply.text();
			
			$(".modal-title").html(cno);
			$("#replyText").val(replytext);
			$("#modDiv").show("slow");
		});
		
	</script>
	<script src="/resources/resttest/delete.js"></script>
	<script src="/resources/resttest/modify.js"></script>
</body>
</html>