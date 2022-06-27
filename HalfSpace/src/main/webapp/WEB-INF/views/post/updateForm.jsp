<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/post/update" method="post">
		<input type="text" name="title" value="${post.title }" required/>
		<input type="text" name="writer" value="${post.writer  }" required/>
		<textarea name="content" required>${post.content }</textarea>
		<input type="hidden" name="pono" value="${post.pono}">
		<input type="hidden" name="page" value="${param.page}"/>
		<input type="hidden" name="searchType" value="${param.searchType}"/>
		<input type="hidden" name="keyword" value="${param.keyword}"/>
		<input type="submit">
	</form>
</body>
</html>