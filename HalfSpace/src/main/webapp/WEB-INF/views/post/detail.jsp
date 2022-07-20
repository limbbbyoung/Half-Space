<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!-- BootStrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Styles -->
<link rel="stylesheet" href="/resources/comment/modal.css">
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<sec:authentication property="principal" var="prin"/>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/comment/modal.css">
<style>
	 #btn-filed, #commentAdd{
	 	margin-bottom : 10px;
	 	padding : 10px 10px;
        display: inline-block;
        background-color:#244875; 
        color: white;
        border-radius: 20px;
        text-align: center;
        line-height: 100%;
    }
    
    #uploadResult {
		width:100%;
		background-color: aqua;
	}
	
	#uploadResult ul {
		display : flex;
		flex-flow : row;
		justify-content : center;
		align-items : center;
	}
	#uploadResult ul li {
		list-style : none;
		padding: 10px;
		align-content : center;
		text-align : center;
	}
	#uploadResult ul li img {
		width : 100px;
	}
</style>
<meta charset="UTF-8">
<title>postDetail</title>
</head>
<body>


	<div class="header">
	</div><!-- .header -->
	<div class="container">
		<div class="row">
			<div class="col-6">
				글제목 : ${post.title } <br/>
				글쓴이 : ${post.writer } <br/>
				카테고리 : ${post.catego } <br/>
				글내용 : ${post.content } <br/>
				<sec:authorize access="isAuthenticated()">
					<c:if test="${prin.authorities eq '[ROLE_ADMIN]' || prin.username eq post.writer}">
					<form action="/post/delete" method="post">
						<input type="hidden" name="pono" value="${post.pono}"/>
						<input type="hidden" name="page" value="${param.page}"/>
						<input type="hidden" name="searchType" value="${param.searchType}"/>
						<input type="hidden" name="keyword" value="${param.keyword}"/>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<button type="submit" class="btn" id="btn-filed">글 삭제하기</button>
					</form>
					<form action="/post/updateForm" method="post">
						<input type="hidden" name="pono" value="${post.pono}"/>
						<input type="hidden" name="page" value="${param.page}"/>
						<input type="hidden" name="searchType" value="${param.searchType}"/>
						<input type="hidden" name="keyword" value="${param.keyword}"/>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<button type="submit" class="btn" id="btn-filed">글 수정하기</button>
					</form>
					</c:if>
				</sec:authorize>
				<a class="btn" id="btn-filed" href="/post/list?page=${param.page}&searchType=${param.searchType}&keyword=${param.keyword}">글 목록</a>
		    </div><!-- .col-6 -->
			
				<!-- 첨부파일 영역 작성 -->
			<div class="row">
				<h3 class="text-primary">첨부파일</h3>
				<div id="uploadResult">
					<ul>
						<!-- 첨부파일이 들어갈 위치 -->
					</ul>
				</div>
			</div><!-- row -->
	
			<div class="col-6">
			
				<!-- 자유 게시판 상세글의 댓글 comment -->
				<div id="comment">
					<!-- comment 들어갈 위치 -->
				</div>
				
				<!-- comment add btn -->
			<sec:authorize access="isAuthenticated()">
				<div class = "row box-box-success">
					<div class="box-header">
						<h2 style="color: #244875;">댓글 작성</h2>
					</div>
					<div class="box-body">
						<strong>Writer</strong>
						<input type="text" id="newWriter" value="${prin.username}" class="form-control" readonly>
						<strong>CommentText</strong>
						<input type="text" id="newContent" placeholder="c_content" class="form-control">
					</div><!-- body end -->
					<div class="box-footer">
						<button type="button" id="commentAdd" class="btn">댓글 작성</button>
					</div>
				</div><!-- comadd btn END -->
			</sec:authorize>
			
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
			<sec:authorize access="isAuthenticated()">
				<c:if test="${prin.authorities eq '[ROLE_ADMIN]' || prin.username eq post.writer}">
					<button type="button" id="comModBtn">수정하기</button>
					<button type="button" id="comDelBtn">삭제하기</button>
					<button type="button" id="closeBtn">닫기</button>
				</c:if>
			</sec:authorize>
		</div>
	</div>

	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<!-- List 로직 -->
	<script type="text/javascript">
	let pono = ${post.pono}
	let csrfHeaderName = "${_csrf.headerName}"
	let csrfTokenValue = "${_csrf.token}"
		
	
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
	
	// 익명함수 선언 및 호출
	// 우선 함수이기 때문에 호출한다는 점을 명시하기 위해 마지막에 () 를 추가로 붙여준다.
	(function(){
		$.getJSON("/post/getAttachList", {pono:pono}, function(arr){
			console.log(arr);
			
			let str = "";
			
			$(arr).each(function(i, attach){
				// 이미지파일인 경우
				if(attach.fileType){
					let fileCallPath = encodeURIComponent(attach.uploadPath + 
										"/s_" + attach.uuid + "_" + attach.fileName);
					
					str += `<li data-path='\${attach.uploadPath}' data-uuid='\${attach.uuid}'
							data-filename='\${attach.fileName}' data-type='\${attach.fileType}'>
								<div>
									<img src='/display?fileName=\${fileCallPath}'>
								</div>
							</li>`;
				} else {
					// 이미지가 아닌 파일의 경우
					str += `<li data-path='\${attach.uploadPath}' data-uuid='\${attach.uuid}'
								data-filename='\${attach.fileName}' data-type='\${attach.fileType}'>
								<div>
									<span>\${attach.fileName}</span><br/>
									<img src='/resources/attach.png' width='100px' height='100px'>
								</div>
							</li>`;
				}
			});// .each 반복문 닫는부분
			// 위에서 str변수에 작성된 태그 형식을 화면에 끼워넣기
			$("#uploadResult ul").html(str);
		});
	})();// 익명함수 닫는부분
	
		$("#uploadResult").on("click", "li", function(e){
			let liObj = $(this);
			
			let path = encodeURIComponent(liObj.data("path") + "/" + liObj.data("uuid") + "_"
										+ liObj.data("filename"));
			
			// download
			self.location = "/download?fileName=" + path;
			
		});
	
	</script>
	
	<!--comment script src -->
	<script src="/resources/comment/modalshow.js"></script>
	<script src="/resources/comment/commentAdd.js"></script>
	<script src="/resources/comment/modalclose.js"></script>
	<script src="/resources/comment/modify.js"></script>
	<script src="/resources/comment/delete.js"></script>	
</body>
</html>