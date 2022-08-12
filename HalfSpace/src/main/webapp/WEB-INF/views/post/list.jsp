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
<link rel="stylesheet" type="text/css" href="/resources/post/list.css">
<link rel="stylesheet" href="/resources/reply/modal.css">
<!-- 글씨체 -->
<link href="https://webfontworld.github.io/sandbox/SBAggro.css" rel="stylesheet">
<sec:authentication property="principal" var="prin"/>
<head>
<meta charset="UTF-8">
<title>postList</title>
</head>
<body>
	<jsp:include page="../header.jsp" flush="true" />
	<jsp:include page="../sidebar.jsp" flush="true" />

	<!-- body start -->
	<div class="container">
		<div class="row">
			<div class="header-wrap px-4">
				<h2>자유게시판</h2>
			</div>

			<ul class="list-group list-group-flush text-center">
				<c:forEach var="info" items="${infoList}">
				<a href="/post/detail?page=${pageMaker.cri.page}&pono=${info.pono}&searchType=${pageMaker.cri.searchType}&keyword=${pageMaker.cri.keyword}">
				
					<li class="list-group-item">
						<div class="time-wrap">
							<img src="/resources/images/main_picture.jpg">
						</div>
						<div class="match-wrap">
							<div class="gender-icon d-none" data-gender="3" data-battle="false">
							</div>
							<div class="ground-wrap">
								<div style="width: 100%; padding-left: 10px;">
									<div style="float:left;">
										<small class="game-badge" data-game="num">${info.pono}</small>
									</div>
									<div style="float:left; margin-left:1.5%">
										<small class="game-badge" data-game="${info.catego}">${info.catego}</small>
									</div>
								</div>
								<p>
									<strong class="ground-name">
										${info.title} [${info.commentCnt}]
									</strong>
								</p>
								<p class="parking-wrap">
									<small data-gender="3">${info.writer}</small>
									<small>${info.regDate}</small>
								</p>
							</div>
						</div>
						<div class="apply-wrap" data-status="full">
							<p>
								조회수<br>
								${info.hit}
							</p>
							<c:if test="${info.hit >= 10}">
							<span>
								Hit
							</span>
							</c:if>
						</div>
					</li>
				
				</a>
				</c:forEach><!-- 공지글 -->
				
				<c:forEach var="post" items="${postList}">
				<a href="/post/detail?page=${pageMaker.cri.page}&pono=${post.pono}&searchType=${pageMaker.cri.searchType}&keyword=${pageMaker.cri.keyword}">
				<c:if test="${post.catego != '공지'}">
					<li class="list-group-item">
						<div class="time-wrap">
							<img src="/resources/images/main_picture.jpg">
						</div>
						<div class="match-wrap">
							<div class="gender-icon d-none" data-gender="3" data-battle="false">
							</div>
							<div class="ground-wrap">
								<div style="width: 100%; padding-left: 10px;">
									<div style="float:left;">
										<small class="game-badge" data-game="num">${post.pono}</small>
									</div>
									<div style="float:left; margin-left:1.5%">
										<small class="game-badge" data-game="${post.catego}">${post.catego}</small>
									</div>
								</div>
								<p>
									<strong class="ground-name">
										${post.title} [${post.commentCnt}]
									</strong>
								</p>
								<p class="parking-wrap">
									<small data-gender="3">${post.writer}</small>
									<small>${post.regDate}</small>
								</p>
							</div>
						</div>
						<div class="post-wrap">
							<div class="apply-wrap" data-status="full">
								<p>
									조회수<br>
									${post.hit}
								</p>
								<c:if test="${post.hit >= 10}">
								<span>
									Hit
								</span>
								</c:if>
							</div>
							<div class="apply-wrap" data-status="full">
								<p class="inline-block">
									좋아요<br>
									${post.likeCnt}
								</p>
								<c:if test="${post.likeCnt >= 10}">
								<span>
									Hit
								</span>
								</c:if>
							</div>
						</div>
					</li>
				</c:if>
				</a>
				</c:forEach><!-- 일반글 -->
			</ul>
			<sec:authorize access="isAuthenticated()">
				<a class="btn w-100" href="/post/insert" id="btn-filed">글쓰기</a>
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
				<select name="searchType" class="selectpicker">
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
					모든 내용
					</option>
				</select>
				<input type="text" name="keyword" id="keywordInput" value="${pageMaker.cri.keyword }">
				<button class="btn" id="searchBtn">Search</button>
			</div><!-- .box-body  -->
		</div><!-- .row 끝나는 지점 -->
	</div><!-- .container  -->
	
	<jsp:include page="../footer.jsp" flush="true" />

	<script>

	</script>
	
	<!-- sidebar 기능-->
	<script src="/resources/basic/sideBar.js"></script>
</body>
</html>