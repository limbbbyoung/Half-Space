package com.halfspace.mapper;


import java.util.List;

import com.halfspace.persistence.LeagueVO;


public interface LeagueMapper {
	
	// 각 팀의 detail
	public LeagueVO detail(Long tno);
	
	// 자격 부여
	public void qualifier(Long tno);
	
	// 16강 대진
	public List<LeagueVO> round16Tree();
	
	// 8강 대진
	public List<LeagueVO> quarterFinalTree();
	
	// 4강 대진
	public List<LeagueVO> semiFinalTree();
	
	// 결승 대진
	public List<LeagueVO> theFinal();
	
	// 대진에 팀 insert
	public void insert(LeagueVO vo);

	// 경기결과에 따라 update
	public void update(LeagueVO vo);
	
	// 팀 탈락, 퇴출
	public void delete(Long tno);
	
	


}
