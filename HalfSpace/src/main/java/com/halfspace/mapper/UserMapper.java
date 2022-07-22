package com.halfspace.mapper;



import java.util.List;

import com.halfspace.domain.UserAttachVO;
import com.halfspace.domain.UserVO;


public interface UserMapper {
	
	public UserVO read(String userId);
	
	public void insertUserTbl(UserVO vo);
	
	public void insertUserAuth(UserVO vo);
	
	public void updateUser(UserVO vo);
	
	

}
