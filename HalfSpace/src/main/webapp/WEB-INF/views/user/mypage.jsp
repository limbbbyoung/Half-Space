<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- html 태그 내에 넣을 부분 -->
<!-- BootStrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- Styles -->
<link rel="stylesheet" href="/resources/user/mypage.css">
<!-- 글씨체 -->
<link href="https://webfontworld.github.io/sandbox/SBAggro.css" rel="stylesheet">
<sec:authentication property="principal" var="prin"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User MyPage</title>
</head>
<body>
	<jsp:include page="../header.jsp" flush="true" />
	<jsp:include page="../sidebar.jsp" flush="true" />


	<div class="narrow-container mx-auto py-5" id="mypage-container">
		<h5 class="px-4 py-2">내 정보</h5>
		
		<!--  여기에 이미지를 넣는다 -->
		<div class="user-wrap text-center">
			<div class="fileinput fileinput-new position-relative" data-provides="fileinput">
				<div class="uploadResult">
					<!-- 바로 여기 -->
					<img src="/resources/images/main_picture.jpg">
				</div>
			</div>
		</div>
			<!--  이미지 칸 끝 -->
			
			<div class="user-info">
				<div class="mypage-info">
					<div class="user-info">
						<div class="user-info-one">
							<a class="user-info-a">이름</a>
							<h3 class="user-info">${user.userName}</h3>
							<a class="user-info-a">생일</a>
							<h5 class="user-info">${user.birthdate}</h5>
						</div>
						<br/>
						<br/>
						<div class="user-info-two">
							<i class="">${user.userName}님의 상세정보</i><br/><hr/>
							<a class="user-info-a">아이디</a>
							<h5 class="user-info">${user.userId}</h5>
							<a class="user-info-a">이메일</a>
							<h5 class="user-info">${user.email}</h5>
							<a class="user-info-a">주소</a>
							<h5 class="user-info">${user.address}</h5>
							<a class="user-info-a">전화번호</a>
							<h5 class="user-info">${user.phoneNum}</h5>
						</div>
					</div>
				</div>
				<div class="ahref-div1">
					<a href="/user/updateForm">	
						<strong>내 정보 수정</strong>
					</a>
				</div>
				<c:if test="${prin.authorities eq '[ROLE_ADMIN]' || prin.authorities eq '[ROLE_MANAGER]'}">
					<div class="ahref-div2">
						<a href="#">	
							<strong>매니저 요청 수락하기</strong>
						</a>
					</div>
				</c:if>
				<c:if test="${prin.authorities eq '[ROLE_USER]'}">
					<div class="ahref-div2">
						<a href="#">	
							<strong>매니저 지원하기</strong>
						</a>
					</div>
				</c:if>
				<div class="ahref-div3">
					<a href="#">	
						<strong>내 팀 생성</strong>
					</a>
				</div>
			</div><!-- user-info END -->
		</div><!-- mypage container END -->

		<jsp:include page="../footer.jsp" flush="true" />
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
		let userId = "${user.userId}";
		// csrf 토큰
		let csrfHeaderName = "${_csrf.headerName}"
		let csrfTokenValue="${_csrf.token}"
		
		
	
	$(document).ready(function(){
	
		let imgselect = document.querySelector(".uploadResult > img");
		console.log(imgselect);
		
		
			(function(){
				$.getJSON("/user/getAttachList", {userId:userId}, function(arr){
					console.log(arr);
					
					let str = "";
					
					
						$(arr).each(function(i, attach){
							let fileCallPath = encodeURIComponent(attach.uploadPath
									+ "/" + attach.uuid + "_" + attach.fileName);
						
							str += "/display?fileName="+fileCallPath;
								
							console.log(str);
						});
					
					$(imgselect).attr({ src: str });
				
					
				}); // END getJSON
			
			})(); //  END annonymous
			
		
		let imgselect2 = document.querySelector(".uploadResult > img");
		console.log(imgselect2);
		
		
	}); // document END
	
	</script>
	<script src="/resources/basic/sideBar.js"></script>
</html>
