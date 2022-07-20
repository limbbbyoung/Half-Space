			$("#replyAddBtn").on("click", function(){
				
				let replyCount = $("#newReplyCount").val();
				
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
							replycount : replyCount
					}),
					success : function(result){
						if(result == "SUCCESS"){
							
							alert("등록되었습니다.");
							getAllList();
							$("#newReplyCount").val(replyCount);
						}
					}
					
				});
				
			});
			