package com.halfspace.persistence;

import java.sql.Date;
import java.util.List;

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
	private Long likeCnt;
	
	// post의 이미지 list를 저장
	private List<PostAttachVO> attachList;
	
}
