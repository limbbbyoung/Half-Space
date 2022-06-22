package com.halfspace.persistence;

import java.sql.Date;

import lombok.Data;

@Data
public class MainBoardVO {
		
	private Long bno;
	private String title;
	private String catego;
	private Long hit;
	private String content;
	private String writer;
	private String image;
	private Date regdate;
	private Date updatedate;
	private Date gamedate;
	private String gameplace;
	
	/* Oracle DB 테이블 구조
	-- board_tbl
	 CREATE sequence board_num;
	 ALTER SEQUENCE board_num NOCACHE;
	 
	CREATE TABLE board_tbl (
	    bno number(10,0) primary key,
	    title varchar2(50) not null, -- 글제목
	    catego varchar2(10) not null, -- 카테고리 : 축구, 풋살 
	    hit number(10,0) default 0, -- 글 조회수
	    content varchar2(2000) not null, -- 글내용
	    writer varchar2(50) not null,-- 글쓴이
	    image varchar2(200), -- 이미지
	    CONSTRAINT fk_code2 FOREIGN KEY(writer)
	    REFERENCES user_tbl(user_id)
	    ON DELETE CASCADE,
	    regdate date default sysdate, -- 등록날짜
	    updatedate date default sysdate, -- 업데이트날짜
	    gamedate date not null, -- 경기 날짜 및 시간
	    gameplace varchar2(50) not null -- 경기 장소
	    );  */
	
}
