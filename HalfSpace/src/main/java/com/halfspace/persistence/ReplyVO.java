package com.halfspace.persistence;

import java.sql.Date;

import lombok.Data;

@Data
public class ReplyVO {
	
	private Long rno;
	private Long bno;
	private String replyContent;
	private String replyer;
	private Date replyDate;
	private Date updateDate;
	
	/*
	 CREATE TABLE reply_tbl (
    rno number(10,0) primary key,
    bno number(10,0) not null,
    reply_content varchar2(1000) not null,
    replyer varchar2(20) not null,
    --CONSTRAINT fk_code9 FOREIGN KEY(replyer)
    --REFERENCES user_tbl(user_id),
    replyDate date default sysdate,
    updateDate date default sysdate
    ); */
}
