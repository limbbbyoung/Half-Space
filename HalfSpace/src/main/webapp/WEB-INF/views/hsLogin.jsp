<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Half Space 로그인 폼</h1>
	<h2><c:out value="${error}"/></h2>
	<h2><c:out value="${logout}"/></h2>
	
	<form action="/login" method="post">
		아이디 : <input type="text" name="username" placeholder="아이디를 입력해주세요"><br/>
		비밀번호 : <input type="text" name="password" placeholder="비밀번호를 입력해주세요"><br/>
		<input type="submit" value="로그인하기">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
</body>
</html>