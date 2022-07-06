package com.halfspace.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class UserVO {
	
	private String userId;
	private String userPw;
	private String userName;
	private boolean gender;
	private Date birthDate;
	private String email;
	private String phoneNum;
	private String address;
	
	private List<AuthVO> authList;

}
