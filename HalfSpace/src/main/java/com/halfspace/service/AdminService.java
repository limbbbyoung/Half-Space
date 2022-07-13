package com.halfspace.service;

import java.util.List;

import com.halfspace.domain.UserVO;
import com.halfspace.persistence.SearchCriteria;

public interface AdminService {
	
	public List<UserVO> getUserList(SearchCriteria cri);

	public Long getUserCnt(SearchCriteria cri);
	
	public UserVO read(String userId);

}
