package com.halfspace.mapper;

import java.util.List;

import com.halfspace.domain.AuthVO;
import com.halfspace.domain.UserVO;
import com.halfspace.persistence.SearchCriteria;

public interface AdminMapper {
	
	public List<UserVO> getUserList(SearchCriteria cri);

	public Long getUserCnt(SearchCriteria cri);
	
	public AuthVO alterUserAuth();
}
