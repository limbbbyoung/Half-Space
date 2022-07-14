<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/post/insert" method="post">
		<input type="text" name="title" placeholder="title" required/>
		<input type="text" name="writer" placeholder="writer" required/>
		<input type="text" name="catego" placeholder="catego" required/>
		<textarea name="content" required></textarea>
		<input type="submit">
	</form>
</body>
</html>