package com.halfspace.mapper;

import java.util.List;

import com.halfspace.persistence.TeamVO;

public interface TeamMapper {

	public List<TeamVO> myTeam(Long teamId);
	
	public void welcomeAboard(Long teammateId);
	
	
}