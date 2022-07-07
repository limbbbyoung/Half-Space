package com.halfspace.mapper;

import java.util.List;

import com.halfspace.persistence.SearchCriteria;
import com.halfspace.persistence.TeamListVO;

public interface TeamListMapper {

	public List<TeamListVO> teamList(SearchCriteria cri);
	
	public TeamListVO teamListDetail(Long listno);
	
	public void teamListCreate(TeamListVO vo);
	
	public void teamListUpdate(TeamListVO vo);
	
	public void teamListDelete(Long listno);

	public void updateMemberCnt(Long listno);

}
