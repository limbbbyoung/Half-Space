<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- 웹사이트 배경 이미지 -->
<link rel="stylesheet" type="text/css" href="/resources/team/list.css">
<head>
<meta charset="UTF-8">
<title>TeamList Page</title>
</head>
<body>
		<div class="header">
			<nav class="navbar">
			  <div class="container-fluid">
			    <a class="navbar-brand" href="/mainBoard/welcomeHome"><img src="../resources/images/halfspacelogo.png" alt="" width="334" height="110" class="d-inline-block align-text-top">
			    </a>
			     <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			      <span class="navbar-toggler-icon"></span>
			    </button>
			    <div class="collapse navbar-collapse" id="navbarNav">
			      <ul class="navbar-nav">
			        <li class="nav-item">
			          <a class="nav-link active" aria-current="page" href="/mainBoard/welcomeHome">Home</a>
			        </li>
			      </ul>
			    </div>
			    <form class="d-flex">
			      <!-- 
			      <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
			      <button class="btn btn-outline-success" type="submit">Search</button>
			       -->
			    </form>
			  </div>
			</nav>
		</div><!-- .header -->
		<div class="container">
			<div class="row">
					<h1>
					<svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
					  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
					</svg>
					팀 목록</h1>
					<table class="table table-hover" style="color :  #48734A;">
						<thead>
							<tr>
								<th>이름</th>
								<th>감독</th>
								<th>총원</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="teamList" items="${teamList}">
								<tr>
									<td><a href="/team/teamDetail?page=${pageMaker.cri.page}&listno=${teamList.listno}&searchType=${pageMaker.cri.searchType}&keyword=${pageMaker.cri.keyword}">${teamList.name}</a></td>
									<td>${teamList.coach}</td>
									<td>${teamList.member_cnt}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<form action="/team/teamCreateForm" method="get">
							<input type="hidden" name="listno" value="${myteam.listno}"/>
							<button type="submit" class="btn" id="btn-filed">팀 창단하기</button>
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					</form>
					
						<ul class="pagination my justify-content-center">
						<!-- Prev -->
						<c:if test="${pageMaker.prev }">
							<li class="page-item">
								<a class="page-link" href="/team/teamlist?page=${pageMaker.startPage - 1 }
								&searchType=${pageMaker.cri.searchType }&keyword=${pageMaker.cri.keyword}" aria-lable="Prev">
									<span aria-hidden="true">&laquo;</span>
								</a>
							</li>
						</c:if>
						<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pNum">
							<li class="page-item 
								<c:out value="${pageMaker.cri.page == pNum ? 'active' : '' }"/>">
								<a class="page-link"
									href="/team/teamlist?page=${pNum }&searchType=${pageMaker.cri.searchType }&keyword=${pageMaker.cri.keyword}">
									${pNum }
								</a>
							</li>	
						</c:forEach>
						<!-- Next -->
						<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
							<li class="page-item">
								<a class="page-link"
									href="/team/teamlist?page=${pageMaker.endPage + 1}&searchType=${pageMaker.cri.searchType }&keyword=${pageMaker.cri.keyword}">
									&raquo;	
								</a>
							</li>
						</c:if>
					</ul><!-- 페이지네이션 ul 태그 -->	
				</div><!-- .row -->
		</div><!-- .container -->
		<div class="footer">
		<div class="row">
			<div class="col-4"></div><!-- .col -->
			<div class="col-4" style="text-align: center;">
				<img src="../resources/images/halfspacelogo.png" alt="halfspaceLogo" width="254" height="80" class="d-inline-block align-text-top">
			    <br/>
			    <p>Spring Project A조<br/>
				임병영<br/>
		        김동완<br/>
		        신동호<br/>
			    | 서울특별시 마포구 백범로 23 3층<br/> 
			    | 대표 전화번호 010-0000-0000<br/>
				<b>COPYRIGHT HalfSpace C&C ALL RIGHT RESERVED</b></p>
			</div><!-- .col -->
			<div class="col-4"></div><!-- .col -->
		</div><!-- .row -->
	</div><!-- .footer 끝나는 지점 -->
</body>
</html>