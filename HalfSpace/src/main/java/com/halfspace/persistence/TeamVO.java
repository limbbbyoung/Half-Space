package com.halfspace.persistence;

import lombok.Data;

@Data
public class TeamVO {
	
	private Long tno; // 팀번호, 팀번호는 어차피 팀 리스트 테이블의 listno를 외래키로 받아오기 때문에
						// 이런 외래키 성질을 잘 활용해야함
	private String name; // 팀이름
	private String coach; // 감독이름
	private String logo; // 로고이미지 저장을 위한 String 자료형
	private Long matchCnt; // 경기수
	private String intro; // 팀 자기소개 
	private Long win; // 승리
	private Long draw; // 무승부
	private Long lose; // 패배

	
}
