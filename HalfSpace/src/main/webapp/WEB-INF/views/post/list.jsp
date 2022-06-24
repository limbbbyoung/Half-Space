<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table class="table table-hover">
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
					<td><a href="/post/detail?page=${pageMaker.cri.page}&pono=${post.pono}&searchType=${pageMaker.cri.searchType}&keyword=${pageMaker.cri.keyword}">${post.title }</a></td>
					<td>${post.writer}</td>
					<td>${post.regDate}</td>
					<td>${post.updateDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a href="/post/insert"><button class="btn btn-primary">글쓰기</button></a>
	
	
	
	${pageMaker}
	

</body>
</html>