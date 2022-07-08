package com.halfspace.mapper;

import java.util.List;

import com.halfspace.persistence.SearchCriteria;
import com.halfspace.persistence.TeamListVO;
import com.halfspace.persistence.TeamVO;

public interface TeamMapper {

	public List<TeamVO> teamList(SearchCriteria cri);
	
	public TeamVO teamDetail(Long tno);
	
	public TeamListVO teamListDetail(Long tno);
	
	public void teamCreate(TeamVO vo);
	
	public void teamUpdate(TeamVO vo);
	
	public void teamDelete(Long tno);

	public void addMember(Long tno);

	public void delMember(Long tno);
	
	public void addMatchCnt(Long tno);
	
	public Long getTeamListCnt(SearchCriteria cri);
	
	
}
