<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/reply/modal.css">
<sec:authentication property="principal" var="prin"/>
<head>
<style>
	 #btn-filed, #replyAddBtn{
	 	margin-bottom : 10px;
	 	padding : 10px 10px;
        display: inline-block;
        background-color:#244875; 
        color: white;
        border-radius: 20px;
        text-align: center;
        line-height: 100%;
    }
</style>
<meta charset="UTF-8">
<title>boardDetail</title>
</head>
<body>
	<div class="header"></div><!-- .header끝나는 지점 -->
 	<div class="container">
 		<div class="row">
 			<div class="col-6">
 				글제목 : ${board.title } <br/>
			 	글쓴이 : ${board.writer } <br/>
			 	카테고리 : ${board.catego } <br/>
			 	경기날짜 : ${board.gamedate } <br/>
			 	경기장소 : ${board.gameplace } <br/>
			 	글내용 : ${board.content }
			 	<sec:authorize access="isAuthenticated()">
					<c:if test="${prin.authorities eq '[ROLE_ADMIN]' || prin.username eq post.writer}">
					 	<form action="/mainBoard/delete" method="post">
						 	<input type="hidden" value="${board.bno }" name="bno">
						 	<input type="hidden" name="page" value="${param.page }">
							<input type="hidden" name="searchType" value="${param.searchType}">
							<input type="hidden" name="keyword" value="${param.keyword}">
						 	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
						 	<button type="submit" class="btn" id="btn-filed">글 삭제하기</button>
					 	</form>
					 	
					 	<form action="/mainBoard/updateForm" method="post">
						 	<input type="hidden" value="${board.bno }" name="bno">
						 	<input type="hidden" name="page" value="${param.page }">
						    <input type="hidden" name="searchType" value="${param.searchType}">
						    <input type="hidden" name="keyword" value="${param.keyword}">
						 	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
						 	<button type="submit" class="btn" id="btn-filed">글 수정하기</button>
					 	</form>
					 </c:if>
			 	</sec:authorize>
			 	<a class="btn" id="btn-filed" href="/mainBoard/list?page=${param.page }&searchType=${param.searchType }&keyword=${param.keyword}">글 목록</a>
 			</div><!-- .col 끝나는 지점 -->
 			<div class="col-6">
 					<!-- 댓글 -->
				 	<ul id="replies">
				 	
				 	</ul>
				 	
				 	<sec:authorize access="isAuthenticated()">
						<div class="row box-box-success" style="width: 400px; padding: 20px;">
							<div class="box-header">
								<h2 style="color: #244875;">댓글 작성</h2>
							</div><!-- header -->
							<div class="box-body">
								<strong>Writer</strong>
								<input type="text" name="replyer" id="newReplyWriter" class="form-control" value="<sec:authentication property="principal.Username"/>" readonly>
								<strong>ReplyText</strong>
								<input type="text" name="reply" id="newReplyText" class="form-control">
							</div><!-- body -->
							<div class="box-footer">
						        <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token}"/>
						        <button type="button" id="replyAddBtn" class="btn">ADD REPLY</button>
							</div><!-- footer -->
						</div>
					</sec:authorize>
 			</div><!-- .col 끝나는 지점 -->
 		</div><!-- .row 끝나는 지점 -->
 	</div><!-- .container 끝나는 지점 -->
 	<div class="footer"></div><!-- .footer 끝나는 지점 -->
 	<hr>	
	<!-- modal -->
	<div id="modDiv" style="display:none;">
		<div class="modal-title"></div>
		<div>
			<input type="text" id="replyText" style="width: 200px; height: 50px;">
		</div>
			<sec:authorize access="isAuthenticated()">
				<c:if test="${prin.authorities eq '[ROLE_ADMIN]' || prin.username eq post.writer}">
					<div>
						<button type="button" id="replyModBtn">수정하기</button>
						<button type="button" id="replyDelBtn">삭제하기</button>
						<button type="button" id="closeBtn">닫기</button>
					</div>
			    </c:if>
			</sec:authorize>
	</div>
	 	
 	<!-- jquery는 이곳에 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- 댓글 목록을 가져오는 JS파일 첨부 -->
	<script src="/resources/reply/getAllList.js"></script>
	
 	<script type="text/javascript">
		
 		let csrfHeaderName = "${_csrf.headerName}"
		
		let csrfTokenValue= "${_csrf.token}"
 		
			// List를 가져오는 로직
			let bno = ${board.bno };
			function getAllList(){
				// json 데이터를 얻어오는 로직 실행
				$.getJSON("/replies/all/" + bno, function(data){
					
					let str = "";
					console.log(data.length);
					
					$(data).each(
							function(){					
								// 백틱 문자열 사이에 변수를 넣고 싶다면 \${변수명}을 적습니다.
								// 원래는 \를 왼쪽에 붙일 필요는 없지만
								// jsp에서는 el표기문법이랑 겹치기 때문에 el이 아님을 보여주기 위해
								// 추가로 왼쪽에 \를 붙입니다.
								
								// UNIX 시간을 우리가 알고 있는 형식으로 바꿔보겠습니다.
								let timestamp = this.updateDate;
								// UNIX 시간이 저장된 timestamp를 Date 생성자로 변환합니다.
								let date = new Date(timestamp);
								// 변수 formattedTime에 변환된 시간을 저장해 출력해보겠습니다.
								let formattedTime = `게시일 : 
													\${date.getFullYear()}년
												    \${(date.getMonth()+1)}월
													\${date.getDate()}일`;
													console.log(this.reply_content);
								str += `<div class='replyLi' data-rno='\${this.rno}'>
										<strong>@\${this.replyer}</strong> - \${formattedTime} <br/>
										<div class="replyText"> \${this.reply_content} </div> 
										<button type='button' class='btn btn-info'>수정/삭제</button>
										</div>`;
						});
					console.log(str);
					$("#replies").html(str);
				});
			}
			getAllList();
			
			// 이벤트 위임 
			// 1. ul#replies가 이벤트를 걸고 싶은 버튼 전체의 집합이므로 먼저 집합 전체에 이벤트를 겁니다.
			// 2. #replies의 하위 항목 중 최종 목표 태그를 기입해줍니다.
			// 3. 단, 여기서 #replies와 button 사이에 다른 태그가 끼어있다면 경유하는 형식으로 호출해도 됩니다.
			$("#replies").on("click", ".replyLi button", function(){ // .on(동작, 지정 태그(ul->li->button), 기능(function))
				// 4. 콜백함수 내부의 this는 내가 클릭한 button이 됩니다.
				// 1. prev().prev()... 등과 같이 연쇄적으로 prev, next를 걸어서 고르기
				// 2. prev("태그선택자")를 써서 뒤쪽이나 앞쪽 형제 중 조건에 맞는것만 선택
				// 3. siblings("태그선택자")는 next, prev 모두를 범위로 조회합니다.
				let reply_content = $(this).parent(); // this 키워드를 내부에서 쓸려면 화살표 함수를 쓰면 안됨
				// this는 해당 버튼을 지정, 따라서 버튼의 부모태그는 <li>이다.
				
				// attr() : attribute, attr("태그 내 속성명") => 해당 속성에 부여된 값을 가져옵니다.
				// ex) <li data-rno="33"> => rno에 33을 저장해줍니다. data-rno는 태그 내부에 rno 데이터를 저장한다는 의미.
				let rno = reply_content.attr("data-rno");
				$(".modal-title").html(rno);
				reply_content = $(this).prev(".replyText");
				let replytext = reply_content.text(); // .text()는 태그 안에 있는 모든 텍스트를 다 가져옴
				
				$("#replyText").val(replytext);
				$("#modDiv").show("slow");
				// 화면 기능을 구성할 때 원하는 태그만을 골라서 디테일하게 기능을 구현하는데 있어서
				// 어려움을 느낄 것으로 예상, 그러므로 이 점에 집중해서 화면단 기능 구성
			});  
 	</script>
 	
 	<!-- modal 기능들 -->
	<script src="/resources/reply/insert.js"></script>
 	<!-- delete 기능 -->
	<script src="/resources/reply/delete.js"></script>
	<!-- update 기능 -->
	<script src="/resources/reply/modify.js"></script>
	<!-- close 기능 -->
	<script src="/resources/reply/modalclose.js"></script>
	
</body>
</html>