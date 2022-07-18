package com.halfspace.mapper;

import java.util.List;

import com.halfspace.persistence.BoardAttachVO;

public interface BoardAttachMapper {
	
	public void insert(BoardAttachVO vo);
	
	public void delete(String uuid);
	
	public List<BoardAttachVO> findByBno(Long bno);

}
