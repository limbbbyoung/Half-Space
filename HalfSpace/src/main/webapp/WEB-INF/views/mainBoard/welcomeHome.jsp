<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!-- springframework -->
    <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- 웹사이트 배경 이미지 -->
<link rel="stylesheet" type="text/css" href="/resources/mainboard/welcomeHome.css">
<head>
<!-- google 폰트 적용 -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap" rel="stylesheet">
<style>
	@import url('https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap');
    #HeadLine{color: white;
       font-family : 'Roboto';
       text-align: center;
       font-size: 100px;}
	.nav-link {
			  color : white;
			  display: flex;
			  justify-content: center;
			  align-items: center;
  			  min-height: 65vh;}
</style>
<meta charset="UTF-8">
<title>Welcome Half-Space</title>
</head>
<body>
	<div class="bgimg">
		<div class="header">
		</div><!-- .header -->
		<div class="container">
			<div class="row">
				<div class="col-2">
				</div><!-- .col-4 -->
				<div class="col-8">
					<h1 id="HeadLine">HalfSpace</h1>
					<ul class="nav justify-content-center">
					  <li class="nav-item">
					    <h1><a class="nav-link" aria-current="page" href="/mainBoard/list">
					    소셜매치
					    </a></h1>
					  </li>
					  <li class="nav-item">
					    <h1><a class="nav-link" href="/weather/today">
					    날씨
					    </a></h1>
					  </li>
					  <li class="nav-item">
					    <h1><a class="nav-link" href="/post/list">
					    자유게시판
					    </a></h1>
					  </li>
					  <li class="nav-item">
					    <h1><a class="nav-link" href="#">
					    QnA
					    </a></h1>
					  </li>
					</ul>
				</div><!-- .col-4 -->
				<div class="col-2">
				</div><!-- .col-4 -->
			</div><!-- .row -->
		</div><!-- .container -->
		<div class="footer">
		</div><!-- .footer -->
	</div>
</body>
</html>