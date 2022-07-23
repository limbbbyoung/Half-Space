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
<link rel="stylesheet" type="text/css" href="/resources/team/detail.css">
<!-- 글씨체 -->
<link href="https://webfontworld.github.io/sandbox/SBAggro.css" rel="stylesheet">
<sec:authentication property="principal" var="prin"/>
<head>
<meta charset="UTF-8">
<title>TeamDetail Page</title>
</head>
<body>
		<!-- header 태그 -->
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
	
			<div class="narrow-container mx-auto py-5" id="team-container">
				<h5 class="px-4 py-2">팀 정보</h5>
				<div class="team-wrap text-center">
					<div class="fileinput fileinput-new position-relative">
						<small>팀 로고 들어갈 자리</small>
						<div class="fileinput-new thumbnail img-circle">
							<img src="/resources/images/main_picture.jpg">
						</div>
					</div>
				</div><!-- team-wrap -->
			
				<div class="teamdetail-info">
					<div class="team-info">
						<div class="user-info-one">
							<a class="user-info-a">팀 이름</a>
							<h3 class="user-info">${myteam.name}</h3>
							<a class="user-info-a">창단일</a>
							<h5 class="user-info">${strRegDate}</h5>
						</div>
						<br/>
						<br/>
						<div class="user-info-two">
							<i class="">${myteam.name}의 상세정보</i><br/><hr/>
							<a class="user-info-a">팀원수</a>
							<h5 class="user-info">${listInMyteam.member_cnt}</h5>
							<a class="user-info-a">승</a>
							<h5 class="user-info">${myteam.win}</h5>
							<a class="user-info-a">무</a>
							<h5 class="user-info">${myteam.draw}</h5>
							<a class="user-info-a">패</a>
							<h5 class="user-info">${myteam.lose}</h5><br>
							<i class="">${myteam.name}의 소개</i><br/><hr/>
							${myteam.intro }
						</div>
					</div>
				</div>
				<sec:authorize access="isAuthenticated()">
					<c:if test="${prin.authorities eq '[ROLE_ADMIN]' || prin.username eq myteam.coach}">
						<div class="button1">
							<form action="/team/updateTeamForm" method="post">
								<input type="hidden" name="tno" value="${myteam.tno}"/>
								<input type="hidden" name="name" value="${myteam.name}"/>
								<input type="hidden" name="coach" value="${myteam.coach}"/>
								<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
								<button type="submit" class="btn">
								<h3><strong>팀 수정하기</strong></h3>
								</button>
							</form>
						</div>
						<div class="button2">
							<form action="/team/delete" method="post">
								<input type="hidden" name="tno" value="${myteam.tno}"/>
								<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
								<button type="submit" class="btn">
								<h3><strong>팀 삭제하기</strong></h3>
								</button>
							</form>
						</div>
					</c:if>
				<div class="button3">
					<form action="/notification/requestNotifi" method="post">
					<input type="hidden" name="target_mem_id" value="${prin.username}"/>
					<input type="hidden" name="mem_id" value="${myteam.coach}"/>
					<input type="hidden" name="TeamName" value="${myteam.name}"/>
					<input type="hidden" name="listno" value="${listInMyteam.listno}"/>
					<input type="hidden" name="page" value="${param.page}"/>
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					<button type="submit" class="btn" id="registerTeam">
					<h3><strong>팀 가입 신청하기</strong></h3>
					</button>
					</form>
				</div>
				</sec:authorize>
				<a class="btn" id="btn-filed" href="/team/teamlist?page=${param.page}&searchType=${param.searchType}&keyword=${param.keyword}" style="float:right; margin-top:10px;">목록으로 돌아가기</a>
				
				<!-- 첨부 파일 -->
			 	<div class="row">
			 		<h3 class="text-primary">첨부파일</h3>
			 		<div id="uploadResult">
			 			<ul>
			 				<!-- 첨부파일이 들어갈 위치 -->
			 			</ul>
			 		</div>
			 	</div><!-- row -->
			 	
			</div><!-- END narrow-container -->
	
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
		
		<script>
		
			// List를 가져오는 로직
			let tno = ${myteam.tno };
			console.log(tno);
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
			
			// 팀 가입 요청 버튼 클릭시
			$("#registerTeam").on("click", function(){
				alert("팀 가입 요청이 처리되었습니다.");
			}); 
		    
			// 익명함수 선언 및 호출
			// 우선 함수이기 때문에 호출한다는 점을 명시하기 위해 마지막에 ()를 추가로 붙여준다.
			// 파일 첨부 후 해당 글의 첨부된 파일의 데이터 가져오기
			(function(){
				$.getJSON("/team/getAttachList", {tno:tno}, function(arr){
					console.log(arr);
					
					let str = "";
					
					$(arr).each(function(i, attach){
						// image
						if(attach.fileType){
							let fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" +
									attach.uuid + "_" + attach.fileName);
							console.log(fileCallPath);
							
							str += `<li data-path='\${attach.uploadPath}' data-uuid='\${attach.uuid}'
										data-filename='\${attach.fileName}' data-type='\${attach.fileType}'>
										<div>
											<img src='/display?fileName=\${fileCallPath}'>
										</div>
									</li>`;
						} else { 
							str += `<li data-path='\${attach.uploadPath}' data-uuid='\${attach.uuid}'
										data-filename='\${attach.fileName}' data-type='\${attach.fileType}'>
										<div>
											<span>\${attach.fileName}</span><br>
											<img src='/resources/attach.png' width='100px' height='100px'>
										</div>
									</li>`;
						}
					}); // each 반복문 닫는 부분
					console.log(str);
					$("#uploadResult ul").html(str);
				}); // end getJSON
			})(); // end anonymous
			
			$("#uploadResult").on("click", "li", function(e){
				
				let liObj = $(this);
				
				let path = encodeURIComponent(liObj.data("path") + "/" + liObj.data("uuid")
						+ "_" + liObj.data("filename"));
				
					// download
					self.location = "/download?fileName=" + path;
			});
			
			</script>

</body>
</html>