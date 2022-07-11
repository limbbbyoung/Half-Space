package com.halfspace.persistence;

import java.sql.Date;

import lombok.Data;

@Data
public class TeamVO {
	
	private Long tno;
	private String name;
	private String coach;
	private String logo;
	private Long matchCnt;
	private String intro;
	private Long win;
	private Long draw;
	private Long lose;

	
}
