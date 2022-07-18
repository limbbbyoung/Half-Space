<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h1>admin 로그인 성공</h1>
 <h2>페이지 정보</h2>
 	
 	<p>principal : <sec:authentication property="principal"/></p><hr/>
 	<p>UserVO : <sec:authentication property="principal.user"/></p><hr/>
 	<p>principal로 꺼낸 ID : <sec:authentication property="principal.Username"/></p><hr/>
 	<p>사용자의 이름 : <sec:authentication property="principal.user.userName"/></p><hr/>
 	<p>사용자의 아이디 : <sec:authentication property="principal.user.userId"/></p><hr/>
 	<p>사용자의 권한 목록 : <sec:authentication property="principal.user.authList"/></p><hr/>
 	

	<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
		<a href="/admin/userlist">관리자 페이지로</a>
	</sec:authorize>
</body>
</html>