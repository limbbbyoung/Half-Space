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
<link rel="stylesheet" type="text/css" href="/resources/mainboard/list.css">
<link href="https://webfontworld.github.io/sandbox/SBAggro.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>boardList</title>
<style>
</style>
</head>
<body>
<!-- header start -->
	<div class="header">
		<div class="navi-container">
			<div class="d-flex justify-content-between align-items-center mx-auto p-0" style="max-width:800px">
				<a href="/mainBoard/welcomeHome">
					<img class="ml-3" src="../resources/images/LogoMakr-5Syrbv.png" width="70">
				</a>
				<div class="user-info-container">
					<input id="isLoggedIn" type="hidden" data-islogin="false">
					<div class="user-info-wrap">
						<sec:authorize access="isAnonymous()">
							<a class="text-main btn-sm btn-neutral" href="/login/join">
								<strong>회원가입</strong>
							</a>
							<a class="text-main btn-sm rounded-pill border" href="/login/user">
								<strong>로그인</strong>
							</a>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<a class="text-main btn-sm btn-neutral" href="#">
								<strong>
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
									  <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
									</svg>
								</strong>
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
	</div>
	<!-- header END -->
	
	<!-- body start -->
	<div class="container">
		<div class="row">
			<h1>
			<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
			  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
			</svg>
			매칭 글 목록</h1>
			<div class="root-container">
			<div class="match-list-container">
			<div class="container p-0 mb-5" id="match-list">
				<div class="ground-list-slider">
					<section class="ground-list">
						<ul class="list-group list-group-flush text-center">
							<c:forEach var="board" items="${boardList}">
								<li class="list-group-item">
									<div class="time-wrap">
										<p>${board.gamedate}</p>
										<small>09:00</small>
									</div>
									<div class="match-wrap">
										<div class="gender-icon d-none" data-gender="3" data-battle="false">
										</div>
										<div class="ground-wrap">
											<small class="game-badge" data-game="rank">${board.bno}</small>
											<p>
												<strong class="ground-name">${board.title}</strong>
											</p>
											<p class="parking-wrap">
												<small data-gender="3">${board.catego}</small>
												<small>${board.regdate}</small>
											</p>
										</div>
									</div>
									<div class="apply-wrap" data-status="full">
										<span>
											조회수
										</span>
										<p>${board.hit}</p>
									</div>
								</li>					
							</c:forEach>
						</ul>
					</section>
				</div>
			</div>
			</div>
			</div>
			<sec:authorize access="isAuthenticated()">
				<a class="btn" href="/mainBoard/insert" id="btn-filed">글쓰기</a>
			</sec:authorize>
			<ul class="pagination my justify-content-center">
				<!-- Prev -->
				<c:if test="${pageMaker.prev }">
					<li class="page-item">
						<a class="page-link" href="/mainBoard/list?page=${pageMaker.startPage - 1 }
						&searchType=${pageMaker.cri.searchType }&keyword=${pageMaker.cri.keyword}" aria-lable="Prev">
							<span aria-hidden="true">&laquo;</span>
						</a>
					</li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }"
						var="pNum">
					<li class="page-item 
						<c:out value="${pageMaker.cri.page == pNum ? 'active' : '' }"/>">
						<a class="page-link"
							href="/mainBoard/list?page=${pNum }&searchType=${pageMaker.cri.searchType }&keyword=${pageMaker.cri.keyword}">
							${pNum }
						</a>
					</li>	
				</c:forEach>
				<!-- Next -->
				<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
					<li class="page-item">
						<a class="page-link"
							href="/mainBoard/list?page=${pageMaker.endPage + 1}&searchType=${pageMaker.cri.searchType }&keyword=${pageMaker.cri.keyword}">
							&raquo;	
						</a>
					</li>
				</c:if>
			</ul>
		</div><!-- .row 끝나는 지점 -->
		<div class="row">
			<div class="box-body" style="text-align: center">
				<select name="searchType" class="selectpicker">
				<option value="n"
					<c:out value="${pageMaker.cri.searchType == 'n' ? 'selected' : '' }"/>>
						-
					</option>
					<!-- title 선택 -->
					<option value="t"
					<c:out value="${pageMaker.cri.searchType == 't' ? 'selected' : '' }"/>>
						제목
					</option>
					<!-- writer 선택 -->
					<option value="w"
					<c:out value="${pageMaker.cri.searchType == 'w' ? 'selected' : '' }"/>>
						글쓴이
					</option>
					<!--g = gameDate  -->
					<option value="g"
					<c:out value="${pageMaker.cri.searchType == 'g' ? 'selected' : '' }"/>>
						경기날짜
					</option>
					<!-- p =gamePlace -->
					<option value="p"
					<c:out value="${pageMaker.cri.searchType == 'p' ? 'selected' : '' }"/>>
						경기장소
					</option>
					<option value="twgp"
					<c:out value="${pageMaker.cri.searchType == 'twgp' ? 'selected' : '' }"/>>
						모든내용
					</option>
				</select>
				<input type="text" name="keyword" id="keywordInput" 
					value="${pageMaker.cri.keyword }">
				<button class="btn" id="searchBtn">Search</button>
			</div><!-- .box-body  -->
		</div><!-- .row  -->
	</div><!-- .container  -->

	<!-- footer start -->
	<footer class="footer">
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
	</footer>
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
									<a class="text-main btn-sm rounded-pill border" id="nav_pill_btn1"href="/user/mypage">
										<small>내 정보</small>
									</a>
									<a class="text-main btn-sm rounded-pill border" id="nav_pill_btn2"href="/team/teamDetail">
										<small>내 팀</small>
									</a>
								</sec:authorize>
							</div>
							<div class="menu-wrap">
								<a href="#"><img src="../resources/images/faq.svg" class="mCS_img_loaded">FAQ</a>
							</div>
						</div>
					</section>
					<section>
					</section>
				</div>
			</div>
		</div>
		<div id="mCSB_1_scrollbar_vertical" class="mCSB_scrollTools mCSB_1_scrollbar mCS-minimal mCSB_scrollTools_vertical" style="display: none;">
			<div class="mCSB_draggerContainer"><div id="mCSB_1_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 0px; height: 0px; top: 0px;">
				<div class="mCSB_dragger_bar" style="line-height: 0px;">
				</div>
			</div>
			<div class="mCSB_draggerRail">
			</div>
			</div>
		</div>
	</nav>
	<div class="overlay"></div>
	<script type="text/javascript">
	    // 검색버튼 작동
		$('#searchBtn').on("click", function(event){
			
			self.location = "list"
				+ "?page=1"
				+ "&searchType="
				+ $('select option:selected').val()
				+ "&keyword=" + $('#keywordInput').val();
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
		
		// 사이드바 접기
		$(".overlay").on("click", function(event) {
			$("#sidebar").removeClass('active');
			$(".overlay").removeClass('active');
		})
	</script>
	<script src="https://www.gstatic.com/firebasejs/7.15.5/firebase-app.js"></script>
	<script src="https://www.gstatic.com/firebasejs/7.15.5/firebase-analytics.js"></script>
</body>
</html>

