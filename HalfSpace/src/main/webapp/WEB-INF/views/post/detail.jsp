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
	
		

	<!-- 댓글달리는 영역 -->
	<div class="row">
		<h3 class="text-primary">댓글</h3>
		<div id="replies">
			<!-- 댓글이 들어갈 위치 -->
		</div>
	</div><!-- /.row -->
	
	<!-- 댓글쓰기 -->
	<div class = "row box-box-success">
		<div class="box-header">
			<h2 class="text-primary">댓글 작성</h2>
		</div><!-- header -->
		<div class="box-body">
			<strong>Writer</strong>
			<input type="text" id="newReplyer" placeholder="작성자" class="form-control">
			<strong>ReplyText</strong>
			<input type="text" id="newReplyText" placeholder="내용" class="form-control">
		</div><!-- body -->
		<div class="box-footer">
			<button type="button" class="btn btn-success" id="replyAddBtn">Add Reply</button>
		</div><!-- footer -->
	</div>	
	
	<!-- 모달창 -->
	<div id="modDiv" style="display:none;">
		<div class="modal-title"></div>
		<div>
			<input type="text" id="replyText">
		</div>
		<div>
			<button type="button" id="replyModBtn">수정하기</button>
			<button type="button" id="replyDelBtn">삭제하기</button>
			<button type="button" id="closeBtn">닫기</button>
		</div>
	</div>
	
	

</body>
</html>