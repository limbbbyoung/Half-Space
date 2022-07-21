<%@page import="org.springframework.security.core.Authentication"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<!-- BootStrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Styles -->
<link rel="stylesheet" href="/resources/login/join.css">
<!-- 글씨체 -->
<link href="https://webfontworld.github.io/sandbox/SBAggro.css" rel="stylesheet">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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


	<!-- id="join-page" narrow-container START -->
	<div class="narrow-container mx-auto py-5" id="join-page">
		<h5 class="px-4 py-2">회원가입</h5>
		<div class="row">
			<div class="col">
					<!--onsubmit="return fnJoin()"  -->
				<form class="page-wrap" action="/user/update" method="post">
					<div class="profile-wrap text-center">
						<div class="fileinput fileinput-new position-relative" data-provides="fileinput">
							<div class="fileinput-new thumbnail img-circle">
								<img src="/resources/images/main_picture.jpg">
							</div>
							<div class="fileinput-preview fileinput-exists thumbnail img-circle">
							</div>
							<div class="btn-photo-add">
								<span class="btn btn-round btn-icon btn-file btn-main btn-sm">
									<span class="fileinput-new">
										<i class="nc-icon nc-simple-add"></i>
									</span>
									<span class="fileinput-exists">
										<i class="nc-icon nc-settings"></i>
									</span>
										<input type="file" name="..." onchange="fnChangeFile(this)" data-src=""></span>
										<a class="btn btn-danger btn-round fileinput-exists d-none" href="#pablo" data-dismiss="fileinput">
											<i class="fa fa-times"></i>
										Remove</a>
							</div>
						</div>
						<div class="profile-desc text-caution d-flex justify-content-center">
							<img src="/resources/images/caution.svg" width="10">
							<small>150x150사이즈 권장</small>
						</div>
					</div>
					<div class="row-wrap mb-3">
						<div class="input-wrap">
							<label>아이디</label>
							<input class="form-control mt-1" type="text" name="userId" value="${user.userId}" id="userId" maxlength="20">
							<small>최대 20자</small>
						</div>
					</div>
					<div class="row-wrap mb-3">
						<div class="input-wrap">
							<label>비밀번호</label>
							<input class="form-control mt-1" type="password" name="userPw" id="password" value="${user.userPw}"maxlength="20">
							<small>최대 20자 특수문자 권장</small>
						</div>
					</div>
					<div class="row-wrap mb-3">
						<div class="input-wrap">
							<label>비밀번호 확인</label>
							<input class="form-control mt-1" type="password" name="userPw_chk" id="confirm_password" placeholder="비밀번호 확인" maxlength="20">
						</div>
					</div>
					<div class="row-wrap mb-3">
						<div class="row no-gutters">
							<div class="input-wrap col-6">
								<label>이름</label>
								<input class="form-control mt-1" type="text" name="userName" value="${user.userName}">
								<small>닉네임을 수정할 수 있어요</small>
							</div>
							<div class="input-wrap col-6">
								<label>성별</label>
								<c:choose>
					  				<c:when test="${user.gender eq 'Y'}">
										<div class="row py-1">
											<div class="col-6 form-check-radio radio-wrap wide-wrap">
											<label class="form-check-label" data-name="gender">
												<input class="form-check-input" type="radio" name="gender" value="Y" checked>
												<span class="form-check-sign">남성</span>
											</label>
											</div>
											<div class="col-6 form-check-radio radio-wrap wide-wrap">
												<label class="form-check-label" data-name="gender">
													<input class="form-check-input" type="radio" name="gender" value="N">
													<span class="form-check-sign">여성</span>
												</label>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<div class="row py-1">
											<div class="col-6 form-check-radio radio-wrap wide-wrap">
											<label class="form-check-label" data-name="gender">
												<input class="form-check-input" type="radio" name="gender" value="Y">
												<span class="form-check-sign">남성</span>
											</label>
											</div>
											<div class="col-6 form-check-radio radio-wrap wide-wrap">
												<label class="form-check-label" data-name="gender">
													<input class="form-check-input" type="radio" name="gender" value="N" checked>
													<span class="form-check-sign">여성</span>
												</label>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
		<div class="row-wrap mb-3">
			<div class="input-wrap">
				<label>생년월일</label>
				<input class="form-control mt-1" type="text" name="birthdate" value="${user.birthdate}">
			</div>
		</div>
		<div class="row-wrap mb-3">
			<div class="input-wrap">
				<label>이메일</label>
				<input class="form-control mt-1" type="text" name="email" value="${user.email}">
			</div>
		</div>
		<div class="row-wrap mb-3">
			<div class="input-wrap">
				<label>주소</label>
				<input class="form-control mt-1" type="text" name="address" value="${user.address}">
			</div>
		</div>
		<div class="row-wrap mb-3">
			<div class="input-wrap">
				<label>휴대폰</label>
				<input class="form-control mt-1" type="text" name="phoneNum" value="${user.phoneNum}">
			</div>
		</div>
		<div class="row no-gutters mb-3">
			<div class="row-wrap">
				<button class="btn btn-success w-100 py-3 mt-3 mb-1 rounded" id="submitBtn" type="submit">
					<h3 class="font-weight-normal">내 정보 수정</h3>
				</button>
				<input type="hidden" name="role" value="${prin.authorities}">
		 		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
			</div>
		</div>
	</form> <!-- form END -->
	<a href="javascript:history.go(-1);"><strong>뒤로가기</strong></a>
	
</div> <!-- div class col -->

</div> <!-- join page -->

</div>









<!-- container END -->
<!-- footer 태그 -->

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

<!-- navbar(선택) -->

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
									<a class="text-main btn-sm rounded-pill border" id="nav_pill_btn2" href="/team/teamDetail">
										<small>내 팀</small>
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
	
</body>
<script type="text/javascript">
	// csrf 토큰
	let csrfHeaderName = "${_csrf.headerName}"
	let csrfTokenValue="${_csrf.token}"
	
	
	// 앞으로 사용할 변수 저장
	let userId = document.getElementById("userId");
		
	let phoneNum = document.getElementById("phoneNum1") + document.getElementById("phoneNum2")
						+	document.getElementById("phoneNum3");

	let strBirthDate = document.getElementById("birthdate_y") + document.getElementById("birthdate_m")
						+ document.getElementById("birthdate_d");
		
	

	// 비밀번호 유효성 검사를 위해 id="password"인 속성의 값을 저장
	let password = document.getElementById("password");
	
	let confirm_password = document.getElementById("confirm_password");

	$("#submitBtn").on("click", function(event){
		if(password.value != confirm_password.value) { // 만일 두 인풋 필드값이 같지 않을 경우
  		// setCustomValidity의 값을 지정해 무조건 경고 표시가 나게 하고
 		 confirm_password.setCustomValidity("비밀번호 확인이 일치하지 않습니다."); 
 			window.alert("비밀번호를 확인해주세요");
 			return false;
		} 
		
        if(password.length < 6 || password.length>=20){
        	password.value='';
        	password.setCustomValidity("비밀번호 확인이 일치하지 않습니다.");
        	window.alert("비밀번호는 6글자 이상 20자 이하로 작성해주세요");
            return false;
        }
		else { // 만일 두 인풋 필드값이 같을 경우
  		// 오류가 없으면 메시지를 빈 문자열로 설정해야한다. 오류 메시지가 비어 있지 않은 한 양식은 유효성 검사를 통과하지 않고 제출되지 않는다.
 		 // 따라서 빈값을 주어 submit 처리되게 한다
  		confirm_password.setCustomValidity(''); 
		return true;
		}
	}); // validatePassword END
	
	password.onchange = validatePassword;
	confirm_password.onkeyup = validatePassword;
	// 여기까지 패스워드 로직
	
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
	
	$(document).ready(function(){
			
			// 정규표현식 : 예).com 끝나는 문장 등의 조건이 복잡한 문장을 컴퓨터에게 이해시키기 위한 구문
			let regex = new RegExp("(.*)\.(exe|sh|zip|alz)$");
								// 파일이름 .  exe|sh|zip|alz 인 경우를 체크함
			let maxSize =5242880; // 5Mb
			
			function checkExtension(fileName, fileSize){
				// 파일크기 초과시 종료시킴
				if(fileSize >= maxSize){
					alert("파일 사이즈 초과");
					return false;// return이 있어서 아래쪽 구문은 실행 안됨
				}
				// regex에 표현해둔 정규식과 일치하는지 여부를 체크, 일치하면 true, 아니면 false
				if(regex.test(fileName)){
					alert("해당 확장자를 가진 파일은 업로드할 수 없습니다.");
					return false;
				}
				return true;
			}
	}); // document.ready END
	

		


</script>

<script src="/resources/login/joinDoubleCheck.js"></script>
</html>
