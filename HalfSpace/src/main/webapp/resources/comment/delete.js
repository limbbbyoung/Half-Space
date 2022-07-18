		// 삭제버튼 이벤트
		$("#comDelBtn").on("click", function(){
			let cno = $(".modal-title").html();
			
			$.ajax({
				type : 'delete',
				url : '/comment/' + cno,
				
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				
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
