package com.halfspace.service;

import com.halfspace.domain.UserVO;

// Service의 기준은 사용자입장에서 하나의 동작이 하나의 서비스가 되는 것이다.
// User기준에서 하나의 기능을 만들고자 한다면 하나의 서비스를 생성하면 됨
public interface UserService {
	
	public void insertUser(UserVO vo);

}