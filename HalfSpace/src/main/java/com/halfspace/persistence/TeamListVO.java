package com.halfspace.persistence;

import java.sql.Date;

import lombok.Data;

@Data
public class TeamListVO {
	
	private Long listno;
	private String name;
	private String coach;
	private Date regdate;
	private Long memberCnt;


	
	

}
