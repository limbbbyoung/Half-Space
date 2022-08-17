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
<link rel="stylesheet" type="text/css" href="/resources/team/detail.css">
<link rel="stylesheet" type="text/css" href="/resources/team/modal.css">
<!-- 글씨체 -->
<link href="https://webfontworld.github.io/sandbox/SBAggro.css" rel="stylesheet">
<sec:authentication property="principal" var="prin"/>
<head>
<meta charset="UTF-8">
<title>TeamDetail Page</title>
</head>
<body>
	<jsp:include page="../header.jsp" flush="true" />
	<jsp:include page="../sidebar.jsp" flush="true" />
	
			<!-- narrow container시작 -->
			<div class="narrow-container mx-auto py-5" id="team-container">
				<h5 class="px-4 py-2">팀 정보</h5>
				<div class="team-wrap text-center">
					<div class="fileinput fileinput-new position-relative">
						<small>팀 로고 들어갈 자리</small>
						<div class="fileinput-new thumbnail img-circle">
							<img src="/resources/images/main_picture.jpg">
						</div>
					</div>
				</div><!-- team-wrap -->
			
				<div class="teamdetail-info">
					<div class="team-info">
						<div class="user-info-one">
							<a class="user-info-a">팀 이름</a>
							<h3 class="user-info">${myteam.name}</h3>
							<a class="user-info-a">창단일</a>
							<h5 class="user-info">${strRegDate}</h5>
						</div>
						<br/>
						<br/>
						<div class="user-info-two">
							<i class="">${myteam.name}의 상세정보</i><br/><hr/>
							<a class="user-info-a">팀원수</a>
							<h5 class="user-info">${listInMyteam.member_cnt}</h5>
							<a class="user-info-a">승</a>
							<h5 class="user-info">${myteam.win}</h5>
							<a class="user-info-a">무</a>
							<h5 class="user-info">${myteam.draw}</h5>
							<a class="user-info-a">패</a>
							<h5 class="user-info">${myteam.lose}</h5><br>
							<i class="">${myteam.name}의 소개</i><br/><hr/>
							${myteam.intro }
						</div>
					</div>
				</div>
				<sec:authorize access="isAuthenticated()">
					<c:if test="${prin.authorities eq '[ROLE_ADMIN]' || prin.username eq myteam.coach}">
						<div class="button1">
							<form action="/team/updateTeamForm" method="post">
								<input type="hidden" name="tno" value="${myteam.tno}"/>
								<input type="hidden" name="name" value="${myteam.name}"/>
								<input type="hidden" name="coach" value="${myteam.coach}"/>
								<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
								<button type="submit" class="btn">
								<h3><strong>팀 수정하기</strong></h3>
								</button>
							</form>
						</div>
						<div class="button2">
							<form action="/team/delete" method="post">
								<input type="hidden" name="tno" value="${myteam.tno}"/>
								<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
								<button type="submit" class="btn">
								<h3><strong>팀 삭제하기</strong></h3>
								</button>
							</form>
						</div>
					</c:if>
				<div class="button3">
					<form action="/notification/requestNotifi" method="post">
					<input type="hidden" name="target_mem_id" value="${prin.username}"/>
					<input type="hidden" name="mem_id" value="${myteam.coach}"/>
					<input type="hidden" name="TeamName" value="${myteam.name}"/>
					<input type="hidden" name="listno" value="${listInMyteam.listno}"/>
					<input type="hidden" name="page" value="${param.page}"/>
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
					<button type="submit" class="btn" id="registerTeam">
					<h3><strong>팀 가입 신청하기</strong></h3>
					</button>
					</form>
				</div>
				</sec:authorize>
				<sec:authorize access="hasAnyRole('ROLE_MANAGER', 'ROLE_ADMIN')">
					<div class="registBtn">
						<button type='button' class="btn" id="registLeague">
							<h3><strong>리그에 등록</strong></h3>
						</button>
					</div>
				</sec:authorize>				
				<a class="btn" id="btn-filed" href="/team/teamlist?page=${param.page}&searchType=${param.searchType}&keyword=${param.keyword}" style="float:right; margin-top:10px;">목록으로 돌아가기</a>
				
				<!-- 첨부 파일 -->
			 	<div class="row">
			 		<h3 class="text-primary">첨부파일</h3>
			 		<div id="uploadResult">
			 			<ul>
			 				<!-- 첨부파일이 들어갈 위치 -->
			 			</ul>
			 		</div>
			 	</div><!-- row -->
			 	
			</div><!-- END narrow-container -->
			
				
		<!-- 리그 등록 모달창 -->
		<div id="modDiv" style="display:none;">
			<div class="modal-title">
				<p>${myteam.name}</p>	
			</div>
			<div>
				<input type="hidden" id="name" name = "name" value="${myteam.name}">
				<input type="hidden" id="tno" name="tno" value="${myteam.tno}">
				<label>리그 선택</label>
				<select id="round" name="round">
					<option value="2022 하프스페이스컵 예선 A조" selected="">2022 하프스페이스컵 예선 A조</option>
					<option value="2022 하프스페이스컵 예선 B조">2022 하프스페이스컵 예선 B조</option>
					<option value="2022 하프스페이스컵 예선 C조">2022 하프스페이스컵 예선 C조</option>
					<option value="2022 하프스페이스컵 예선 D조">2022 하프스페이스컵 예선 D조</option>
				</select>
			</div>
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				<button type="button" id="registLeagueBtn">등록하기</button>
				<button type="button" id="closeBtn">닫기</button>
		</div>
			
	<jsp:include page="../footer.jsp" flush="true" />
	

		<script>
			let csrfHeaderName = "${_csrf.headerName}"
			let csrfTokenValue="${_csrf.token}"
			// List를 가져오는 로직
			let tno = ${myteam.tno };
			console.log(tno);
		
			// 팀 가입 요청 버튼 클릭시
			$("#registerTeam").on("click", function(){
				alert("팀 가입 요청이 처리되었습니다.");
			}); 
		    
			// 익명함수 선언 및 호출
			// 우선 함수이기 때문에 호출한다는 점을 명시하기 위해 마지막에 ()를 추가로 붙여준다.
			// 파일 첨부 후 해당 글의 첨부된 파일의 데이터 가져오기
			(function(){
				$.getJSON("/team/getAttachList", {tno:tno}, function(arr){
					console.log(arr);
					
					let str = "";
					
					$(arr).each(function(i, attach){
						// image
						if(attach.fileType){
							let fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" +
									attach.uuid + "_" + attach.fileName);
							console.log(fileCallPath);
							
							str += `<li data-path='\${attach.uploadPath}' data-uuid='\${attach.uuid}'
										data-filename='\${attach.fileName}' data-type='\${attach.fileType}'>
										<div>
											<img src='/display?fileName=\${fileCallPath}'>
										</div>
									</li>`;
						} else { 
							str += `<li data-path='\${attach.uploadPath}' data-uuid='\${attach.uuid}'
										data-filename='\${attach.fileName}' data-type='\${attach.fileType}'>
										<div>
											<span>\${attach.fileName}</span><br>
											<img src='/resources/attach.png' width='100px' height='100px'>
										</div>
									</li>`;
						}
					}); // each 반복문 닫는 부분
					console.log(str);
					$("#uploadResult ul").html(str);
				}); // end getJSON
			})(); // end anonymous
			
			$("#uploadResult").on("click", "li", function(e){
				
				let liObj = $(this);
				
				let path = encodeURIComponent(liObj.data("path") + "/" + liObj.data("uuid")
						+ "_" + liObj.data("filename"));
				
					// download
					self.location = "/download?fileName=" + path;
			});
			
			
			$('#registLeague').on("click", function(){

				$("#modDiv").show('slow');
			});

			$("#closeBtn").on("click", function() {
				$("#modDiv").hide("slow");
			});
			
			$("#registLeagueBtn").on("click", function(){
			    let name = document.getElementById('name').value;
			    let tno = document.getElementById('tno').value;
			    let round = document.getElementById('round').value;

			    $.ajax({
			        type : 'post',
			        url : '/league/regist', 
			        
			        beforeSend : function(xhr) {
						xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
					},
			        
			        headers : {
			            "Content-Type" : "application/json",
			            "X-HTTP-Method-Override" : "POST"
			        },
			        
			        dataType : 'text',
			        data : JSON.stringify({
			        	round : round,
			        	name : name,
			        	tno : tno
			        }),
			        
			        success : function(result){
			            console.log("result: " + result);
			            if(result == 'SUCCESS'){
			                alert("등록 되었습니다.");
			                // modal 닫기
			                $('#modDiv').hide("slow");
			                window.location.href = '/league/tree';
			    
			            }
			        }
			    });
			}); // regist END

			</script>
	<!-- sidebar 기능-->
	<script src="/resources/basic/sideBar.js"></script>
</body>
</html>