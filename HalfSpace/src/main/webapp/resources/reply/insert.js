// reply insert JS코드
			$("#replyAddBtn").on("click", function(){
				
				let replyer = $("#newReplyWriter").val();
				let reply = $("#newReplyText").val();
				
				$.ajax({
					type : 'post',
					url : '/replies',
					beforeSend : function(xhr) {
						 xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
						 },
					headers: {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : 'text',
					data : JSON.stringify({
						bno : bno,
						replyer : replyer,
						reply_content : reply
					}),
					success : function(result){
						if(result == "SUCCESS"){
							
							alert("등록되었습니다.");
							getAllList();
							$("#newReplyText").val('');
						}
					}
					
				});
			});