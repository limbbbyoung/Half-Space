package com.halfspace.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.halfspace.domain.UserVO;
import com.halfspace.mapper.UserMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper mapper;
	
	// 트렌젝션 걸면 더 좋음
	@Transactional
	@Override
	public void insertUser(UserVO vo) {
		
		mapper.insertUserTbl(vo);
		
		mapper.insertUserAuth(vo);	
		
		log.info("여기는 service : " + vo);
	}

	@Override
	public UserVO read(String userId) {
		
		return mapper.read(userId);
	}

	@Override
	public void updateUser(UserVO vo) {
		mapper.updateUser(vo);
		
	}

}
