<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!-- BootStrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<!-- Styles -->
<link rel="stylesheet" href="/resources/uploadAjax.css">
<style>
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<sec:authentication property="principal" var="prin"/>
	<form action="/post/insert" method="post">
		<input type="text" name="title" placeholder="title" required/>
		<input type="text" name="writer" value="${user.userId}" readonly/>
		<div class="col-md-1 mb-3">
			<select class=" form-select" name="catego" aria-label="selelt-catego" required>
			  <option selected>잡담</option>
			  <option value="질문">질문</option>
			  <option value="정보/기사">정보/기사</option>
			  <option value="사진/영상">사진/영상</option>
			  <sec:authorize access="hasAnyRole('ROLE_MANAGER', 'ROLE_ADMIN')">
			  	<option value="공지">공지</option>
			  </sec:authorize>	
			</select>			
		</div>	
		<textarea name="content" required></textarea>
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
		<input type="submit" id="submitBtn">
	</form>
	<div class="uploadDiv">
		<input type="file" name="uploadFile" multiple>
	</div>
	
	<div class="uploadResult">
		<ul>
			<!-- 업로드된 파일들이 여기 나열됨. -->
		</ul>
	</div>
	
	<button id="uploadBtn">Upload</button>
	
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
							// str += `<li>\${obj.fileName}</li>`;
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
									</li>`;
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
	</script>	
	<!--  file insert form js -->
</body>
</html>