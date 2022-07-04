<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jquery CDN -->
<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">	
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/resources/comment/modal.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${post}
	<br/>
	<a href="/post/list?page=${param.page}&searchType=${param.searchType}&keyword=${param.keyword}"><button>목록으로 돌아가기</button></a>
	
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

	<!-- comment div -->
	<div class="row">
		<h3 class="text-primary">댓글</h3>
		<div id="comment">
			<!-- comment 들어갈 위치 -->
		</div>
	</div>
	
	
	<!-- comment add btn -->
	<div class = "row box-box-success">
		<div class="box-header">
			<h2 class="text-primary">댓글 작성</h2>
		</div>
		<div class="box-body">
			<strong>writer</strong>
			<input type="text" id="newWriter" placeholder="writer" class="form-control">
			<strong>c_content</strong>
			<input type="text" id="newContent" placeholder="c_content" class="form-control">
		</div><!-- body end -->
		<div class="box-footer">
			<button type="button" class="btn btn-success" id="commentAdd">댓글 작성</button>
		</div>
	</div><!-- comadd btn END -->
	
	<!-- 모달창 -->
	<div id="modDiv" style="display:none;">
		<div class="modal-title"></div>
		<div>
			<input type="text" id="comText">
		</div>
		<div>
			<button type="button" id="comModBtn">수정하기</button>
			<button type="button" id="comDelBtn">삭제하기</button>
			<button type="button" id="closeBtn">닫기</button>
		</div>
	</div>


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script type="text/javascript">
	let pono = 9232;
	
	
	function getAllList(){
		// json 데이터를 얻어오는 로직 실행
		$.getJSON("/comment/all/" + pono, function(data){
			
			let str = "";
			console.log(data.length);
			
			$(data).each(
					function(){					
						let timestamp = this.updateDate;
						
						let date = new Date(timestamp);
						
						let formattedTime = `게시일 : 
											\${date.getFullYear()}년
										    \${(date.getMonth()+1)}월
											\${date.getDate()}일`;
											console.log(this.reply_content);
						str += `<div class='commentLi' data-cno='\${this.cno}'>
								<strong>@\${this.user_id}</strong> - \${formattedTime} <br/>
								<div class="comText"> \${this.c_content} </div> 
								<button type='button' class='btn btn-info'>수정/삭제</button>
								</div>`;
				});
			console.log(str);
			$("#comment").html(str);
		});
	}
	getAllList();



	</script>
	<!--comment script src -->
	<script src="/resources/comment/modalshow.js"></script>
	<script src="/resources/comment/commentAdd.js"></script>
	<script src="/resources/comment/modalclose.js"></script>
	<script src="/resources/comment/modify.js"></script>
	<script src="/resources/comment/delete.js"></script>	

</body>
</html>