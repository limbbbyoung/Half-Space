package com.halfspace.mapper;

import java.util.List;

import com.halfspace.domain.UserAttachVO;


public interface UserAttachMapper {


	public void insert(UserAttachVO vo);
	
	public void delete(String uuid);
	
	public List<UserAttachVO> findByUid(String userId);
	
	public List<UserAttachVO> getOldFiles();
	
}
