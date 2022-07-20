<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- html 태그 내에 넣을 부분 -->
<!-- BootStrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Styles -->
<link rel="stylesheet" type="text/css" href="/resources/각 css 파일 경로.css">
<link rel="stylesheet" href="/resources/login/join.css">
<!-- 글씨체 -->
<link href="https://webfontworld.github.io/sandbox/SBAggro.css" rel="stylesheet">
<sec:authentication property="principal" var="prin"/>
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


	<!-- container START -->
	<div class="narrow-container mx-auto py-5" id="join-page">
		<h5 class="px-4 py-2">회원가입</h5>
		<div class="row">
			<div class="col">
				<form class="page-wrap" onsubmit="return fnJoin()">
					<div class="profile-wrap text-center">
						<div class="fileinput fileinput-new position-relative" data-provides="fileinput">
							<div class="fileinput-new thumbnail img-circle">
								<img src="/public_images/ranking/rank-profile.png">
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
							<img src="/public_images/svg/caution.svg" width="10">
							<small>150x150사이즈 권장</small>
						</div>
					</div>
					<div class="row-wrap mb-3">
						<div class="input-wrap">
							<label>아이디</label>
							<input class="form-control mt-1" type="text" name="userId" placeholder="아이디">
						</div>
					</div>
					<div class="row-wrap mb-3">
						<div class="input-wrap">
							<label>비밀번호</label>
							<input class="form-control mt-1" type="password" name="userPw" id="password" placeholder="비밀번호">
						</div>
					</div>
					<div class="row-wrap mb-3">
						<div class="input-wrap">
							<label>비밀번호 확인</label>
							<input class="form-control mt-1" type="password" name="userPw_chk" id="confirm_password" placeholder="비밀번호 확인">
						</div>
					</div>
					<div class="row-wrap mb-3">
						<div class="row no-gutters">
							<div class="input-wrap col-6">
								<label>이름</label>
								<input class="form-control mt-1" type="text" name="user_name" placeholder="이름">
							</div>
							<div class="input-wrap col-6">
								<label>성별</label>
								<div class="row py-1">
									<div class="col-6 form-check-radio radio-wrap wide-wrap">
									<label class="form-check-label" data-toggle="false" data-name="gender">
										<input class="form-check-input" type="radio" name="gender" value="male">
										<span class="form-check-sign">남성</span>
									</label>
									</div>
									<div class="col-6 form-check-radio radio-wrap wide-wrap">
										<label class="form-check-label" data-toggle="false" data-name="gender">
											<input class="form-check-input" type="radio" name="gender" value="female">
											<span class="form-check-sign">여성</span>
										</label>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row no-gutters row-wrap mb-3">
						<div class="col-4"><div class="select-group form-group mr-2">
							<label>생년월일</label>
							<select class="form-control" name="birth_y">
								<option value="2022">2022년</option>
								<option value="2021">2021년</option>
								<option value="2020">2020년</option>
								<option value="2019">2019년</option>
								<option value="2018">2018년</option>
								<option value="2017">2017년</option>
								<option value="2016">2016년</option>
								<option value="2015">2015년</option>
								<option value="2014">2014년</option>
								<option value="2013">2013년</option>
								<option value="2012">2012년</option>
								<option value="2011">2011년</option>
								<option value="2010">2010년</option>
								<option value="2009">2009년</option>
								<option value="2008">2008년</option>
								<option value="2007">2007년</option>
								<option value="2006">2006년</option>
								<option value="2005">2005년</option>
								<option value="2004">2004년</option>
								<option value="2003">2003년</option>
								<option value="2002">2002년</option>
								<option value="2001">2001년</option>
								<option value="2000">2000년</option>
								<option value="1999">1999년</option>
								<option value="1998">1998년</option>
								<option value="1997">1997년</option>
								<option value="1996">1996년</option>
								<option value="1995">1995년</option>
								<option value="1994">1994년</option>
								<option value="1993">1993년</option>
								<option value="1992" selected="">1992년</option>
								<option value="1991">1991년</option>
								<option value="1990">1990년</option>
								<option value="1989">1989년</option>
								<option value="1988">1988년</option>
								<option value="1987">1987년</option>
								<option value="1986">1986년</option>
								<option value="1985">1985년</option>
								<option value="1984">1984년</option>
								<option value="1983">1983년</option>
								<option value="1982">1982년</option>
								<option value="1981">1981년</option>
								<option value="1980">1980년</option>
								<option value="1979">1979년</option>
								<option value="1978">1978년</option>
								<option value="1977">1977년</option>
								<option value="1976">1976년</option>
								<option value="1975">1975년</option>
								<option value="1974">1974년</option>
								<option value="1973">1973년</option>
								<option value="1972">1972년</option>
								<option value="1971">1971년</option>
								<option value="1970">1970년</option>
								<option value="1969">1969년</option>
								<option value="1968">1968년</option>
								<option value="1967">1967년</option>
								<option value="1966">1966년</option>
								<option value="1965">1965년</option>
								<option value="1964">1964년</option>
								<option value="1963">1963년</option>
								<option value="1962">1962년</option>
								<option value="1961">1961년</option>
								<option value="1960">1960년</option>
								<option value="1959">1959년</option>
								<option value="1958">1958년</option>
								<option value="1957">1957년</option>
								<option value="1956">1956년</option>
								<option value="1955">1955년</option>
								<option value="1954">1954년</option>
								<option value="1953">1953년</option>
								<option value="1952">1952년</option>
								<option value="1951">1951년</option>
								<option value="1950">1950년</option>
								<option value="1949">1949년</option>
								<option value="1948">1948년</option>
								<option value="1947">1947년</option>
								<option value="1946">1946년</option>
								<option value="1945">1945년</option>
								<option value="1944">1944년</option>
								<option value="1943">1943년</option>
								<option value="1942">1942년</option>
								<option value="1941">1941년</option>
								<option value="1940">1940년</option>
								<option value="1939">1939년</option>
								<option value="1938">1938년</option>
								<option value="1937">1937년</option>
								<option value="1936">1936년</option>
								<option value="1935">1935년</option>
								<option value="1934">1934년</option>
								<option value="1933">1933년</option>
								<option value="1932">1932년</option>
								<option value="1931">1931년</option>
								<option value="1930">1930년</option>
								<option value="1929">1929년</option>
								<option value="1928">1928년</option>
							</select>
						</div>
					</div>
				<div class="col-4">
					<div class="select-group form-group mx-1">
						<label>&nbsp;</label>
							<select class="form-control" name="birth_m">
								<option value="1">1월</option>
								<option value="2">2월</option>
								<option value="3">3월</option>
								<option value="4">4월</option>
								<option value="5">5월</option>
								<option value="6">6월</option>
								<option value="7">7월</option>
								<option value="8">8월</option>
								<option value="9">9월</option>
								<option value="10">10월</option>
								<option value="11">11월</option>
								<option value="12">12월</option>
							</select>
						</div>
					</div>
				<div class="col-4">
					<div class="select-group form-group ml-2">
						<label>&nbsp;</label>
						<select class="form-control" name="birth_d">
							<option value="1">1일</option>
							<option value="2">2일</option>
							<option value="3">3일</option>
							<option value="4">4일</option>
							<option value="5">5일</option>
							<option value="6">6일</option>
							<option value="7">7일</option>
							<option value="8">8일</option>
							<option value="9">9일</option>
							<option value="10">10일</option>
							<option value="11">11일</option>
							<option value="12">12일</option>
							<option value="13">13일</option>
							<option value="14">14일</option>
							<option value="15">15일</option>
							<option value="16">16일</option>
							<option value="17">17일</option>
							<option value="18">18일</option>
							<option value="19">19일</option>
							<option value="20">20일</option>
							<option value="21">21일</option>
							<option value="22">22일</option>
							<option value="23">23일</option>
							<option value="24">24일</option>
							<option value="25">25일</option>
							<option value="26">26일</option>
							<option value="27">27일</option>
							<option value="28">28일</option>
							<option value="29">29일</option>
							<option value="30">30일</option>
							<option value="31">31일</option>
						</select>
					</div>
				</div>
			</div>
		<div class="row no-gutters mb-3">
			<div class="form-group">
				<label>휴대폰 번호</label>
				<div class="d-flex justify-content-between">
					<div class="input-wrap">
						<input class="form-control text-center my-0" type="tel" name="user_phone" value="010" maxlength="3">
					</div>
				<div class="my-auto mx-1">-</div>
					<div class="input-wrap">
						<input class="form-control text-center my-0" type="tel" name="phone1" maxlength="4">
					</div>
				<div class="my-auto mx-1">-</div>
				<div class="input-wrap">
					<input class="form-control text-center my-0" type="tel" name="phone2" maxlength="4">
				</div>
				<div class="input-wrap">
					<button class="btn btn-male rounded-pill text-nowrap m-0 ml-1" type="button" name="btnSendCertify">인증</button>
				</div>
			</div>
			<div class="text-caution">
				<img src="/public_images/svg/caution.svg" width="12">
				<small class="ml-2">최초 인증 받은 연락처로 매치 및 이벤트 알림이 발송되오니 바르게 작성해 주세요.</small>
			</div>
		</div>
	</div>
	<div class="row no-gutters mb-3">
		<div class="row-wrap">
			<button class="btn btn-main rounded-pill w-100 py-2" type="submit">
			 	<h4>회원가입</h4>
			 </button>
		 	<input type="hidden" name="sessionID">
		</div>
	</div>
</form>
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
	// 비밀번호 유효성 검사를 위해 id="password"인 속성의 값을 저장
	let password = document.getElementById("password")
	
		,confirm_password = document.getElementById("confirm_password");

	function validatePassword(){
		if(password.value != confirm_password.value) { // 만일 두 인풋 필드값이 같지 않을 경우
  		// setCustomValidity의 값을 지정해 무조건 경고 표시가 나게 하고
 		 confirm_password.setCustomValidity("Passwords Don't Match"); 
		} 
		else { // 만일 두 인풋 필드값이 같을 경우
  		// 오류가 없으면 메시지를 빈 문자열로 설정해야한다. 오류 메시지가 비어 있지 않은 한 양식은 유효성 검사를 통과하지 않고 제출되지 않는다.
 		 // 따라서 빈값을 주어 submit 처리되게 한다
  		confirm_password.setCustomValidity(''); 
		}
	} // validatePassword END
	
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

</script>
</html>
