<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>comment 나와주세요</h2>
	
	<div>
		<div>
			user_id<input type="text" name="commenter" id="newCommenter">
		</div>
		<div>
			c_content<input type="text" name="cContent" id="newComment">
		</div>
		<button id="commentAdd">댓글 생성</button>
	</div>
	
	<!-- comment 영역 -->
	<ul id="comment">
	
	</ul>
	
	
	<div id="modDiv" style="display:none;">
		<div class="modal-title"></div>
		<div>
			<input type="text" id="comText">
		</div>
		<div>
			<button type="button" id="comModBtn">Modify</button>
			<button type="button" id="comDelBtn">Delete</button>
			<button type="button" id="closeBtn">Close</button>
		</div>
	</div>
	
	


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script type="text/javascript">
		let pono = 9223;
		
		
		// 댓글 전체 불러오기
		function getAllList() {
			
			let str = "";
			
			$.getJSON("/comment/all/" + pono, function(data) {
				
				
				console.log(data.length);
				
				$(data).each(
					function() {
						str += `<li data-cno='\${this.cno}' class='commentLi'>\${this.cno} \${this.user_id} \${this.c_content}<button>수정/삭제</button></li>`;
					});
				$("#comment").html(str + "glglgl");
			});
		}
		
		getAllList();
	</script>
</body>
</html>