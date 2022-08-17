package com.halfspace.mapper;


import java.util.List;

import com.halfspace.persistence.LeagueVO;


public interface LeagueMapper {
	
	// 각 팀의 detail
	public LeagueVO detail(Long tno);
	
	// 토너먼트 자격 업데이트
	public void qualifying(LeagueVO vo);
	
	// 16강 대진
	public List<LeagueVO> round16Tree();
	
	// 대진에 팀 insert
	public void insert(LeagueVO vo);

	// 경기결과에 따라 update
	public void update(LeagueVO vo);
	
	// update결과에 따라 승점과 득실계산
	public void updatePoints(LeagueVO vo);
	
	// 팀 탈락, 퇴출
	public void delete(Long tno);
	
	// 리그에 속한 전체 팀 목록
	public List<LeagueVO> leagueList();


}
