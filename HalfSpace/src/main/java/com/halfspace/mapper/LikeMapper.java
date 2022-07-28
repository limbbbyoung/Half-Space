package com.halfspace.mapper;

import java.util.List;

import com.halfspace.persistence.LikeVO;


public interface LikeMapper {
	
	public List<LikeVO> getLikeList();
	
	public LikeVO getLike(LikeVO vo);
	
	// like 생성
	public void likey(LikeVO vo);
	
	// like 삭제
	public void unlikey(LikeVO vo);
	
	public void likeCntUp(Long pono);
	
	public void likeCntDown(Long pono);


}
