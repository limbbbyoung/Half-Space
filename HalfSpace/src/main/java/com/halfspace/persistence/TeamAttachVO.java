package com.halfspace.persistence;

import lombok.Data;

@Data
public class TeamAttachVO {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType;
	
	private Long tno; // Team 고유 number
	
}
