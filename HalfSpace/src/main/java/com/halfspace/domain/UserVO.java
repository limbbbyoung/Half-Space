package com.halfspace.domain;


import java.sql.Date;
import java.util.List;


import lombok.Data;

@Data
public class UserVO {
	
	private String userId;
	private String userPw;
	private String userName;
	private String gender;
	private Date birthdate;
	private String email;
	private String phoneNum;
	private String address;
	private String myteam;
	
	private List<AuthVO> authList;
	
	// user의 이미지경로인 user attachVO 를 list형식으로 저장
	private List<UserAttachVO> attachList;
}