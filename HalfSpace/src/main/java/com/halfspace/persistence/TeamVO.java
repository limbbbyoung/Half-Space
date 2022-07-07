package com.halfspace.persistence;

import java.sql.Date;

import lombok.Data;

@Data
public class TeamVO {
	
	private Long tno;
	private String name;
	private String logo;
	private Date regDate;
	private String coach;
	private Long memberCnt;
	private Long matchCnt;
	private String intro;

	
}
