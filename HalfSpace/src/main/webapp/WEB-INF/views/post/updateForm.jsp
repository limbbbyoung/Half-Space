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
		<input type="text" name="catego" value="${post.catego}" required />
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