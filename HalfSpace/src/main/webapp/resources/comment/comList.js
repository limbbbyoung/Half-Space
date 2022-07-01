	function getAllList(){
			// json 데이터를 얻어오는 로직 실행
			$.getJSON("/comment/all/" + pono, function(data){
				
				let str = "";
				console.log(data.length);
				
				$(data).each(
						function(){					
							let timestamp = this.updateDate;
							
							let date = new Date(timestamp);
							
							let formattedTime = `게시일 : 
												\${date.getFullYear()}년
											    \${(date.getMonth()+1)}월
												\${date.getDate()}일`;
												console.log(this.reply_content);
							str += `<div class='commentLi' data-cno='\${this.cno}'>
									<strong>@\${this.user_id}</strong> - \${formattedTime} <br/>
									<div class="comText"> \${this.c_content} </div> 
									<button type='button' class='btn btn-info'>수정/삭제</button>
									</div>`;
					});
				console.log(str);
				$("#comment").html(str);
			});
		}
		
		getAllList();