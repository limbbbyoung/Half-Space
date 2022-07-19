<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!-- BootStrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Styles -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<sec:authentication property="principal" var="prin"/>

타입 : ${prin} <br>
유저 아이디 : ${prin.username} <br>

	<form action="/post/update" method="post">
		<input type="text" name="title" value="${post.title }" required/>
		<input type="text" name="writer" value="${post.writer  }" readonly/>
		<div class="col-md-1 mb-3">
			<select class="form-select" name="catego" aria-label="selelt-catego" required>
			  <option selected>잡담</option>
			  <option value="질문">질문</option>
			  <option value="정보/기사">정보/기사</option>
			  <option value="사진/영상">사진/영상</option>
			  <sec:authorize access="hasAnyRole('ROLE_MANAGER', 'ROLE_ADMIN')">
			  	<option value="공지">공지</option>
			  </sec:authorize>	
			</select>			
		</div>
		<textarea name="content" required>${post.content }</textarea>
		<input type="hidden" name="pono" value="${post.pono}">
		<input type="hidden" name="page" value="${param.page}"/>
		<input type="hidden" name="searchType" value="${param.searchType}"/>
		<input type="hidden" name="keyword" value="${param.keyword}"/>
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
		<input type="submit">
	</form>
</body>

</html>