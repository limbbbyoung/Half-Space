<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- 웹사이트 배경 이미지 -->
<link rel="stylesheet" type="text/css" href="/resources/mainboard/list.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="header">
	</div><!-- .header -->
	<div class="container">
		<div class="row">
			<div class="col-3"></div><!-- .col-3 -->
			<div class="col-6">
				
				* 팀 이름 : ${myteam.name} <br/>
				* 감독 : ${myteam.coach} <br/>
				* 창단일 : ${strRegDate} <br/>
				* 선수단 총원 : ${listInMyteam.member_cnt} <br/>
			    * 로고 : ${myteam.logo}<br/>
			    * 소개 : ${myteam.intro}<br/>
			    * 승 : ${myteam.win}<br/>
			    * 무 : ${myteam.draw}<br/>
			    * 패 : ${myteam.lose}<br/>
			<br/>
			<br/>
				<form action="/team/updateTeamForm" method="post">
					<input type="hidden" name="tno" value="${myteam.tno}"/>
					<input type="hidden" name="name" value="${myteam.name}"/>
					<input type="hidden" name="coach" value="${myteam.coach}"/>
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					<button type="submit" class="btn" id="btn-filed">팀 수정하기</button>
				</form>
				<br>
				
				<form action="/team/delete" method="post">
					<input type="hidden" name="tno" value="${myteam.tno}"/>
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					<button type="submit" class="btn" id="btn-filed">팀 삭제하기</button>
				</form>
				<br>
				
				<form action="/notification/requestNotifi" method="post">
					<input type="hidden" name="target_mem_id" value="<sec:authentication property="principal.Username"/>"/>
					<input type="hidden" name="mem_id" value="${myteam.coach}"/>
					<input type="hidden" name="TeamName" value="${myteam.name}"/>
					<input type="hidden" name="listno" value="${listInMyteam.listno}"/>
					<input type="hidden" name="page" value="${param.page}"/>
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					<button type="submit" class="btn btn-primary" id="registerTeam">팀 가입 신청하기</button>
				</form>
				<br>
				
				<a class="btn" id="btn-filed" href="/team/teamlist?page=${param.page }">팀 목록</a>			
			</div><!-- .col-6 -->
			<div class="col-3"></div><!-- .col-3 -->
		</div><!-- .row -->
	</div><!-- .container -->
	<div class="footer"></div><!-- .footer -->
	<!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script type="text/javascript">
	
		$("#registerTeam").on("click", function(){
			alert("팀 가입 요청이 처리되었습니다.");
		}); // 팀 가입 요청 버튼 클릭시
	
	</script>

</body>
</html>