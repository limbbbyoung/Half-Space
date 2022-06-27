<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/post/insert" method="post">
		<input type="text" name="title" required/>
		<input type="text" name="writer" required/>
		<textarea name="content" required></textarea>
		<input type="submit">
	</form>
</body>
</html>