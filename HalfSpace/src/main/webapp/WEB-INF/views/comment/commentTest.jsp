<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/resources/comment/modal.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>comment 나와주세요</h2>
	
	<div>
		<div>
			user_id<input type="text" name="user_id" id="newWriter">
		</div>
		<div>
			c_content<input type="text" name="c_content" id="newContent">
		</div>
		<button id="commentAdd">댓글 생성</button>
	</div>
	
	<!-- comment 영역 -->
	<ul id="comment">
	
	</ul>
	
	
	<div id="modDiv" style="display:none;">
		<div class="modal-title"></div>
		<div>
			<input type="text" id="comText">
		</div>
		<div>
			<button type="button" id="comModBtn">Modify</button>
			<button type="button" id="comDelBtn">Delete</button>
			<button type="button" id="closeBtn">Close</button>
		</div>
	</div>
	
	


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script type="text/javascript">
		let pono = 9223;
		
		
		// 댓글 전체 불러오기
		function getAllList() {
			
			let str = "";
			
			$.getJSON("/comment/all/" + pono, function(data) {
				
				
				console.log(data.length);
				
				$(data).each(
					function() {
						str += `<li data-cno='\${this.cno}' class='commentLi'>\${this.cno} \${this.user_id} \${this.c_content}<button>수정/삭제</button></li>`;
					});
				console.log(str);
				$("#comment").html(str);
			});
		}
		
		getAllList();
		
		// 아래는 commentAdd 로직
		
		$("#commentAdd").on("click", function() {
			
			let writer = $("#newWriter").val();
			let c_content = $("#newContent").val();
			
			$.ajax({
				type : 'post',
				url : '/comment',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					pono : pono,
					user_id : writer,
					c_content : c_content
				}),
				
				success : function(result) {
					
					if(result == 'SUCCESS') {
						alert("등록되었습니다.")
						
						getAllList();
						
						$("#newWriter").val('');
						$("newContent").val('');
						
					}
				}
				
			});
		});// 댓글 등록 END
		
		$("#comment").on("click", ".commentLi button", function() {
			
			let c_content = $(this).parent();
			
			let cno = c_content.attr("data-cno");
			
			let comText = c_content.text();
			
			$(".modal-title").html(cno);
			$("#comText").val(comText);
			$("#modDiv").show("slow");
			
		}); // modal 보여주기 END
	
		// 삭제버튼 이벤트
		$("#comDelBtn").on("click", function(){
			let cno = $(".modal-title").html();
			
			$.ajax({
				type : 'delete',
				url : '/comment/' + cno,
				header : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Overide" : "DELETE"
				},
				dataType : "text",
				success : function(result){
					console.log("result: " + result);
					if(result == 'SUCCESS'){
						alert("삭제 되었습니다.");
						// 모달닫기
						$("#modDiv").hide("slow");
						// 삭제된 이후 목록 가져와서 갱신하기
						getAllList();
					}
				}
			})
		}); // comDelBtn END
		
		// 수정버튼 작동
		$("#comModBtn").on("click", function(){
		    let cno = $(".modal-title").html();
		    console.log(cno);
		    let comText = $("#comText").val();

		    $.ajax({
		        type : 'put',
		        url : '/comment/' + cno, 
		        header : {
		            "Content-Type" : "application/json",
		            "X-HTTP-Method-Override" : "PUT"
		        },
		        contentType : "application/json",
		        data : JSON.stringify({c_content:comText}),
		        dataType : 'text',
		        success : function(result){
		            console.log("result: " + result);
		            if(result == 'SUCCESS'){
		                alert("수정 되었습니다.");
		                // modal 닫기
		                $('#modDiv').hide("slow");
		                // 삭제된 이후 목록 가져와서 갱신하기
		                getAllList();
		            }
		        }
		    });
		}); // modify END

		
	</script>
	
</body>
</html>