<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jquery CDN -->
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${post}
	<br/>
	<a href="/post/list?page=${param.page}&searchType=${param.searchType}&keyword=${param.keyword}"><button>목록으로 돌아가기</button></a>
	<!-- 삭제용 폼을 만들어주면 됩니다.
	post방식으로 컨트롤러의 delete로직을 호출하면 되고,
	글번호를 bno라는 이름에 담아서 보내주도록 하면 됩니다. -->
	<form action="/post/delete" method="post">
		<input type="hidden" name="pono" value="${post.pono}"/>
		<input type="hidden" name="page" value="${param.page}"/>
		<input type="hidden" name="searchType" value="${param.searchType}"/>
		<input type="hidden" name="keyword" value="${param.keyword}"/>
		<input type="submit" value="삭제하기">
	</form>
	<form action="/post/updateForm" method="post">
		<input type="hidden" name="pono" value="${post.pono}"/>
		<input type="hidden" name="page" value="${param.page}"/>
		<input type="hidden" name="searchType" value="${param.searchType}"/>
		<input type="hidden" name="keyword" value="${param.keyword}"/>
		<input type="submit" value="수정하기">
	</form>
	
		
		

	<ul id="comment">
	
	</ul>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script type="text/javascript">
		let pono = ${post.pono}
		
		
		// 댓글 전체 불러오기
		function getAllList() {
			$.getJSON("/comment/all/" + pono, function(data) {
				
				let str = "";
				console.log(data.length);
				
				$(data).each(
					function() {
						str += `<li data-cno='\${this.cno}' class='commentLi'>\${this.cno} \${this.user_id} \${this.c_content}<button>수정/삭제</button></li>`;
					});
				$("#comment").html(str);
			});
		}
		
		getAllList();
	</script>
	

</body>
</html>