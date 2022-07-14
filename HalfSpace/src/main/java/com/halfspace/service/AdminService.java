package com.halfspace.service;

import java.util.List;

import com.halfspace.domain.AuthVO;
import com.halfspace.domain.UserVO;
import com.halfspace.persistence.SearchCriteria;

public interface AdminService {
	
	public List<UserVO> getUserList(SearchCriteria cri);

	public Long getUserCnt(SearchCriteria cri);
	
	public UserVO read(String userId);

	// 권한 삭제
	public void DeleteUserAuth(String userId);
	
	// 권한 수정(권한 승급 or 강등)
	public void updateUserAuth(AuthVO vo);

	
}
