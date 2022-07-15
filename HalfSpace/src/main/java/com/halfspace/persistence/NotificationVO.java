package com.halfspace.persistence;


import java.sql.Date;

import lombok.Data;

@Data
public class NotificationVO {
	
	private Long notId; // PK
	private String memId; // 알림을 받는 회원 PK
	private String targetMemId; // 해당 알림을 받게 하는 액션을 취한 회원 PK
	private String notType; // 알림 종류 ( comment, comment_comment, note, reply )
	private Long notContentId; // 알림이 있게 한 글의 PK
	private String notMessage; // 알림 내용 
	private String notUrl; // 알림 클릭시 이동할 주소
	private Date notDatetime; // 알림 발생 일시
	private Date notReadDatetime; // 알림 확인 일시

}