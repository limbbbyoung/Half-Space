package com.halfspace.persistence;


import java.util.Date;

import lombok.Data;

@Data
public class TeamListVO {
	
	private Long listno; // 팀리스트번호
	private String name; // 팀이름
	private String coach; // 감독이름
	private Date regdate; // 팀 생성일
	private Long memberCnt; // 팀원수
}
