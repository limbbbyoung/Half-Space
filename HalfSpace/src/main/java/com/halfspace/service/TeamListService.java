package com.halfspace.service;

import java.util.List;

import com.halfspace.persistence.SearchCriteria;
import com.halfspace.persistence.TeamListVO;

public interface TeamListService {

	public List<TeamListVO> getList(SearchCriteria cri);
	
	public TeamListVO getDetail(Long listno);
	
	public void insert(TeamListVO vo);
	
	public void delete(Long listno);
	
	public void update(Long listno);
	
	public void updateMemberCnt(Long listno);
	
	public Long getTeamListCnt(SearchCriteria cri);

}
