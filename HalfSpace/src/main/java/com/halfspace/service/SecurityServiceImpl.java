package com.halfspace.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.halfspace.domain.UserVO;
import com.halfspace.mapper.UserMapper;

@Service
public class SecurityServiceImpl implements SecurityService{

	@Autowired
	private UserMapper mapper;
	
	// 트렌젝션 걸면 더 좋음
	// @Transactional
	@Override
	public void insertUser(UserVO vo) {
		
		mapper.insertUserTbl(vo);
		
		mapper.insertUserAuth(vo);	
	}

}
