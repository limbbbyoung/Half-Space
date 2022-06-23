// 수정버튼 작동
$("#replyModBtn").on("click", function() {
			
	let cno = $(".modal-title").html();
	let replytext = $("#replyText").val();
			
	$.ajax({
		type : 'put', // patch도 된다.
		url : '/comment/' + cno,
		header : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "PUT" // patch도 된다.
		},
		contentType : "application/json",
		data : JSON.stringify({c_content : replytext}),
		datatype : 'text',
		success : function(result) {
			console.log("result : " + result);
			if (result === "SUCCESS") {
				alert("수정 되었습니다.");
				$("#modDiv").hide("slow");
				getAllList();
			}
		}
	});
});