package com.halfspace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.halfspace.domain.UserAttachVO;
import com.halfspace.domain.UserVO;
import com.halfspace.mapper.UserAttachMapper;
import com.halfspace.mapper.UserMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper mapper;
	
	@Autowired
	private UserAttachMapper attachMapper;
	
	// 트렌젝션 걸면 더 좋음
	@Transactional
	@Override
	public void insertUser(UserVO vo) {
		
		mapper.insertUserTbl(vo);
		
		mapper.insertUserAuth(vo);	
		
		log.info("여기는 service : " + vo);
		
		// vo에 attachList(이미지 리스트)가 없다면 여기서 insert service 종료
		if(vo.getAttachList() == null || vo.getAttachList().size() <= 0) {
			return;
		}
		
		log.info("첨부파일 발견");
		
		vo.getAttachList().forEach(attach -> {
			attach.setUserId(vo.getUserId());
			attachMapper.insert(attach);
		});
	}

	@Override
	public UserVO read(String userId) {
		
		return mapper.read(userId);
	}

	@Override
	public void updateUser(UserVO vo) {
		mapper.updateUser(vo);
		
	}

	@Override
	public List<UserAttachVO> getAttachList(String userId) {
		
		return attachMapper.findByUid(userId);
	}

}
