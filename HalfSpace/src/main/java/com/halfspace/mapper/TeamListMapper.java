package com.halfspace.mapper;

import java.util.List;

import com.halfspace.persistence.SearchCriteria;
import com.halfspace.persistence.TeamListVO;

public interface TeamListMapper {

	public List<TeamListVO> teamList(SearchCriteria cri);
	
	public TeamListVO getDetail(Long listno);
	
	public void insert(TeamListVO vo);
	
	public void update(TeamListVO vo);
	
	public void delete(Long listno);

	public void updateMemberCnt(Long listno);

}
