package com.halfspace.persistence;

import java.sql.Date;

import lombok.Data;

@Data
public class TeamVO {
	
	private Long teamNum;
	private String teamName;
	private String teamLogo;
	private Date teamRegDate;
	private String coach;
	private Long memberCnt;
	private Long matchCnt;
	private String teamInfo;

}
