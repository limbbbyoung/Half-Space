$('#comment').on("click", ".commentLi button", function(){
	let comment = $(this).siblings(".comText");
	let cno = comment.parent().attr("data-cno");
	let comText = comment.text();
	
	$(".modal-title").html(cno);
	$("#comText").val(comText);
	$("#modDiv").show('slow');
});
