package com.halfspace.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.halfspace.persistence.LikeVO;


public interface LikeMapper {
	
	public List<LikeVO> getLikeList();
	
	public LikeVO getLike(@Param("userId")String userId, @Param("pono")Long pono);
	
	// like 생성
	public void likey(LikeVO vo);
	
	// like 삭제
	public void unlikey(@Param("userId")String userId, @Param("pono")Long pono);
	
	public void likeCntUp(Long pono);
	
	public void likeCntDown(Long pono);


}
