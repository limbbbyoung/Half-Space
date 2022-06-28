package com.halfspace.persistence;

import lombok.Data;

@Data
public class TeamVO {
	
	private Long teamId;
	private String teamName;
	private String teamLogo;
	private Long coach;
	private Long teammateId;
	private Long matchCnt;

}
