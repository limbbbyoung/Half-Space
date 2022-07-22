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
<link rel="stylesheet" type="text/css" href="/resources/post/insert.css">
<link rel="stylesheet" href="/resources/reply/modal.css">
<!-- 글씨체 -->
<link href="https://webfontworld.github.io/sandbox/SBAggro.css" rel="stylesheet">
<sec:authentication property="principal" var="prin"/>
<head>
<sec:authentication property="principal" var="prin"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="header">
		<div class="navi-container">
			<div class="d-flex justify-content-between align-items-center mx-auto p-0" style="max-width:800px">
				<a href="/mainBoard/welcomeHome">
					<img class="ml-3" src="../resources/images/LogoMakr-5Syrbv.png" width="70">
				</a>
				<div class="user-info-container">
					<input id="isLoggedIn" type="hidden" data-islogin="false">
					<div class="user-info-wrap">
						<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
							<a class="text-main btn-sm rounded-pill border" href="/admin/userlist">
								<strong>관리자 페이지</strong>
							</a>
						</sec:authorize>
						<sec:authorize access="isAnonymous()">
							<a class="text-main btn-sm btn-neutral" href="/login/join">
								<strong>회원가입</strong>
							</a>
							<a class="text-main btn-sm rounded-pill border" href="/login/user">
								<strong>로그인</strong>
							</a>
						</sec:authorize>
							&nbsp;
						<sec:authorize access="isAuthenticated()">
							<!-- 미확인 알림이 있을 경우 c:if 를 통한 조건비교 구문이 필요-->
							<a class="px-3" id="sidebarCollapse2" href="#">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell" viewBox="0 0 16 16">
									<path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zM8 1.918l-.797.161A4.002 4.002 0 0 0 4 6c0 .628-.134 2.197-.459 3.742-.16.767-.376 1.566-.663 2.258h10.244c-.287-.692-.502-1.49-.663-2.258C12.134 8.197 12 6.628 12 6a4.002 4.002 0 0 0-3.203-3.92L8 1.917zM14.22 12c.223.447.481.801.78 1H1c.299-.199.557-.553.78-1C2.68 10.2 3 6.88 3 6c0-2.42 1.72-4.44 4.005-4.901a1 1 0 1 1 1.99 0A5.002 5.002 0 0 1 13 6c0 .88.32 4.2 1.22 6z"/>
								</svg>
							</a>
									
							<!-- 확인할 알림이 없는 경우 -->
							<a href="#">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell-fill" viewBox="0 0 16 16">
									<path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zm.995-14.901a1 1 0 1 0-1.99 0A5.002 5.002 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901z"/>
								</svg>
							</a>
						</sec:authorize>
						<a class="px-3" id="sidebarCollapse" href="#">
							<img src="../resources/images/threedots.png" max-width="300px" height="10px">
						</a>
					</div>
				</div>
			</div>
			<div class="menu-container">
				<div class="navi-content">
					<a href="/mainBoard/list">소셜매치</a>
					<a class="active" href="/post/list">자유게시판</a>
					<a href="/weather/today">날씨</a>
					<a href="/team/teamlist">팀 찾기</a>
				</div>
			</div>
		</div>
	</div><!-- .header끝나는 지점 -->

	<div class="container">
		<sec:authentication property="principal" var="prin"/>
		<form action="/post/insert" method="post">
			<h3>제목</h3>
			<input type="text" name="title" placeholder="여기에 제목을 적어주세요." oninvalid="alert('제목을 입력해주세요.');" required/>
			<input type="hidden" name="writer" value="${user.userId}"/>
			<h3>카테고리</h3>
			<select class=" form-select" name="catego" aria-label="selelt-catego" required>
				<option selected>잡담</option>
				<option value="질문">질문</option>
			 	<option value="정보/기사">정보/기사</option>
			  	<option value="사진/영상">사진/영상</option>
				<sec:authorize access="hasAnyRole('ROLE_MANAGER', 'ROLE_ADMIN')">
				  <option value="공지">공지</option>
				</sec:authorize>	
			</select>			
			<h3>글쓰기</h3>
			<textarea name="content" oninvalid="alert('글을 작성해주세요.');" placeholder="여기에 적고싶은 글을 작성해주세요." required></textarea>
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
			<div class="uploadDiv">
				<input type="file" name="uploadFile" multiple>
			</div>
			<div class="uploadResult">
				<ul>
					<!-- 업로드된 파일들이 여기 나열됨. -->
				</ul>
			</div>
			<button id="uploadBtn">작성하기</button>
		</form>
	</div>	
	
	<div class="footer">
 		<div class="footer-container">
			<a class="my-3" href="/">
				<img src="../resources/images/LogoMakr-2rlJxi.png" width="80">
			</a>
			<p class="mt-3">축구로 하나되는 공간</p>
			<div class="copyright">
				<p class="mb-3">Spring Project A조</p>
				서울특별시 마포구 백범로 23 3층<br/>
				임병영<br/>
				김동완<br/>
				신동호
				<p class="mb-4">대표 전화번호 010-9966-8908</p>
			</div>
		</div>
		<div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
			<a class="text-white" href="https://mdbootstrap.com/">COPYRIGHT HalfSpace C&C ALL RIGHT RESERVED</a>
		</div>
 	</div><!-- .footer 끝나는 지점 -->
	
	
	 <nav id="sidebar" class="mCustomScrollbar _mCS_1 mCS-autoHide mCS_no_scrollbar" style="overflow: visible;">
		<div id="mCSB_1" class="mCustomScrollBox mCS-minimal mCSB_vertical mCSB_outside" style="max-height: 879px;" tabindex="0">
			<div id="mCSB_1_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0px; left:0;" dir="ltr">
				<div class="d-flex flex-column justify-content-between h-100">
					<section>
						<div class="sidebar-body">
							<div class="header-wrap">
								<sec:authorize access="isAnonymous()">
									<a class="text-main btn-sm rounded-pill border ml-2" href="/users/login">
										<small>로그인</small>
									</a>
								</sec:authorize>
								<sec:authorize access="isAuthenticated()"><!-- collapse했을 때 보이게끔 -->
									<a class="text-main btn-sm rounded-pill border" id="nav_pill_btn1" href="/user/mypage">
										<small>내 정보</small>
									</a>
									&nbsp;
									<a class="text-main btn-sm rounded-pill border" id="nav_pill_btn2" href="/team/teamDetail">
										<small>내 팀</small>
									</a>
								</sec:authorize>
							</div>
							<div class="menu-wrap">
								<a href="#"><img src="../resources/images/faq.svg" class="mCS_img_loaded">FAQ</a>
							</div>
						</div>
					</section>
				</div>
			</div>
		</div>
		<div id="mCSB_1_scrollbar_vertical" class="mCSB_scrollTools mCSB_1_scrollbar mCS-minimal mCSB_scrollTools_vertical" style="display: none;">
			<div class="mCSB_draggerContainer">
				<div id="mCSB_1_dragger_vertical" class="mCSB_dragger" style="position: absolute; min-height: 0px; height: 0px; top: 0px;">
					<div class="mCSB_dragger_bar" style="line-height: 0px;">
					</div>
				</div>
				<div class="mCSB_draggerRail">
				</div>
			</div>
		</div>
	</nav>
	<nav id="sidebar2" class="mCustomScrollbar _mCS_1 mCS-autoHide mCS_no_scrollbar" style="overflow: visible;">
		여기가 알림을 넣는 곳입니다.
	</nav>
	<div class="overlay"></div>
	
	
	
	
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script>
		let csrfHeaderName = "${_csrf.headerName}"
		let csrfTokenValue="${_csrf.token}"
	
		$(document).ready(function(){
				
				// 정규표현식 : 예).com 끝나는 문장 등의 조건이 복잡한 문장을 컴퓨터에게 이해시키기 위한 구문
				let regex = new RegExp("(.*)\.(exe|sh|zip|alz)$");
									// 파일이름 .  exe|sh|zip|alz 인 경우를 체크함
				let maxSize =5242880; // 5Mb
				
				function checkExtension(fileName, fileSize){
					// 파일크기 초과시 종료시킴
					if(fileSize >= maxSize){
						alert("파일 사이즈 초과");
						return false;// return이 있어서 아래쪽 구문은 실행 안됨
					}
					// regex에 표현해둔 정규식과 일치하는지 여부를 체크, 일치하면 true, 아니면 false
					if(regex.test(fileName)){
						alert("해당 확장자를 가진 파일은 업로드할 수 없습니다.");
						return false;
					}
					return true;
				}
				
				let cloneObj = $(".uploadDiv").clone();
				
				$('#uploadBtn').on("click", function(e){
				
					let formData = new FormData();
					
					let inputFile = $("input[name='uploadFile']");
					
					let files = inputFile[0].files;
					console.log(files);
					
					// 파일 데이터를 폼에 집어넣기
					for(let i = 0; i < files.length; i++){
						if(!checkExtension(files[i].name, files[i].size)){
							return false;// 조건에 맞지않은 파일 포함시 onclick 이벤트 함수자체를 종료시켜버림
						}
						
						formData.append("uploadFile", files[i]);
					}
					console.log("--------------파일 적재 후 formData 태그 -------------");
					console.log(formData);
					
					$.ajax({
						url: '/uploadFormAction', 
						processData : false,
						contentType: false,
						beforeSend : function(xhr) {
							xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
						},
						data : formData,
						dataType:'json',
						type : 'POST',
						success : function(result){
							console.log(result);
							
							showUploadedFile(result);
							
							$(".uploadDiv").html(cloneObj.html());
						}
					}); // ajax
					
					
				});// uploadBtn onclick
				
				let uploadResult = $(".uploadResult ul");
				
				function showUploadedFile(uploadResultArr){
					let str = "";
					
					$(uploadResultArr).each(function(i, obj){
						console.log(obj);
						console.log(obj.image);
						if(!obj.image){
							
							let fileCallPath = encodeURIComponent(obj.uploadPath + "/" + 
														obj.uuid + "_" + obj.fileName);
							
							str += `<li data-path='\${obj.uploadPath}' data-uuid='\${obj.uuid}'
										data-filename='\${obj.fileName}' data-type='\${obj.image}'>
										<a href='/download?fileName=\${fileCallPath}'>
											<img src='/resources/images/attach.png'>\${obj.fileName}
										</a>
										<span data-file='\${fileCallPath}' data-type='file'>X</span>
									</li>`;
						} else{
						
							// 수정 후 코드
							//썸네일은 display에 배치 						
							let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" +
																obj.uuid + "_" + obj.fileName);
							// 실제 파일은 download 배치
							let fileCallPath2 = encodeURIComponent(obj.uploadPath +	"/" +
																obj.uuid + "_" + obj.fileName);
							console.log(fileCallPath2);
							
							str += `<li data-path='\${obj.uploadPath}' data-uuid='\${obj.uuid}'
									data-filename='\${obj.fileName}' data-type='\${obj.image}'>
										<a href='download?fileName=\${fileCallPath2}'>
											<img src='/display?fileName=\${fileCallPath}'>\${obj.fileName}
										</a>
										<span data-file='\${fileCallPath}' data-type='image'>X</span>
									</li>
									`;
						}
					});
					uploadResult.append(str);
				}// showUploadedFile END
				
				$(".uploadResult").on("click", "span", function(e){
					// 파일이름을 span태그 내부의 data-file에서 얻어와서 저장
					let targetFile = $(this).data("file");
					// 이미지 여부를 span태그 내부의 data-type에서 얻어와서 저장
					let type = $(this).data("type");
					
					// 클릭한 span태그와 엮여있는 li를 targetLi에 저장
					let targetLi = $(this).closest("li"); 
					console.log(targetLi);
					
					$.ajax({
						url : '/deleteFile',
						beforeSend : function(xhr) {
							xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
						},
						data: {fileName : targetFile, type:type},
						dataType : 'text',
						type : 'POST',
						success : function(result){
							alert(result);
							// 클릭한 li요소를 화면에서 삭제함(파일삭제 후 화면에서도 삭제.)
							targetLi.remove();
						}
					});//ajax
				});//click span END
				
				
				// 제출버튼 막기
				$("#submitBtn").on("click", function(e){
					
					// 1. 버튼의 제출기능을 막습니다.
					e.preventDefault();
					
					// 2. let formObj = $("form");으로 폼태그를 가져옵니다.
					let formObj = $("form");
					
					// 3. 첨부파일과 관련된 정보를 hidden태그들로 만들어 문자로 먼저 저장합니다.
					let str = "";
				
					$(".uploadResult ul li").each(function(i, obj){

						// $(obj)에 대해서만 .data() 를 활용해 데이터를 얻어올 수 있음
						let jobj =$(obj);
						
						str += `<input type='hidden' name='attachList[\${i}].fileName' 
									value='\${jobj.data("filename")}'>
								<input type='hidden' name='attachList[\${i}].uuid' 
									value='\${jobj.data("uuid")}'>
								<input type='hidden' name='attachList[\${i}].uploadPath' 
									value='\${jobj.data("path")}'>
								<input type='hidden' name='attachList[\${i}].fileType' 
									value='\${jobj.data("type")}'>`
						
					});
					console.log(str);
					
					// 4. formObj에 append를 이용해 str을 끼워넣습니다.
					formObj.append(str);
					
					// 5. formObj.submit()을 이용해 제출기능이 실행되도록합니다.
					formObj.submit();	
				});
		
			
				
			});	// document ready END
			
			
			$("#sidebarCollapse").on("click", function(event) {
				if($("#sidebar").hasClass('active')) {
					$("#sidebar").removeClass('active');
					$(".overlay").removeClass('active');
				} else {
					$("#sidebar").addClass('active');
					$(".overlay").addClass('active');
				}
			})
			
			// 사이드바2 펼치기
			$("#sidebarCollapse2").on("click", function(event) {
				if($("#sidebar2").hasClass('active')) {
					$("#sidebar2").removeClass('active');
					$(".overlay").removeClass('active');
				} else {
					$("#sidebar2").addClass('active');
					$(".overlay").addClass('active');
				}
			})
			
			// 사이드바 접기
			$(".overlay").on("click", function(event) {
				$("#sidebar").removeClass('active');
				$("#sidebar2").removeClass('active');
				$(".overlay").removeClass('active');
			})
			
			
			
	</script>	
	<!--  file insert form js -->
</body>
</html>