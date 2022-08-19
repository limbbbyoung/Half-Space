<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<!-- BootStrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://webfontworld.github.io/sandbox/SBAggro.css" rel="stylesheet">
<sec:authentication property="principal" var="prin"/>
<head>
<!-- Styles -->
<link rel="stylesheet" href="/resources/comment/modal.css">
<link rel="stylesheet" href="/resources/post/detail.css">
<style>
</style>
<meta charset="UTF-8">
<title>postDetail</title>
</head>
<body>
	<jsp:include page="../header.jsp" flush="true" />
	<jsp:include page="../sidebar.jsp" flush="true" />

	<div class="container">
 		<div class="row">
 			<div class="root-container">
 				<div class="header-wrap px-4">
					<h2>${post.title}</h2>
					<p class="parking-wrap">
						<small data-gender="3">${post.updateDate} 수정</small>
					</p>
				</div>
				<div class="img-container">
			        <img class="img-slider" src="../resources/images/soccer_zone.jpg">
			    </div>
				<div class="match-wrap">
					<div class="gender-icon d-none" data-gender="3" data-battle="false">
					</div>
					<div class="ground-wrap">
						<strong class="game-badge" data-game="rank">
							${post.pono}
						</strong>
						<h3 class="ground-name">
							${post.catego}
						</h3>
						<div style="width : 100%">
							<div class="parking-wrap" style="float:left;">
								<strong class="pl" data-gender="3">
									${post.regDate}
								</strong>
							</div>
							<div class="apply-wrap" style="float:right;">
								<sec:authorize access="isAuthenticated()">
									<c:if test="${prin.authorities eq '[ROLE_ADMIN]' || prin.username eq post.writer}">
									<form action="/post/delete" method="post" style="float:right">
										<input type="hidden" name="pono" value="${post.pono}"/>
										<input type="hidden" name="page" value="${param.page}"/>
										<input type="hidden" name="searchType" value="${param.searchType}"/>
										<input type="hidden" name="keyword" value="${param.keyword}"/>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
										<button type="submit" class="btn" id="btn-filed">삭제</button>
									</form>
									<form action="/post/updateForm" method="post" style="float:right; width: 60px;">
										<input type="hidden" name="pono" value="${post.pono}"/>
										<input type="hidden" name="page" value="${param.page}"/>
										<input type="hidden" name="searchType" value="${param.searchType}"/>
										<input type="hidden" name="keyword" value="${param.keyword}"/>
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
										<button type="submit" class="btn" id="btn-filed">수정</button>
									</form>
									</c:if>
								</sec:authorize>
							</div>
						</div>
						<sec:authorize access="isAnonymous()">
							<img src="/resources/images/likepng.png" id="likeimg" width="60px" height="60px"
								class="rounded-circle mt-2">
								${post.likeCnt} <br><br>
							추천 기능은 <a href="/login/user" type="button" id="newLogin"
							class="btn btn-outline-success">로그인</a> 후 사용 가능합니다.
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<div>
								<input type="hidden" id="likecheck" value="${like.likecheck}">
								<input type="hidden" id="userId" value="${prin.username}">
								<img class="rounded-circle likeimg" id="likeimg" src="/resources/images/likepng.png"
								width="60px" height="60px"> ${post.likeCnt}
							</div>
						</sec:authorize>
					</div>
				</div>
				
				
				<div class="profile" id="profile" style="width : 100%">
					<img src="${post.image ? post.image : '../resources/images/main_picture.jpg'}">
					<div class="profile-info">
						<p>
							<strong class="profile-name">${post.writer}</strong>
						</p>
						<p class="profile-status" style="font-weight: lighter;">
							<small>#쉬고싶어</small>
							<small>#피곤쓰..</small>
						</p>
					</div>
				</div>
				<div class="gameContent">
				 	<p>${post.content}</p><br/>
				</div>
				<a class="btn" id="btn-filed" href="/post/list?page=${param.page}&searchType=${param.searchType}&keyword=${param.keyword}" style="float:right; margin-top:10px;">목록으로 돌아가기</a>
 			</div><!-- .col 끝나는 지점 -->
 			<div>
			 	<sec:authorize access="isAuthenticated()">
					<div class="row box-box-success" style="width: 100%; padding: 20px; margin: auto;">
						<div class="box-header">
							<h2 style="color: #244875; text-align: left;" id="newReplyCount">댓글</h2>
						</div><!-- header -->
						<div class="box-body">
							<input type="hidden" id="newWriter" value="${prin.username}" class="form-control">
							<input type="text" name="reply" id="newContent" class="form-control" placeholder="여기에 댓글을 작성하세요.">
						</div><!-- body -->
						<div class="box-footer" style="margin-top: 15px; text-align: right;">
					        <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
					        <input type="hidden" name="replyer" id="newReplyWriter" class="form-control" value="<sec:authentication property="principal.Username"/>">
					        <button type="button" id="commentAdd" class="btn btn-primary">댓글 작성</button>
						</div><!-- footer -->
					</div>
				</sec:authorize>
				<!-- 댓글 -->
			 	<ul id="comment" style="padding-left:0;">
			 	</ul>
 			</div>
 		</div>
		
		<!-- 첨부파일 영역 작성 -->
		<div class="row">
			<h3 class="text-primary">첨부파일</h3>
			<div id="uploadResult">
				<ul>
					<!-- 첨부파일이 들어갈 위치 -->
				</ul>
			</div>
		</div>
		
 	</div><!-- .container 끝나는 지점 -->



	<!-- 모달창 -->
	<div id="modDiv" style="display:none;">
		<div class="modal-title"></div>
		<div>
			<input type="text" id="comText">
		</div>
		<sec:authorize access="isAuthenticated()">
			<c:if test="${prin.authorities eq '[ROLE_ADMIN]' || prin.username eq post.writer}">
				<button type="button" id="comModBtn">수정하기</button>
				<button type="button" id="comDelBtn">삭제하기</button>
			</c:if>
			<button type="button" id="closeBtn">닫기</button>
		</sec:authorize>
	</div>

	<jsp:include page="../footer.jsp" flush="true" />
</body>

	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<!-- List 로직 -->
	<script type="text/javascript">
	let pono = ${post.pono};
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
									<img src='/resources/attach.png' width='150px' height='150px'>
								</div>
							</li>`;
				}
			});// .each 반복문 닫는부분
			// 위에서 str변수에 작성된 태그 형식을 화면에 끼워넣기
			$("#uploadResult ul").html(str);
		});
	});// 익명함수 닫는부분
	
		$("#uploadResult").on("click", "li", function(e){
			let liObj = $(this);
			
			let path = encodeURIComponent(liObj.data("path") + "/" + liObj.data("uuid") + "_"
										+ liObj.data("filename"));
			
			// download
			self.location = "/download?fileName=" + path;
			
		});

	$(document).ready(function () {
			let likeCnt = document.getElementById('likeCnt')
			let likeval = document.getElementById('likecheck').value
			let userId = document.getElementById('userId').value
			let likeimg = document.getElementById("likeimg")
		
			console.log(likeval);
			
			if(userId != null) {
				
				function getLike(){
					// json 데이터를 얻어오는 로직 실행
					$.getJSON("/like/" + pono +"/"+userId, function(data){
						console.log(data);
						console.log(data.likecheck);
						let newLikecheck = data.likecheck;
						
						
						//$("#likecheck").val('newlikecheck');
						console.log(likeval);
					});
				}
				getLike();
				
			} //  if END
			
			
			if (likeval == 1) {
				likeimg.src = "/resources/images/likepng.png";
			
					$(".likeimg").on("click", function () {
						$.ajax({
							headers: {
								"Content-Type" : "application/json",
								"X-HTTP-Method-Override" : "DELETE"
							},
	
							type: 'delete',
					      	url: '/like/delete/' + userId +'/'+ pono,
					      
							beforeSend : function(xhr) {
								xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
							},
	
							dataType : 'text',
				    	  
					    	 success: function (data) {
					          
					    		  if (data == 1) {
					              $("#likeimg").attr("src", "/resources/images/likepng.png");
					              location.reload();
					          } else {
					              $("#likeimg").attr("src", "/resources/images/likepng.png");
					              location.reload();
					          }
					     	 }, error: function () {
						          $("#likeimg").attr("src", "/resources/images/likepng.png");
						          console.log('오타가 있나봐요');
						          
					     	 }
					     	 
					  	}); // ajax END
	
			  		}); // img onclick END
						
			
			} // if END
			else {
				
			    // 좋아요 버튼을 클릭 시 실행되는 코드 '좋아요 생성'
				$(".likeimg").on("click", function () {
					$.ajax({
						headers: {
							"Content-Type" : "application/json",
							"X-HTTP-Method-Override" : "POST"
						},		
						type: 'POST',
				      	url: '/like',
				      
						beforeSend : function(xhr) {
							xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
						},
						dataType : 'text',
						data : JSON.stringify({
							pono : pono,
							userId : userId
						}),
			    	  
				    	 success: function (data) {
				          
				    		  if (data == 1) {
				              $("#likeimg").attr("src", "/resources/images/likepng.png");
				              location.reload();
				          } else {
				              $("#likeimg").attr("src", "/resources/images/likepng.png");
				              location.reload();
				          }
				     	 }, error: function () {
					          $("#likeimg").attr("src", "/resources/images/likepng.png");
					          console.log('오타가 있나봐요')
				     	 }
				     	 
				  	}); // ajax END
		  		}); // img onclick END

				likeimg.src = "/resources/images/likepng.png";
			} // END else
				
	
  		
  		
  }); //  document ready END
		
		
		
		
		
		
	</script>
	
	<!--comment script src -->
	<script src="/resources/comment/modalshow.js"></script>
	<script src="/resources/comment/commentAdd.js"></script>
	<script src="/resources/comment/modalclose.js"></script>
	<script src="/resources/comment/modify.js"></script>
	<script src="/resources/comment/delete.js"></script>	
	<!-- sidebar 기능-->
	<script src="/resources/basic/sideBar.js"></script>

</html>