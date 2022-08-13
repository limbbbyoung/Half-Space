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
<link rel="stylesheet" href="/resources/login/join.css">
<!-- 글씨체 -->
<link href="https://webfontworld.github.io/sandbox/SBAggro.css" rel="stylesheet">
<sec:authentication property="principal" var="prin"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../header.jsp" flush="true" />
	<jsp:include page="../sidebar.jsp" flush="true" />

	<!-- id="join-page" narrow-container START -->
	<div class="narrow-container mx-auto py-5" id="join-page">
		<h5 class="px-4 py-2">회원가입</h5>
		<div class="row">
			<div class="col">
				<div class="profile-wrap text-center">
			
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
					
	
					<div class="uploadDiv">
						<input type="file" name="uploadFile">
					</div>	
					<button id="uploadBtn">프로필 선택</button>
					
					<div class="profile-desc text-caution d-flex justify-content-center">
						<img id="default-image" src="/resources/images/caution.svg" width="10">
						<small>150x150사이즈 권장</small>
					</div>
				</div>
				
				<!--onsubmit="return fnJoin()"  -->
				<form class="page-wrap" action="/login/join" method="post">
					<div class="row-wrap mb-3">
						<div class="input-wrap">
							<label>아이디</label>
							<input class="form-control mt-1" type="text" name="userId" id="userId" placeholder="아이디" maxlength="20">
							<small>최대 20자</small>
						</div>
					</div>
					<div class="row-wrap mb-3">
						<div class="input-wrap">
							<label>비밀번호</label>
							<input class="form-control mt-1" type="password" name="userPw" id="password" placeholder="비밀번호" maxlength="20">
							<small>최대 20자 특수문자 권장</small>
						</div>
					</div>
					<div class="row-wrap mb-3">
						<div class="input-wrap">
							<label>비밀번호 확인</label>
							<input class="form-control mt-1" type="password" name="userPw_chk" id="confirm_password" placeholder="비밀번호 확인" maxlength="20">
						</div>
					</div>
					<div class="row-wrap mb-3">
						<div class="row no-gutters">
							<div class="input-wrap col-6">
								<label>이름</label>
								<input class="form-control mt-1" type="text" name="userName" placeholder="이름">
								<small>닉네임을 입력해주세요</small>
							</div>
							<div class="input-wrap col-6">
								<label>성별</label>
								<div class="row py-1">
									<div class="col-6 form-check-radio radio-wrap wide-wrap">
									<label class="form-check-label" data-toggle="false" data-name="gender">
										<input class="form-check-input" type="radio" name="gender" value="Y">
										<span class="form-check-sign">남성</span>
									</label>
									</div>
									<div class="col-6 form-check-radio radio-wrap wide-wrap">
										<label class="form-check-label" data-toggle="false" data-name="gender">
											<input class="form-check-input" type="radio" name="gender" value="N">
											<span class="form-check-sign">여성</span>
										</label>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row no-gutters row-wrap mb-3">
						<div class="col-4">
						<div class="select-group form-group mr-2">
							<label>생년월일</label>
							<select class="form-control" name="birthdate_y">
								<option value="2022">2022년</option>
								<option value="2021">2021년</option>
								<option value="2020">2020년</option>
								<option value="2019">2019년</option>
								<option value="2018">2018년</option>
								<option value="2017">2017년</option>
								<option value="2016">2016년</option>
								<option value="2015">2015년</option>
								<option value="2014">2014년</option>
								<option value="2013">2013년</option>
								<option value="2012">2012년</option>
								<option value="2011">2011년</option>
								<option value="2010">2010년</option>
								<option value="2009">2009년</option>
								<option value="2008">2008년</option>
								<option value="2007">2007년</option>
								<option value="2006">2006년</option>
								<option value="2005">2005년</option>
								<option value="2004">2004년</option>
								<option value="2003">2003년</option>
								<option value="2002">2002년</option>
								<option value="2001">2001년</option>
								<option value="2000">2000년</option>
								<option value="1999">1999년</option>
								<option value="1998">1998년</option>
								<option value="1997">1997년</option>
								<option value="1996">1996년</option>
								<option value="1995">1995년</option>
								<option value="1994">1994년</option>
								<option value="1993">1993년</option>
								<option value="1992" selected="">1992년</option>
								<option value="1991">1991년</option>
								<option value="1990">1990년</option>
								<option value="1989">1989년</option>
								<option value="1988">1988년</option>
								<option value="1987">1987년</option>
								<option value="1986">1986년</option>
								<option value="1985">1985년</option>
								<option value="1984">1984년</option>
								<option value="1983">1983년</option>
								<option value="1982">1982년</option>
								<option value="1981">1981년</option>
								<option value="1980">1980년</option>
								<option value="1979">1979년</option>
								<option value="1978">1978년</option>
								<option value="1977">1977년</option>
								<option value="1976">1976년</option>
								<option value="1975">1975년</option>
								<option value="1974">1974년</option>
								<option value="1973">1973년</option>
								<option value="1972">1972년</option>
								<option value="1971">1971년</option>
								<option value="1970">1970년</option>
								<option value="1969">1969년</option>
								<option value="1968">1968년</option>
								<option value="1967">1967년</option>
								<option value="1966">1966년</option>
								<option value="1965">1965년</option>
								<option value="1964">1964년</option>
								<option value="1963">1963년</option>
								<option value="1962">1962년</option>
								<option value="1961">1961년</option>
								<option value="1960">1960년</option>
								<option value="1959">1959년</option>
								<option value="1958">1958년</option>
								<option value="1957">1957년</option>
								<option value="1956">1956년</option>
								<option value="1955">1955년</option>
								<option value="1954">1954년</option>
								<option value="1953">1953년</option>
								<option value="1952">1952년</option>
								<option value="1951">1951년</option>
								<option value="1950">1950년</option>
								<option value="1949">1949년</option>
								<option value="1948">1948년</option>
								<option value="1947">1947년</option>
								<option value="1946">1946년</option>
								<option value="1945">1945년</option>
								<option value="1944">1944년</option>
								<option value="1943">1943년</option>
								<option value="1942">1942년</option>
								<option value="1941">1941년</option>
								<option value="1940">1940년</option>
								<option value="1939">1939년</option>
								<option value="1938">1938년</option>
								<option value="1937">1937년</option>
								<option value="1936">1936년</option>
								<option value="1935">1935년</option>
								<option value="1934">1934년</option>
								<option value="1933">1933년</option>
								<option value="1932">1932년</option>
								<option value="1931">1931년</option>
								<option value="1930">1930년</option>
								<option value="1929">1929년</option>
								<option value="1928">1928년</option>
							</select>
						</div>
					</div>
				<div class="col-4">
					<div class="select-group form-group mx-1">
						<label>&nbsp;</label>
							<select class="form-control" name="birthdate_m">
								<option value="1">1월</option>
								<option value="2">2월</option>
								<option value="3">3월</option>
								<option value="4">4월</option>
								<option value="5">5월</option>
								<option value="6">6월</option>
								<option value="7">7월</option>
								<option value="8">8월</option>
								<option value="9">9월</option>
								<option value="10">10월</option>
								<option value="11">11월</option>
								<option value="12">12월</option>
							</select>
						</div>
					</div>
				<div class="col-4">
					<div class="select-group form-group ml-2">
						<label>&nbsp;</label>
						<select class="form-control" name="birthdate_d">
							<option value="1">1일</option>
							<option value="2">2일</option>
							<option value="3">3일</option>
							<option value="4">4일</option>
							<option value="5">5일</option>
							<option value="6">6일</option>
							<option value="7">7일</option>
							<option value="8">8일</option>
							<option value="9">9일</option>
							<option value="10">10일</option>
							<option value="11">11일</option>
							<option value="12">12일</option>
							<option value="13">13일</option>
							<option value="14">14일</option>
							<option value="15">15일</option>
							<option value="16">16일</option>
							<option value="17">17일</option>
							<option value="18">18일</option>
							<option value="19">19일</option>
							<option value="20">20일</option>
							<option value="21">21일</option>
							<option value="22">22일</option>
							<option value="23">23일</option>
							<option value="24">24일</option>
							<option value="25">25일</option>
							<option value="26">26일</option>
							<option value="27">27일</option>
							<option value="28">28일</option>
							<option value="29">29일</option>
							<option value="30">30일</option>
							<option value="31">31일</option>
						</select>
					</div>
				</div>
			</div>
		<div class="row no-gutters mb-3">
			<div class="form-group">
				<label>휴대폰 번호</label>
				<div class="d-flex justify-content-between">
					<div class="input-wrap">
						<input class="form-control text-center my-0" type="tel" name="user_phone" id="phoneNum1" value="010" maxlength="3">
					</div>
					<div class="my-auto mx-1">-</div>
					<div class="input-wrap">
						<input class="form-control text-center my-0" type="tel" name="phone1" id="phoneNum2" maxlength="4">
					</div>
					<div class="my-auto mx-1">-</div>
					<div class="input-wrap">
						<input class="form-control text-center my-0" type="tel" name="phone2" id="phoneNum3" maxlength="4">
					</div>
				</div>
			</div>
		</div>
		<div class="row no-gutters mb-3">
			<div class="form-group">
				<label>이메일</label>
				<div class="d-flex justify-content-between">
					<div class="input-wrap">
						<input class="form-control text-center my-0" type="text" name="emailId" id="emailId" placeholder="이메일">
					</div>
					<div class="my-auto mx-1">@</div>
					<div class="input-wrap">
						<input class="form-control text-center my-0" type="text" name="emailDomain" id="emailDomain" placeholder="ex)naver.com">
					</div>
				</div>
			</div>
		</div>


		<div class="row-wrap mb-3">
			<div class="input-wrap">
				<label>주소</label>
				<input class="form-control mt-1" type="text" name="address" placeholder="주소지">
			</div>
		</div>
		<div class="row no-gutters mb-3">
			<div class="row-wrap">
				<button class="btn btn-success w-100 py-3 mt-3 mb-1 rounded" id="submitBtn" type="submit">
					<h3 class="font-weight-normal">회원가입</h3>
				</button>
				<input type="hidden" name="role" value="ROLE_USER">
		 		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
			</div>
		</div>
	</form> <!-- form END -->
	
</div> <!-- div class col -->

</div> <!-- join page -->

</div>
<!-- container END -->
	<jsp:include page="../footer.jsp" flush="true" />
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
	// csrf 토큰
	let csrfHeaderName = "${_csrf.headerName}"
	let csrfTokenValue="${_csrf.token}"
	
	
	// 비밀번호 유효성 검사를 위해 id="password"인 속성의 값을 저장
	let password = document.getElementById("password");
	
	let confirm_password = document.getElementById("confirm_password");

	function validatePassword(){
		if(password.value != confirm_password.value) { // 만일 두 인풋 필드값이 같지 않을 경우
  		// setCustomValidity의 값을 지정해 무조건 경고 표시가 나게 하고
 		 confirm_password.setCustomValidity("비밀번호 확인이 일치하지 않습니다."); 
		} 
		
        if(password.length < 6 || password.length>16){
            alert('비밀번호는 6글자 이상, 20글자 이하만 이용 가능합니다.');
            password.value='';
        }
		else { // 만일 두 인풋 필드값이 같을 경우
  		// 오류가 없으면 메시지를 빈 문자열로 설정해야한다. 오류 메시지가 비어 있지 않은 한 양식은 유효성 검사를 통과하지 않고 제출되지 않는다.
 		 // 따라서 빈값을 주어 submit 처리되게 한다
  		confirm_password.setCustomValidity(''); 
		}
	} // validatePassword END
	
	password.onchange = validatePassword;
	confirm_password.onkeyup = validatePassword;
	// 여기까지 패스워드 로직
		
		$(document).ready(function(){
				
				// 정규표현식 : 예).com 끝나는 문장 등의 조건이 복잡한 문장을 컴퓨터에게 이해시키기 위한 구문
				let regex = new RegExp("(.*)\.(exe|sh|zip|alz)$");
									// 파일이름 .  exe|sh|zip|alz 인 경우를 체크함
				let maxSize =5242880; // 5Mb
				
				var defaultImg = true;
				
				// img tag 안의 기본 이미지를 select
				let imgselect = document.querySelector(".uploadResult > img");
				console.log(imgselect);
				
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
					
					console.log(inputFile);
					
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
					
					 defaultImg = false;
				});// uploadBtn onclick
				
				let uploadResult = $(".uploadResult");
				
				function showUploadedFile(uploadResultArr){
					let strImage = "";
					let strSpan = "";
					
					$(uploadResultArr).each(function(i, obj){
						console.log(obj);
						console.log(obj.image);
			
							// 수정 후 코드
							//썸네일은 display에 배치 						
							let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" +
																obj.uuid + "_" + obj.fileName);
							// 실제 파일은 download 배치
							let fileCallPath2 = encodeURIComponent(obj.uploadPath +	"/" +
																obj.uuid + "_" + obj.fileName);
							console.log(fileCallPath2);
							strImage = "/display?fileName="+fileCallPath;
							
							strSpan = `<p hidden='hidden' data-path='\${obj.uploadPath}' data-uuid='\${obj.uuid}'
									data-filename='\${obj.fileName}' data-type='\${obj.image}'></p>
									<div>
									<span data-file='\${fileCallPath}' data-type='image'> X </span>
									</div>`;
						
					});

					$(imgselect).attr({ src: strImage });
					uploadResult.append(strSpan);
					
				}// showUploadedFile END
				
				$(".uploadResult").on("click", "span", function(e){
					// 파일이름을 span태그 내부의 data-file에서 얻어와서 저장
					let targetFile = $(this).data("file");
					console.log(targetFile);
					// 이미지 여부를 span태그 내부의 data-type에서 얻어와서 저장
					let type = $(this).data("type");
					console.log(type);
					
					// 클릭한 span태그를 targetLi에 저장
					let targetDiv = $(this).closest("div"); 
					console.log(targetDiv);
					// 하나 더 있네..
					
					
					
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
							
							targetDiv.remove();
							$(imgselect).attr({ src: "/resources/images/main_picture.jpg" });
						
						}
					});//ajax
				});//click span END
				
				
				let imgSrc = jQuery('#default-image').attr("src");
				
				
			
				
				// 제출버튼 막기
				$("#submitBtn").on("click", function(e){
					
					// 1. 버튼의 제출기능을 막습니다.
					e.preventDefault();
					
					// 2. let formObj = $("form");으로 폼태그를 가져옵니다.
					let formObj = $("form");
					
					// 3. 첨부파일과 관련된 정보를 hidden태그들로 만들어 문자로 먼저 저장합니다.
					let str = "";
					
					if(defaultImg == false) {
						$(".uploadResult p").each(function(i, obj){
							
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
					} else {
						
					}

					console.log(str);
					
					// 4. formObj에 append를 이용해 str을 끼워넣습니다.
					formObj.append(str);
					
					// 5. formObj.submit()을 이용해 제출기능이 실행되도록합니다.
					formObj.submit();	
				});
		
			
				
			});// document ready END

		


</script>
	<script src="/resources/basic/sideBar.js"></script>

</html>