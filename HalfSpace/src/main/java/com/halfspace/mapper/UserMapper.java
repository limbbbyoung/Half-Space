package com.halfspace.mapper;

import com.halfspace.domain.UserVO;

public interface UserMapper {
	
	public UserVO read(String userId);

}