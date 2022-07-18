		// 수정버튼 작동
		$("#comModBtn").on("click", function(){
		    let cno = $(".modal-title").html();
		    console.log(cno);
		    let comText = $("#comText").val();

		    $.ajax({
		        type : 'put',
		        url : '/comment/' + cno, 
		        
		        beforeSend : function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
				},
		        
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
