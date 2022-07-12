<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입창</h1>
	<form action="/login/join" method="post">
		* 아이디 : <input type="text" name="userId" required><br><br>
		* 비밀번호 : <input type="text" name="userPw"><br><br>
		* 이름 : <input type="text" name="userName"><br><br>
		* 성별 : <input type="text" name="gender"><br><br>
		* 생년월일 : <input type="date" name="birthdate"><br><br>
		* 이메일 : <input type="text" name="email"><br><br>
		* 휴대폰 번호 : 
			<input type="text" name="phoneNum"><br><br>
	    * 주소 : 
		 	<input type="text" name="address"><br><br>
	     
		<input type="checkbox" name="role" value="ROLE_ADMIN">어드민 권한&nbsp;&nbsp;&nbsp;  
		<input type="checkbox" name="role" value="ROLE_MEMBER">정회원 권한&nbsp;&nbsp;&nbsp;  
		<input type="checkbox" name="role" value="ROLE_USER">준회원 권한<br/>
		<input type="hidden" name="${_csrf.parameterName }"
								value="${_csrf.token }" />
		<input type="submit" value="가입하기">  
	</form>
</body>
</html>