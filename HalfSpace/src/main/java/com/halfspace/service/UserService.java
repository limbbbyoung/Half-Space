package com.halfspace.service;

import java.util.List;

import com.halfspace.domain.UserAttachVO;
import com.halfspace.domain.UserVO;


// Service의 기준은 사용자입장에서 하나의 동작이 하나의 서비스가 되는 것이다.
// User기준에서 하나의 기능을 만들고자 한다면 하나의 서비스를 생성하면 됨
public interface UserService {
	
	public void insertUser(UserVO vo);
	
	public UserVO read(String userId);
	
	public void updateUser(UserVO vo);
	
	// post 번호 pono 입력시 해당 글번호에 연동된 첨부파일 목록 가져오기
	public List<UserAttachVO> getAttachList(String userId);

}
