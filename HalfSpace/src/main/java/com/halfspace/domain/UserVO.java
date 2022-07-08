package com.halfspace.domain;

import java.time.LocalDate;
import java.util.List;

import lombok.Data;

@Data
public class UserVO {
	
	private String userId;
	private String userPw;
	private String userName;
	private String gender;
	private LocalDate birthdate;
	private String email;
	private String phoneNum;
	private String address;
	
	private List<AuthVO> authList;

}