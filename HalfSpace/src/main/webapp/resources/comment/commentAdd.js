		// 아래는 commentAdd 로직

		$("#commentAdd").on("click", function() {
			
			let writer = $("#newWriter").val();
			let c_content = $("#newContent").val();
			
			$.ajax({
				type : 'post',
				url : '/comment',
				
				beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
				
				
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
						
						$("newContent").val('');
						
					}
				}
				
			});
		});// 댓글 등록 END