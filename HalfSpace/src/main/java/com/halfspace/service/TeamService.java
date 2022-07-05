package com.halfspace.service;

import com.halfspace.persistence.TeamVO;

public interface TeamService {

	public TeamVO teamDetail(Long teamNum);
	
	public void teamCreate(TeamVO vo);
	
	public void teamUpdate(TeamVO vo);
	
	public void teamDelete(Long teamNum);
	
}