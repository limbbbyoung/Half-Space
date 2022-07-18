package com.halfspace.persistence;


import java.sql.Date;

import lombok.Data;

@Data
public class NotificationVO {
	
	private Long not_id; // PK
	private String mem_id; // 알림을 받는 회원 PK
	private String target_mem_id; // 해당 알림을 받게 하는 액션을 취한 회원 PK
	private String not_type; // 알림 종류 ( comment, comment_comment, note, reply )
	private Long not_content_id; // 알림이 있게 한 글의 PK
	private String not_message; // 알림 내용 
	private String not_url; // 알림 클릭시 이동할 주소
	private Date not_datetime; // 알림 발생 일시
	private Date not_read_datetime; // 알림 확인 일시

}