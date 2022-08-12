package com.halfspace.service;

import java.util.List;

import com.halfspace.persistence.LikeVO;

public interface LikeService {
	
	public List<LikeVO> getLikeList();

	public LikeVO getLike(String userId, Long pono);
	
	// like 생성
	public void likey(LikeVO vo);
	
	// like 삭제
	public void unlikey(String userId, Long pono);

}
