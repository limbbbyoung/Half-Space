<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<ul id="comment">
	
	</ul>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script type="text/javascript">
		let bno = 1;
		
		console.log("glglgl");
		
		// 댓글 전체 불러오기
		function getAllList() {
			$.getJSON("/comment/all/" + bno, function(data) {
				
				let str = "";
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