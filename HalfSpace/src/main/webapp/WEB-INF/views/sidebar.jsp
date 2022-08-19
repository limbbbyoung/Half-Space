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
<link rel="stylesheet" type="text/css" href="/resources/basic/basic.css">
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
							<div class="menu-wrap">
								<a href="/tree"><img src="../resources/images/faq.svg" class="mCS_img_loaded">2022 하프스페이스컵</a>
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