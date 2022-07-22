package com.halfspace.mapper;

import java.util.List;

import com.halfspace.persistence.TeamAttachVO;

public interface TeamAttachMapper {

	public void insert(TeamAttachVO vo);
	
	public void delete(String uuid);
	
	public List<TeamAttachVO> findBytno(Long tno);
	
	public void deleteAll(Long tno);
	
	public List<TeamAttachVO> getOldFiles();
	
}
