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

${like}
	
	<div class="header">
		<div class="navi-container">
			<div class="d-flex justify-content-between align-items-center mx-auto p-0" style="max-width:800px">
				<a href="/mainBoard/welcomeHome">
					<img class="ml-3" src="../resources/images/LogoMakr-5Syrbv.png" width="70">
				</a>
				<div class="user-info-container">
					<input id="isLoggedIn" type="hidden" data-islogin="false">
					<div class="user-info-wrap">
						<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
							<a class="text-main btn-sm rounded-pill border" href="/admin/userlist">
								<strong>관리자 페이지</strong>
							</a>
						</sec:authorize>
						<sec:authorize access="isAnonymous()">
							<a class="text-main btn-sm btn-neutral" href="/login/join">
								<strong>회원가입</strong>
							</a>
							<a class="text-main btn-sm rounded-pill border" href="/login/user">
								<strong>로그인</strong>
							</a>
						</sec:authorize>
							&nbsp;
						<sec:authorize access="isAuthenticated()">
							<!-- 미확인 알림이 있을 경우 c:if 를 통한 조건비교 구문이 필요-->
							<a class="px-3" id="sidebarCollapse2" href="#">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
									<path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
								</svg>
							</a>
									
							<!-- 확인할 알림이 없는 경우 -->
							<a href="#">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell-fill" viewBox="0 0 16 16">
									<path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zm.995-14.901a1 1 0 1 0-1.99 0A5.002 5.002 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901z"/>
								</svg>
							</a>
						</sec:authorize>
						<a class="px-3" id="sidebarCollapse" href="#">
							<img src="../resources/images/threedots.png" max-width="300px" height="10px">
						</a>
					</div>
				</div>
			</div>
			<div class="menu-container">
				<div class="navi-content">
					<a href="/mainBoard/list">소셜매치</a>
					<a class="active" href="/post/list">자유게시판</a>
					<a href="/weather/today">날씨</a>
					<a href="/team/teamlist">팀 찾기</a>
				</div>
			</div>
		</div>
	</div><!-- .header끝나는 지점 -->

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
				
				
				<div class="profile" style="width : 100%">
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

	
	<div class="footer">
 		<div class="footer-container">
			<a class="my-3" href="/">
				<img src="../resources/images/LogoMakr-2rlJxi.png" width="80">
			</a>
			<p class="mt-3">축구로 하나되는 공간</p>
			<div class="copyright">
				<p class="mb-3">Spring Project A조</p>
				서울특별시 마포구 백범로 23 3층<br/>
				임병영<br/>
				김동완<br/>
				신동호
				<p class="mb-4">대표 전화번호 010-9966-8908</p>
			</div>
		</div>
		<div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
			<a class="text-white" href="https://mdbootstrap.com/">COPYRIGHT HalfSpace C&C ALL RIGHT RESERVED</a>
		</div>
 	</div><!-- .footer 끝나는 지점 -->
 	
 	<nav id="sidebar" class="mCustomScrollbar _mCS_1 mCS-autoHide mCS_no_scrollbar" style="overflow: visible;">
		<div id="mCSB_1" class="mCustomScrollBox mCS-minimal mCSB_vertical mCSB_outside" style="max-height: 879px;" tabindex="0">
			<div id="mCSB_1_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0px; left:0;" dir="ltr">
				<div class="d-flex flex-column justify-content-between h-100">
					<section>
						<div class="sidebar-body">
							<div class="header-wrap">
								<sec:authorize access="isAnonymous()">
									<a class="text-main btn-sm rounded-pill border ml-2" href="/users/login">
										<small>로그인</small>
									</a>
								</sec:authorize>
								<sec:authorize access="isAuthenticated()"><!-- collapse했을 때 보이게끔 -->
									<a class="text-main btn-sm rounded-pill border" id="nav_pill_btn1" href="/user/mypage">
										<small>내 정보</small>
									</a>
									&nbsp;
									<a class="text-main btn-sm rounded-pill border" id="nav_pill_btn2" href="/team/slideTeamDetail">
										<small>내 팀</small>
									</a>
									&nbsp;
									<a class="text-main btn-sm rounded-pill border" id="nav_pill_btn3" href="/hsLogout">
										<small>로그아웃</small>
									</a>
								</sec:authorize>
							</div>
							<div class="menu-wrap">
								<a href="#"><img src="../resources/images/faq.svg" class="mCS_img_loaded">FAQ</a>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
		<div id="mCSB_1_scrollbar_vertical" class="mCSB_scrollTools mCSB_1_scrollbar mCS-minimal mCSB_scrollTools_vertical" style="display: none;">
			<div class="mCSB_draggerContainer">
				<div id="mCSB_1_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 0px; height: 0px; top: 0px;">
					<div class="mCSB_dragger_bar" style="line-height: 0px;">
					</div>
				</div>
				<div class="mCSB_draggerRail">
				</div>
			</div>
		</div>
	</nav>
	<nav id="sidebar2" class="mCustomScrollbar _mCS_1 mCS-autoHide mCS_no_scrollbar" style="overflow: visible;">
		여기가 알림을 넣는 곳입니다.
	</nav>
	<div class="overlay"></div>

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
	
	<!-- jQuery -->
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
	
	    // 사이드바 펼치기
		$("#sidebarCollapse").on("click", function(event) {
			if($("#sidebar").hasClass('active')) {
				$("#sidebar").removeClass('active');
				$(".overlay").removeClass('active');
			} else {
				$("#sidebar").addClass('active');
				$(".overlay").addClass('active');
			}
		})
		
		// 사이드바2 펼치기
		$("#sidebarCollapse2").on("click", function(event) {
			if($("#sidebar2").hasClass('active')) {
				$("#sidebar2").removeClass('active');
				$(".overlay").removeClass('active');
			} else {
				$("#sidebar2").addClass('active');
				$(".overlay").addClass('active');
			}
		})
		
		// 사이드바 접기
		$(".overlay").on("click", function(event) {
			$("#sidebar").removeClass('active');
			$("#sidebar2").removeClass('active');
			$(".overlay").removeClass('active');
		})
	
	$(document).ready(function () {
			let likeCnt = document.getElementById('likeCnt')
			let likeval = document.getElementById('likecheck').value
			let userId = document.getElementById('userId').value
			//let m_id = "${sessionScope.loginId}";
			let likeimg = document.getElementById("likeimg")
		
			console.log(likeval);
			
			if(userId != null) {
				
				function getLike(){
					// json 데이터를 얻어오는 로직 실행
					$.getJSON("/like/" + pono +"/"+userId, function(data){
						console.log(data);
						console.log(data.likecheck);
						let newLikecheck = data.likecheck;
						
						likeval = document.getElementById('likecheck').val(newLikecheck);
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
					      	url: '/like/' + userId,
					      
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
						          console.log('오타가 있나봐요')
					     	 }
					     	 
					  	}); // ajax END
	
			  		}); // img onclick END
						
			
			} // if END
			else {
				likeimg.src = "/resources/images/likepng.png";
			} // END else
	    // 좋아요 버튼을 클릭 시 실행되는 코드
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
  		
	
  		
  		
  }); //  document ready END
		
		
		
		
		
		
	</script>
	
	<!--comment script src -->
	<script src="/resources/comment/modalshow.js"></script>
	<script src="/resources/comment/commentAdd.js"></script>
	<script src="/resources/comment/modalclose.js"></script>
	<script src="/resources/comment/modify.js"></script>
	<script src="/resources/comment/delete.js"></script>	
</body>
</html>