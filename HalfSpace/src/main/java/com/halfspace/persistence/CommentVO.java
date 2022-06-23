package com.halfspace.persistence;

import java.sql.Date;

import lombok.Data;

@Data
public class CommentVO {

	private Long cno;
	private Long pono;
	private String c_content;
	private String user_id;
	private Date replyDate;
	private Date updateDate;
	
}