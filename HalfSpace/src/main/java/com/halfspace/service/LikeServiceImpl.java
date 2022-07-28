package com.halfspace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.halfspace.mapper.LikeMapper;
import com.halfspace.mapper.PostMapper;
import com.halfspace.persistence.LikeVO;
@Service
public class LikeServiceImpl implements LikeService{

	@Autowired
	private LikeMapper mapper;
	@Autowired
	private PostMapper postmapper;
	
	@Override
	public List<LikeVO> getLikeList() {
		
		return null;
	}

	@Transactional
	@Override
	public void likey(LikeVO vo) {
		mapper.likeCntUp(vo.getPono());
		mapper.likey(vo);
		
	}


	@Override
	public LikeVO getLike(LikeVO vo) {
	
		return mapper.getLike(vo);
	}

	@Override
	public void unlikey(LikeVO vo) {
		mapper.likeCntDown(vo.getPono());
		mapper.unlikey(vo);
		
	}

}
