<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- 웹사이트 배경 이미지 -->
<link rel="stylesheet" type="text/css" href="/resources/mainboard/list.css">
<head>
<meta charset="UTF-8">
<title>TeamList Page</title>
</head>
<body>
		<div class="header"></div><!-- .header -->
		<div class="container">
			<div class="row"></div><!-- .row -->
				<div class="col-6"></div><!-- .col-3 -->
				<div class="col-6">
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
									<td>${teamList.memberCnt}
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<form action="/team/teamCreateForm" method="post">
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
				</div><!-- .col-6 -->
		</div><!-- .container -->
		<div class="footer"></div><!-- .footer -->
</body>
</html>