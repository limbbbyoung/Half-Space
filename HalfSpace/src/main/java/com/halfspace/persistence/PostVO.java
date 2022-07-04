package com.halfspace.persistence;

import java.sql.Date;

import lombok.Data;
@Data
public class PostVO {
	
	private Long pono;
	private String title;
	private String catego;
	private String writer;
	private String content;
	private String image;
	private Long hit;
	private Date regDate;
	private Date updateDate;
	private Long commentCnt;
	
}
