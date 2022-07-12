package com.halfspace.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.halfspace.persistence.SearchCriteria;
import com.halfspace.persistence.TeamListVO;

public interface TeamListMapper {
	
	public List<TeamListVO> teamList(SearchCriteria cri);
	
	public TeamListVO getDetail(Long listno);
	
	public void insertTeamList(TeamListVO vo);

	public void update(TeamListVO vo);
	
	public void delete(Long listno);

	public void updateMemberCnt(@Param("listno") Long listno,
			@Param("amount") int amount);

	
	public Long getTeamListCnt(SearchCriteria cri);
	
	

}
