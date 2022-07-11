<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/comment/modal.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="header">
	</div><!-- .header -->
	<div class="container">
		<div class="row">
			<div class="col-6">
				
				팀 이름 : ${myteam.name} <br/>
				감독 : ${myteam.coach} <br/>
				창단일 : ${myteam.regdate} <br/>
				선수단 총원 : ${myteam.memberCnt} <br/>
			
				로고 : ${myteam}<br/>
		
			

								
				<form action="/post/delete" method="post">
					<input type="hidden" name="pono" value="${post.pono}"/>
					<input type="hidden" name="page" value="${param.page}"/>
					<input type="hidden" name="searchType" value="${param.searchType}"/>
					<input type="hidden" name="keyword" value="${param.keyword}"/>
					<button type="submit" class="btn" id="btn-filed">글 삭제하기</button>
				</form>
				<form action="/post/updateForm" method="post">
					<input type="hidden" name="pono" value="${post.pono}"/>
					<input type="hidden" name="page" value="${param.page}"/>
					<input type="hidden" name="searchType" value="${param.searchType}"/>
					<input type="hidden" name="keyword" value="${param.keyword}"/>
					<button type="submit" class="btn" id="btn-filed">글 수정하기</button>
				</form>
				<a class="btn" id="btn-filed" href="/post/list?page=${param.page}&searchType=${param.searchType}&keyword=${param.keyword}">글 목록</a>
		    </div><!-- .col-6 -->
			<div class="col-6">
			
				<!-- 자유 게시판 상세글의 댓글 comment -->
				<div id="comment">
					<!-- comment 들어갈 위치 -->
				</div>
				
				<!-- comment add btn -->
				<div class = "row box-box-success">
					<div class="box-header">
						<h2 style="color: #244875;">댓글 작성</h2>
					</div>
					<div class="box-body">
						<strong>Writer</strong>
						<input type="text" id="newWriter" placeholder="writer" class="form-control">
						<strong>CommentText</strong>
						<input type="text" id="newContent" placeholder="c_content" class="form-control">
					</div><!-- body end -->
					<div class="box-footer">
						<button type="button" id="commentAdd" class="btn">댓글 작성</button>
					</div>
				</div><!-- comadd btn END -->
			</div><!-- .col-6 -->
		</div><!-- .row -->
	</div><!-- .container -->
	<div class="footer"></div><!-- .footer -->
	<hr/>
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

	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<!-- List 로직 -->
	<script type="text/javascript">
</body>
</html>