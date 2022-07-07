package com.halfspace.persistence;

import java.sql.Date;

import lombok.Data;

@Data
public class CafeListVO {
	
	private Long cafeNo;
	private String cafeAddress;
	private String cafeMaster;
	private Date regDate;
}
