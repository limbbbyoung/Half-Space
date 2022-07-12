<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<table class="table table-hover" style="color :  #48734A;">
				<thead>
					<tr>
						<th>팀번호</th>
						<th>이름</th>
						<th>감독</th>
						<th>창단일</th>
						<th>총원</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="teamList" items="${teamList}">
						<tr>
							<td>${teamList.listno}</td>
							<td><a href="/team/myteam?page=${pageMaker.cri.page}&listno=${teamList.listno}&searchType=${pageMaker.cri.searchType}&keyword=${pageMaker.cri.keyword}">${teamList.name}</a></td>
							<td>${teamList.coach}</td>
							<td>${teamList.regdate}</td>
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

</body>
</html>