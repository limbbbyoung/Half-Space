<%@page import="org.springframework.security.core.Authentication"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
user 접속
 <h2>페이지 정보</h2>
 	
 	<p>principal : <sec:authentication property="principal"/></p><hr/>
 	<p>UserVO : <sec:authentication property="principal.user"/></p><hr/>
 	<p>principal로 꺼낸 ID : <sec:authentication property="principal.Username"/></p><hr/>
 	<p>사용자의 이름 : <sec:authentication property="principal.user.userName"/></p><hr/>
 	<p>사용자의 아이디 : <sec:authentication property="principal.user.userId"/></p><hr/>
 	<p>사용자의 권한 목록 : <sec:authentication property="principal.user.authList"/></p><hr/>
<a href="/hsLogout">로그아웃</a>
	<br/>
	<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
		<a href="/admin/userlist">관리자 페이지로</a>
	</sec:authorize>
<a class="btn" href="/user/mypage?userId="" id="btn-filed">

	마이 페이지
</a>
</body>
</html>