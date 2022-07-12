<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/comment/modal.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="header">
	</div><!-- .header -->
	<div class="container">
		<div class="row">
			<div class="col-6">
				
				* 팀 이름 : ${myteam.name} <br/>
				* 감독 : ${myteam.coach} <br/>
				* 창단일 : ${myteam.regdate} <br/>
				* 선수단 총원 : ${myteam.memberCnt} <br/>
			    * 로고 : ${teamList.logo}<br/>
			    * 소개 : ${teamList.intro}<br/>
			    * 승 : ${teamList.win}<br/>
			    * 무 : ${teamList.draw}<br/>
			    * 패 : ${teamList.lose}<br/>
			<br/>
			<br/>
				<form action="/team/updateTeamForm" method="post">
					<input type="hidden" name="rno" value="${myteam.rno}"/>
					<input type="hidden" name="name" value="${myteam.name}"/>
					<input type="hidden" name="coach" value="${myteam.coach}"/>
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					<button type="submit" class="btn" id="btn-filed">팀 수정하기</button>
				</form>
				
				<form action="/team/delete" method="post">
					<input type="hidden" name="rno" value="${myteam.rno}"/>
					<button type="submit" class="btn" id="btn-filed">팀 삭제하기</button>
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				</form>
				
				<a class="btn" id="btn-filed" href="/team/teamlist?">글 목록</a>
			

			
	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	

</body>
</html>