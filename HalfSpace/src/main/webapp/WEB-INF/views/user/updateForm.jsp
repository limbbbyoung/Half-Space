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

	<c:if test="${user.userId eq param.principal.username}">
	</c:if>

	<!-- Start user-form -->
		<form class="user-form" action="/user/update" method="post" enctype="multipart/form-data">

				<input type="text" name="userId" value="${user.userId}" readonly />
				<input class="user-form__name" type="text" name="username" value="${user.userName}" required />
				
				<!-- 성별검사에 따른 checked radio -->
				<div class="user-form-gender">
					<c:choose>
					  <c:when test="${user.gender eq 'Y'}">
						<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
						  <input type="radio" class="btn-check" name="gender" id="Y" value="Y" autocomplete="off" checked>
						  <label class="btn btn-outline-primary" for="Y">  남성  </label>
						  <input type="radio" class="btn-check" name="gender" id="N" value="N" autocomplete="off">
						  <label class="btn btn-outline-primary" for="N">  여성  </label>
						</div>
					  </c:when>
					  <c:otherwise>
						<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
						  <input type="radio" class="btn-check" name="gender" id="Y" value="N" autocomplete="off">
						  <label class="btn btn-outline-primary" for="Y">  남성  </label>
						  <input type="radio" class="btn-check" name="gender" id="N" value="Y" autocomplete="off" checked>
						  <label class="btn btn-outline-primary" for="N">  여성  </label>
						</div>
					  </c:otherwise>
					</c:choose>
				</div>
				<input type="date" name="birthdate" value="" required />
			<button type="button" class="btn btn-outline-danger"
				onclick="history.back()">
				이전
			</button>
			
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<input class="btn btn-outline-primary" type="submit" value="저장" />	
		</form>
	<!-- END form -->
</body>
</html>