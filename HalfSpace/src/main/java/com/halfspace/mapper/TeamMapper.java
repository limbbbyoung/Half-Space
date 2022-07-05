package com.halfspace.mapper;

import java.util.List;

import com.halfspace.persistence.TeamVO;

public interface TeamMapper {

	public TeamVO teamDetail(Long teamNum);
	
	public void teamCreate(TeamVO vo);
	
	public void teamUpdate(TeamVO vo);
	
	public void teamDelete(Long teamNum);
	
}
