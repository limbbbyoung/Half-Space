package com.halfspace.service;

import java.util.List;

import com.halfspace.persistence.LeagueVO;
import com.halfspace.persistence.SearchCriteria;

public interface LeagueService {
	
	// getList
	public List<LeagueVO> getList();
	
	// insert
	public void insert(LeagueVO vo);
	
	// delete
	public void delete(long tno);
	
	// update
	public void update(LeagueVO vo);
	
	// detail
	public LeagueVO getDetail(long tno);
	



}
