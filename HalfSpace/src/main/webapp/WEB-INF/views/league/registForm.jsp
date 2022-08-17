<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<!-- BootStrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Styles -->
<link rel="stylesheet" href="/resources/league/registForm.css">
<link rel="stylesheet" type="text/css" href="/resources/basic/basic.css">
<!-- 글씨체 -->
<link href="https://webfontworld.github.io/sandbox/SBAggro.css" rel="stylesheet">
<sec:authentication property="principal" var="prin"/>
<head>
<meta charset="UTF-8">
<title>registForm</title>
</head>
<body>
	<jsp:include page="../header.jsp" flush="true" />
	<jsp:include page="../sidebar.jsp" flush="true" />

	<!-- id="regi-page" narrow-container START -->
	<div class="narrow-container mx-auto py-5" id="regi-page">
		<h5 class="px-4 py-2">리그에 팀 등록</h5>
		<div class="row">
			<div class="col-4">
				<div class="profile-wrap text-center">
					<form class="page-wrap" action="/league/regist" method="post">
						<div class="select-group form-group mr-2">
							<div class="row-wrap mb-3">
								<div class="input-wrap">
									<label>팀명</label>
									<input class="form-control mt-1" type="text" name="name" value="${team.name}" readonly>
								</div>
								<div class="input-wrap">
									<label>팀명</label>
									<input class="form-control mt-1" type="text" name="name" value="${team.name}" readonly>
								</div>
							</div>				
						
							<label>리그 선택</label>
							<select class="form-control" name="round">
								<option value="2022 하프스페이스컵 예선 A조" selected="">2022 하프스페이스컵 예선 A조</option>
								<option value="2022 하프스페이스컵 예선 B조">2022 하프스페이스컵 예선 B조</option>
								<option value="2022 하프스페이스컵 예선 C조">2022 하프스페이스컵 예선 C조</option>
								<option value="2022 하프스페이스컵 예선 D조">2022 하프스페이스컵 예선 D조</option>
							</select>
						</div>
					</form>
				
				
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="../footer.jsp" flush="true" />

</body>


	<!-- sidebar 기능-->
	<script src="/resources/basic/sideBar.js"></script>
</html>