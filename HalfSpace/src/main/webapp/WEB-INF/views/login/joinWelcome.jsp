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
<link rel="stylesheet" type="text/css" href="/resources/login/hsLogin.css">
<link href="https://webfontworld.github.io/sandbox/SBAggro.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>Half Space Logout Page</title>
</head>
<body>
	<jsp:include page="../header.jsp" flush="true" />
	<jsp:include page="../sidebar.jsp" flush="true" />

	<hr>
	<div class="container-fluid pt-5">
		<div class="narrow-container" id="login-page"">
		<h1 style="color: black;">Half Space에 오신 것을 환영합니다</h1><br>
			<div class="row pb-3">
				<div class="mx-auto">
					<a class="logo" href="/mainBoard/list">
						<img src="../resources/images/LogoMakr-5Syrbv.png">		
					</a>
				</div><!-- mx-auto-->
			</div><!-- row pb-3-->
			<div class="row no-gutters">
				<div class="col">
		            <div class="p-3" style="width: 200px;">
		               	<a href="/login/user">
							<button class="btn w-100 py-3 mt-3 mb-1 rounded" type="submit" style="background-color: #BF00FF;">
							    <h4>로그인</h4>
							</button>
						</a>	
						<a href="/mainBoard/welcomeHome">
							<button class="btn w-100 py-3 mt-3 mb-1 rounded" type="submit" style="background-color: #0000FF;">
							    <h4>Home</h4>
							</button>
						</a>	
		            </div>
			    </div>
			</div>
		</div><!-- narrow-container -->			
	</div><!-- container-->
	
	<jsp:include page="../footer.jsp" flush="true" />
	<script>

	</script>
	
	<script src="/resources/basic/sideBar.js"></script>
</body>
</html>