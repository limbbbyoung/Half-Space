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
user mypage
 <h2>페이지 정보</h2>
 	
 	<p>principal : <sec:authentication property="principal"/></p><hr/>
 	<p>UserVO : <sec:authentication property="principal.user"/></p><hr/>
 	<p>principal로 꺼낸 ID : <sec:authentication property="principal.Username"/></p><hr/>
 	<p>사용자의 이름 : <sec:authentication property="principal.user.userName"/></p><hr/>
 	<p>사용자의 아이디 : <sec:authentication property="principal.user.userId"/></p><hr/>
 	<p>사용자의 권한 목록 : <sec:authentication property="principal.user.authList"/></p><hr/>
<a href="/hsLogout">로그아웃</a>
	<br/>
	
	<!-- Start main -->
	<main>	
	  <div class="profile-outer">
		<img class="profile-pic" src="/user/display2?u_id=${profile.u_id }"><br>
		<form class="profile-form" action="/user/modify" method="post" enctype="multipart/form-data">
			
			<div class="profile-form__column">
				<input type="file" name="profile" multiple />
			</div>
			
			<div class="profile-form__column">
				<input type="text" name="u_id" value="${profile.u_id}" readonly />
			</div>
	
			<div class="profile-form__column">
				<input class="profile-form__name" type="text" name="u_name" value="${profile.u_name}" required />
				
				<div class="profile-form__sex">
					<c:choose>
					  <c:when test="${profile.u_sex == 0}">
						<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
						  <input type="radio" class="btn-check" name="u_sex" id="0" value="0" autocomplete="off" checked>
						  <label class="btn btn-outline-primary" for="0">  남성  </label>
						
						  <input type="radio" class="btn-check" name="u_sex" id="1" value="1" autocomplete="off">
						  <label class="btn btn-outline-primary" for="1">  여성  </label>
						</div>
					  </c:when>
					  <c:otherwise>
						<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
						  <input type="radio" class="btn-check" name="u_sex" id="0" value="0" autocomplete="off">
						  <label class="btn btn-outline-primary" for="0">  남성  </label>
						
						  <input type="radio" class="btn-check" name="u_sex" id="1" value="1" autocomplete="off" checked>
						  <label class="btn btn-outline-primary" for="1">  여성  </label>
						</div>
					  </c:otherwise>
					</c:choose>
				</div>
			</div>
			
			<div class="profile-form__column">
				<input type="date" name="u_birth" value="${profile.u_birth}" required />
				<input type="text" name="u_area" value="${profile.u_area}" required />
			</div>
			
			<div class="profile-form__textarea">
				<textarea cols="70px" rows="10px" name="u_intro" 
					required="required">${profile.u_intro}</textarea>
			</div>
			
			<div class="password-form__btn">
				<button type="button" class="btn btn-outline-danger"
					onclick="history.back()">이전</button>
				<input class="btn btn-outline-primary" type="submit" value="저장" />	
			</div>
		</form>
	  </div> 
	</main>
	
	
</body>
</html>