	function getAllList(){
			// json 데이터를 얻어오는 로직 실행
			$.getJSON("/replies/all/" + bno, function(data){
				
				let str = "";
				console.log(data.length);
				
				$(data).each(
						function(){					
							// 백틱 문자열 사이에 변수를 넣고 싶다면 \${변수명}을 적습니다.
							// 원래는 \를 왼쪽에 붙일 필요는 없지만
							// jsp에서는 el표기문법이랑 겹치기 때문에 el이 아님을 보여주기 위해
							// 추가로 왼쪽에 \를 붙입니다.
							
							// UNIX 시간을 우리가 알고 있는 형식으로 바꿔보겠습니다.
							let timestamp = this.updateDate;
							// UNIX 시간이 저장된 timestamp를 Date 생성자로 변환합니다.
							let date = new Date(timestamp);
							// 변수 formattedTime에 변환된 시간을 저장해 출력해보겠습니다.
							let formattedTime = `게시일 : 
												\${date.getFullYear()}년
											    \${(date.getMonth()+1)}월
												\${date.getDate()}일`;
												console.log(this.reply_content);
							str += `<div class='replyLi' data-rno='\${this.rno}'>
									<strong>@\${this.replyer}</strong> - \${formattedTime} <br/>
									<div class="replyText"> \${this.reply_content} </div> 
									<button type='button' class='btn btn-info'>수정/삭제</button>
									</div>`;
					});
				console.log(str);
				$("#replies").html(str);
			});
		}