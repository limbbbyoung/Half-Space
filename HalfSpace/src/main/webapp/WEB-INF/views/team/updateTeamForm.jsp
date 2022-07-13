<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- 웹사이트 배경 이미지 -->
<link rel="stylesheet" type="text/css" href="/resources/mainboard/list.css">
<head>
<meta charset="UTF-8">
<title>Update Team</title>
</head>
<body>
	<form action="/team/updateTeam" method="post">
		팀 이름 : <input type="text" name="name" value="${team.name}" required/><br/>
		감독 : <input type="text" name="coach" value="${team.coach}" required/><br>
		 * 감독 위임시 감독 위임을 원하는 user의 id를 입력해주세요.<br>
		간단한 팀 소개 : <input type="text" name="intro" value="${team.intro}" required/><br>
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<input type="hidden" name="tno" value="${team.tno}">
		<input type="submit" class="btn btn-primary">
	</form>
</body>
</html>