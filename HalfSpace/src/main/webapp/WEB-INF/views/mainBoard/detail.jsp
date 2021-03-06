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
<!-- Styles -->
<link rel="stylesheet" type="text/css" href="/resources/mainboard/detail.css">
<link rel="stylesheet" href="/resources/reply/modal.css">
<link href="https://webfontworld.github.io/sandbox/SBAggro.css" rel="stylesheet">
<sec:authentication property="principal" var="prin"/>
<head>
<meta charset="UTF-8">
<title>boardDetail</title>
</head>
<body>
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
					<a class="active" href="/mainBoard/list">소셜매치</a>
					<a href="/post/list">자유게시판</a>
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
					<h2>${board.title}</h2>
					<p class="parking-wrap">
						<small data-gender="3">${board.regdate.getMonth() + 1}월 ${board.regdate.getDate()}일 등록</small>
						<small>${board.updatedate.getMonth() + 1}월 ${board.updatedate.getDate()}일 수정</small>
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
							${board.catego}
						</strong>
						<h3 class="ground-name">
							${board.gameplace}
						</h3>
						<div style="width : 100%">
							<div class="parking-wrap" style="float:left;">
								<strong class="pl" data-gender="3">
									${board.gamedate.getMonth() + 1}월 ${board.gamedate.getDate()}일 경기
								</strong>
							</div>
							<div class="apply-wrap" style="float:right;">
							 	<sec:authorize access="isAuthenticated()">
									<c:if test="${prin.authorities eq '[ROLE_ADMIN]' || prin.username eq board.writer}">
										<div style="float:right;">
										 	<form action="/mainBoard/delete" method="post">
											 	<input type="hidden" value="${board.bno }" name="bno">
											 	<input type="hidden" name="page" value="${param.page }">
												<input type="hidden" name="searchType" value="${param.searchType}">
												<input type="hidden" name="keyword" value="${param.keyword}">
											 	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
											 	<button type="submit" class="btn" id="btn-filed">삭제</button>
										 	</form>
										 </div>
										 <div style="float:right; width: 60px;">
										 	<form action="/mainBoard/updateForm" method="post">
											 	<input type="hidden" value="${board.bno }" name="bno">
											 	<input type="hidden" name="page" value="${param.page }">
											    <input type="hidden" name="searchType" value="${param.searchType}">
											    <input type="hidden" name="keyword" value="${param.keyword}">
											 	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
											 	<button type="submit" class="btn" id="btn-filed">수정</button>
										 	</form>
										 </div>
									 </c:if>
							 	</sec:authorize>
							</div>
						</div>
					</div>
				</div>
				<div class="profile" style="width : 100%">
					<img src="../resources/images/soccer_zone.jpg" style="float:left;">
					<div style="float:left;">
						${board.writer}
					</div>
				</div>
				<div class="gameContent">
				 	<p>${board.content}</p><br/>
				</div>
 			</div><!-- .col 끝나는 지점 -->
 			<div>
			 	<sec:authorize access="isAuthenticated()">
					<div class="row box-box-success" style="width: 100%; padding: 20px; margin: auto;">
						<div class="box-header">
							<h2 style="color: #244875; text-align: left;" id="newReplyCount">${board.replycount}개의 댓글</h2>
						</div><!-- header -->
						<div class="box-body">
							<input type="text" name="reply" id="newReplyText" class="form-control" placeholder="여기에 댓글을 작성하세요.">
						</div><!-- body -->
						<div class="box-footer" style="margin-top: 15px; text-align: right;">
					        <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
					        <input type="hidden" name="replyer" id="newReplyWriter" class="form-control" value="<sec:authentication property="principal.Username"/>">
					        <button type="button" id="replyAddBtn" class="btn btn-primary">댓글 작성</button>
						</div><!-- footer -->
					</div>
				</sec:authorize>
				
				<!-- 댓글 -->
			 	<ul id="replies">
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
			<input type="text" id="replyText">
		</div>
		<sec:authorize access="isAuthenticated()">
			<c:if test="${prin.authorities eq '[ROLE_ADMIN]' || prin.username eq board.writer}">
				<button type="button" id="replyModBtn">수정하기</button>
				<button type="button" id="replyDelBtn">삭제하기</button>
			</c:if>
			<button type="button" id="closeBtn">닫기</button>
		</sec:authorize>
	</div>
	 	
 	<!-- jquery는 이곳에 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- 댓글 목록을 가져오는 JS파일 첨부 -->
	<script src="/resources/reply/getAllList.js"></script>
	
 	<script type="text/javascript">
		
 		let csrfHeaderName = "${_csrf.headerName}"
		
		let csrfTokenValue= "${_csrf.token}"
 		
			// List를 가져오는 로직
			let bno = ${board.bno };
			function getAllList(){
				// json 데이터를 얻어오는 로직 실행
				$.getJSON("/replies/all/" + bno, function(data){
					
					let str = "";
					console.log(data.length);
					
					$(data).each(
							function(){					
								// 백틱 문자열 사이에 변수를 넣고 싶다면 \${변수명}을 적습니다.
								// 원래는 \를 왼쪽에 붙일 필요는 없지만
								// jsp에서는 el표기문법이랑 겹치기 때문에 el이 아님을 보여주기 위해
								// 추가로 왼쪽에 \를 붙입니다.
								
								// UNIX 시간을 우리가 알고 있는 형식으로 바꿔보겠습니다.
								let timestamp = this.updateDate;
								// UNIX 시간이 저장된 timestamp를 Date 생성자로 변환합니다.
								let date = new Date(timestamp);
								// 변수 formattedTime에 변환된 시간을 저장해 출력해보겠습니다.
								let formattedTime = `게시일 : 
													\${date.getFullYear()}년
												    \${(date.getMonth()+1)}월
													\${date.getDate()}일`;
													console.log(this.reply_content);
								str += `<div class='replyLi' data-rno='\${this.rno}'>
										<strong>@\${this.replyer}</strong> - \${formattedTime} <br/>
										<div class="replyText"> \${this.reply_content} </div> 
										<button type='button' class='btn btn-info'>수정/삭제</button>
										</div>`;
						});
					console.log(str);
					$("#replies").html(str);
				});
			}
			getAllList();
			
			// 이벤트 위임 
			// 1. ul#replies가 이벤트를 걸고 싶은 버튼 전체의 집합이므로 먼저 집합 전체에 이벤트를 겁니다.
			// 2. #replies의 하위 항목 중 최종 목표 태그를 기입해줍니다.
			// 3. 단, 여기서 #replies와 button 사이에 다른 태그가 끼어있다면 경유하는 형식으로 호출해도 됩니다.
			$("#replies").on("click", ".replyLi button", function(){ // .on(동작, 지정 태그(ul->li->button), 기능(function))
				// 4. 콜백함수 내부의 this는 내가 클릭한 button이 됩니다.
				// 1. prev().prev()... 등과 같이 연쇄적으로 prev, next를 걸어서 고르기
				// 2. prev("태그선택자")를 써서 뒤쪽이나 앞쪽 형제 중 조건에 맞는것만 선택
				// 3. siblings("태그선택자")는 next, prev 모두를 범위로 조회합니다.
				let reply_content = $(this).parent(); // this 키워드를 내부에서 쓸려면 화살표 함수를 쓰면 안됨
				// this는 해당 버튼을 지정, 따라서 버튼의 부모태그는 <li>이다.
				
				// attr() : attribute, attr("태그 내 속성명") => 해당 속성에 부여된 값을 가져옵니다.
				// ex) <li data-rno="33"> => rno에 33을 저장해줍니다. data-rno는 태그 내부에 rno 데이터를 저장한다는 의미.
				let rno = reply_content.attr("data-rno");
				$(".modal-title").html(rno);
				reply_content = $(this).prev(".replyText");
				let replytext = reply_content.text(); // .text()는 태그 안에 있는 모든 텍스트를 다 가져옴
				
				$("#replyText").val(replytext);
				$("#modDiv").show("slow");
				// 화면 기능을 구성할 때 원하는 태그만을 골라서 디테일하게 기능을 구현하는데 있어서
				// 어려움을 느낄 것으로 예상, 그러므로 이 점에 집중해서 화면단 기능 구성
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
			
 	</script>
 	
 	<!-- modal 기능들 -->
	<script src="/resources/reply/insert.js"></script>
 	<!-- delete 기능 -->
	<script src="/resources/reply/delete.js"></script>
	<!-- update 기능 -->
	<script src="/resources/reply/modify.js"></script>
	<!-- close 기능 -->
	<script src="/resources/reply/modalclose.js"></script>
	
</body>
</html>