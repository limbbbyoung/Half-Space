package com.halfspace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.halfspace.domain.UserVO;
import com.halfspace.mapper.AdminMapper;
import com.halfspace.mapper.UserMapper;
import com.halfspace.persistence.SearchCriteria;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private UserMapper umapper;
	
	@Autowired
	private AdminMapper amapper;
	
	@Override
	public List<UserVO> getUserList(SearchCriteria cri) {
		return amapper.getUserList(cri);
		
	}

	@Override
	public Long getUserCnt(SearchCriteria cri) {
		return amapper.getUserCnt(cri);
	}

	@Override
	public UserVO read(String userId) {
		
		return umapper.read(userId);
	}

	@Override
	public void DeleteUserAuth(String userId) {
		
		amapper.DeleteUserAuth(userId);
	}

	@Override
	public void updateUserAuth(String userId, String auth) {
		
		amapper.updateUserAuth(userId, auth);
	}

}
