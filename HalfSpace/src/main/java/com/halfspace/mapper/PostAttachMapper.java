package com.halfspace.mapper;

import java.util.List;

import com.halfspace.persistence.PostAttachVO;

public interface PostAttachMapper {

	public void insert(PostAttachVO vo);
	
	public void delete(String uuid);
	
	public List<PostAttachVO> findByPono(Long pono);
	
	public void deleteAll(Long pono);
	
}
