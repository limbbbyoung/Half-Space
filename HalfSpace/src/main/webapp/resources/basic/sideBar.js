		// 사이드바 펼치기
		$("#sidebarCollapse").on("click", function(event) {
			if($("#sidebar").hasClass('active')) {
				$("#sidebar").removeClass('active');
				$(".overlay").removeClass('active');
			} else {
				$("#sidebar").addClass('active');
				$(".overlay").addClass('active');
			}
		});
		
		// 사이드바2 펼치기
		$("#sidebarCollapse2").on("click", function(event) {
			if($("#sidebar2").hasClass('active')) {
				$("#sidebar2").removeClass('active');
				$(".overlay").removeClass('active');
			} else {
				$("#sidebar2").addClass('active');
				$(".overlay").addClass('active');
			}
		});
		
		// 사이드바 접기
		$(".overlay").on("click", function(event) {
			$("#sidebar").removeClass('active');
			$("#sidebar2").removeClass('active');
			$(".overlay").removeClass('active');
		});
	