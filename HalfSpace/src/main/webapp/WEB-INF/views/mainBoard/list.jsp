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
<link rel="stylesheet" href="/resources/css/styles.css">
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
					<img class="ml-3" src="../resources/images/halfspacelogo.png" width="70">
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
							<a class="text-main btn-sm rounded-pill border" id="nav_pill_btn1"href="/user/mypage">
								<strong>내 정보</strong>
							</a>
							<a class="text-main btn-sm rounded-pill border" id="nav_pill_btn2"href="/team/teamDetail">
								<strong>내 팀</strong>
							</a>
						</sec:authorize>
						<a class="px-3" id="sidebarCollapse" href="/user/mypage">
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
					<a href="#">QnA</a>
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
			 <table class="table table-hover" style="color: #48734A">
				<thead>
					<tr> 
						<th>글번호</th>
						<th>글제목</th>
						<th>글쓴이</th>
						<th>카테고리</th>
						<th>경기 날짜</th>
						<th>경기 장소</th>
						<th>쓴 날짜</th>
						<th>수정 날짜</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<c:forEach var="board" items="${boardList }">
							<tr>
							<td>${board.bno }</td>
							<td><a href="/mainBoard/detail?bno=${board.bno}&page=${pageMaker.cri.page}
							      &searchType=${pageMaker.cri.searchType}&keyword=${pageMaker.cri.keyword}">${board.title }[${board.replycount }]</a></td>
							<td>${board.writer }</td>
							<td>${board.catego }</td>
							<td>${board.gamedate }</td>
							<td>${board.gameplace }</td>
							<td>${board.regdate }</td>
							<td>${board.updatedate }</td>
							</tr>						
						</c:forEach>
					</tr>
				</tbody>
			</table>
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
				<img src="../resources/images/halfspacelogo.png" width="80">
			</a>
			<p class="mt-3">축구로 하나되는 공간</p>
			<div class="copyright">
				<p class="mb-3">Spring Project A조</p>
				서울특별시 마포구 백범로 23 3층<br/>
				임병영<br/>
				김동완<br/>
				신동호
				<p class="mb-4">대표 전화번호 010-9966-8908</p>
				<p>COPYRIGHT HalfSpace C&C ALL RIGHT RESERVED</p>
			</div>
		</div>
	</footer>
	<script type="text/javascript">
	    // 검색버튼 작동
		$('#searchBtn').on("click", function(event){
			
			self.location = "list"
				+ "?page=1"
				+ "&searchType="
				+ $('select option:selected').val()
				+ "&keyword=" + $('#keywordInput').val();
		});
	    
	  
	    
	</script>
</body>
</html>