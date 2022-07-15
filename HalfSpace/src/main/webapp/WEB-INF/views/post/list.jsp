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
<!-- 웹사이트 배경 이미지 -->
<link rel="stylesheet" type="text/css" href="/resources/post/list.css">
<head>
<meta charset="UTF-8">
<title>postList</title>
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
			<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-chat-heart" viewBox="0 0 16 16">
			  <path fill-rule="evenodd" d="M2.965 12.695a1 1 0 0 0-.287-.801C1.618 10.83 1 9.468 1 8c0-3.192 3.004-6 7-6s7 2.808 7 6c0 3.193-3.004 6-7 6a8.06 8.06 0 0 1-2.088-.272 1 1 0 0 0-.711.074c-.387.196-1.24.57-2.634.893a10.97 10.97 0 0 0 .398-2Zm-.8 3.108.02-.004c1.83-.363 2.948-.842 3.468-1.105A9.06 9.06 0 0 0 8 15c4.418 0 8-3.134 8-7s-3.582-7-8-7-8 3.134-8 7c0 1.76.743 3.37 1.97 4.6a10.437 10.437 0 0 1-.524 2.318l-.003.011a10.722 10.722 0 0 1-.244.637c-.079.186.074.394.273.362a21.673 21.673 0 0 0 .693-.125ZM8 5.993c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132Z"/>
			</svg>
			자유게시판</h1>
			<table class="table table-hover" style="color :  #48734A;">
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>쓴날짜</th>
						<th>수정날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="post" items="${postList}">
						<tr>
							<td>${post.pono}</td>
							<td><a href="/post/detail?page=${pageMaker.cri.page}&pono=${post.pono}&searchType=${pageMaker.cri.searchType}&keyword=${pageMaker.cri.keyword}">${post.title }[${post.commentCnt}]</a></td>
							<td>${post.writer}</td>
							<td>${post.regDate}</td>
							<td>${post.updateDate}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<sec:authorize access="isAuthenticated()">
				<a class="btn" href="/post/insert" id="btn-filed">글 쓰기</a>
			</sec:authorize>
			<!-- pagination start -->
			<ul class="pagination my justify-content-center">
				 <!-- Prev -->
				 <c:if test="${pageMaker.prev }">
					<li class="page-item">
				      <a class="page-link" href="/post/list?page=${pageMaker.startPage -1}&searchType=${pageMaker.cri.searchType}&keyword=${pageMaker.cri.keyword}" aria-label="Prev">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				 </c:if>
		
				 <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pNum">								
				 	<li class="page-item ${pNum eq pageMaker.cri.page ? 'active' : '' }">
				 		<a class="page-link" href="/post/list?page=${pNum }&searchType=${pageMaker.cri.searchType}&keyword=${pageMaker.cri.keyword}">${pNum }</a>
				 	</li>
				 </c:forEach>
				 <!-- Next -->
				 <c:if test="${pageMaker.next }">
				     <li class="page-item">
				      <a class="page-link" href="/post/list?page=${pageMaker.endPage +1}&searchType=${pageMaker.cri.searchType}&keyword=${pageMaker.cri.keyword}" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				 </c:if>
			</ul>
		</div><!-- .row 끝나는 지점 -->
		<div class="row">
			<div class="box-body" style="text-align: center">
				<!-- 검색 start -->
				<select name="searchType">
					<option value="n" ${pageMaker.cri.searchType == null ? 'selected' : '' }>
					-
					</option>
					<option value="t" ${pageMaker.cri.searchType == 't' ? 'selected' : '' }>
					제목
					</option>
					<option value="c" ${pageMaker.cri.searchType == 'c' ? 'selected' : '' }>
					본문
					</option>
					<option value="w" ${pageMaker.cri.searchType == 'w' ? 'selected' : '' }>
					글쓴이
					</option>
					<!-- catego -->
					<option value="ca" ${pageMaker.cri.searchType == 'ca' ? 'selected' : '' }>
					카테고리
					</option>
					<option value="tcwca" ${pageMaker.cri.searchType == 'tcwca' ? 'selected' : '' }>
					제목 + 본문 + 글쓴이
					</option>
				</select>
				
				<input type="text" name="keyword" id="keywordInput" 
					value="${pageMaker.cri.keyword }">
				<button class="btn" id="searchBtn">Search</button>
			</div><!-- .box-body  -->
		</div><!-- .row 끝나는 지점 -->
	</div><!-- .container  -->
	<div class="footer">
	</div><!-- .footer 끝나는 지점 -->
	<!-- 검색 script -->
	<script>
		$(document).ready(function(){
			
			
			
		});
	
	
	
		//검색버튼 작동
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