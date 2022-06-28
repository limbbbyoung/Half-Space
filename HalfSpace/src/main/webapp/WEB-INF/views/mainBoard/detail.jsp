<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/restTest/modal.css">
<head>
<meta charset="UTF-8">
<title>boardDetail</title>
</head>
<body>
 	${board} <br/>
 	<hr>
 	글제목 : ${board.title } <br/>
 	글쓴이 : ${board.writer } <br/>
 	카테고리 : ${board.catego } <br/>
 	경기날짜 : ${board.gamedate } <br/>
 	경기장소 : ${board.gameplace } <br/>
 	글내용 : <textarea rows="20" cols="50">${board.content }</textarea>
 	<form action="/mainBoard/delete" method="post">
	 	<input type="hidden" value="${board.bno }" name="bno">
	 	<input type="hidden" name="page" value="${param.page }">
		<input type="hidden" name="searchType" value="${param.searchType}">
		<input type="hidden" name="keyword" value="${param.keyword}">
	 	<button type="submit">글 삭제하기</button>
 	</form>
 	
 	<form action="/mainBoard/updateForm" method="post">
	 	<input type="hidden" value="${board.bno }" name="bno">
	 	<input type="hidden" name="page" value="${param.page }">
	    <input type="hidden" name="searchType" value="${param.searchType}">
	    <input type="hidden" name="keyword" value="${param.keyword}">
	 	<button type="submit">글 수정하기</button>
 	</form>
 	<a class="btn btn-primary" href="/mainBoard/list?page=${param.page }&searchType=${param.searchType }&keyword=${param.keyword}">글 목록</a>
 	<!-- 댓글 -->
 	<ul id="replies">
 	
 	</ul>
 	
 	<hr>
		<div class="row box-box-success">
			<div class="box-header">
				<h2 class="text-primary">댓글 작성</h2>
			</div><!-- header -->
			<div class="box-body">
				<strong>Writer</strong>
				<input type="text" name="replyer" id="newReplyWriter" class="form-control">
				<strong>ReplyText</strong>
				<input type="text" name="reply" id="newReplyText" class="form-control">
			</div><!-- body -->
			<div class="box-footer">
		        <button type="button" id="replyAddBtn" class="btn btn-primary">ADD REPLY</button>
			</div><!-- footer -->
		</div>
 	
 	
	<!-- modal -->
	<div id="modDiv" style="display:none;">
		<div class="modal-title"></div>
		<div>
			<input type="text" id="replyText" style="width: 200px; height: 50px;">
		</div>
		<div>
			<button type="button" id="replyModBtn">Modify</button>
			<button type="button" id="replyDelBtn">Delete</button>
			<button type="button" id="closeBtn">Close</button>
		</div>
	</div>
	
 	<!-- jquery는 이곳에 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- 댓글 목록을 가져오는 JS파일 첨부 -->
	<script src="/resources/reply/getAllList.js"></script>
	
 	<script type="text/javascript">
 		
			// List를 가져오는 로직
			let bno = ${board.bno };
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
	<!-- insert 기능 -->
	<script src="/resources/reply/modalclose.js"></script>
 	<!-- delete 기능 -->
	<script src="/resources/reply/delete.js"></script>
	<!-- update 기능 -->
	<script src="/resources/reply/modify.js"></script>
	<!-- close 기능 -->
	<script src="/resources/reply/modalclose.js"></script>
	
</body>
</html>