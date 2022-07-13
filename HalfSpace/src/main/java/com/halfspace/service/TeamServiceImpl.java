package com.halfspace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.halfspace.mapper.TeamListMapper;
import com.halfspace.mapper.TeamMapper;
import com.halfspace.persistence.SearchCriteria;
import com.halfspace.persistence.TeamListVO;
import com.halfspace.persistence.TeamVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class TeamServiceImpl implements TeamService {
	
	@Autowired
	private TeamMapper mapper;
	
	@Autowired
	private TeamListMapper teamListMapper;

	@Override
	public TeamVO teamDetail(Long tno) {
		TeamVO team = mapper.teamDetail(tno);
		return team;
	}

	@Override
	public void teamCreate(TeamVO vo) {
		
		// 팀 생성에 따른 팀 리스트에 새로 생성된 팀 추가
		teamListMapper.addTeamList(vo);
		// 팀 생성
		mapper.teamCreate(vo);
		
	}

	@Override
	public void teamUpdate(TeamVO vo, TeamListVO teamListVO) {
		// 팀 정보 수정
		mapper.teamUpdate(vo);
		// 팀 정보 수정에 따른 팀 리스트 정보 수정
		teamListMapper.update(teamListVO);
	}

	@Override
	public void teamDelete(Long tno) {
		// 팀 삭제
		mapper.teamDelete(tno);
		// 팀 삭제시 팀 목록에서 해당 팀 삭제
		teamListMapper.delete(tno);
	}

	// 팀 목록을 보려할 때 팀 목록을 볼 수 있는 서비스
	@Override
	public List<TeamListVO> getTeamList(SearchCriteria cri) {
		return teamListMapper.getTeamList(cri);
	}

	@Override
	public void updateMemberCnt(Long listno, int amount) {
		// TODO Auto-generated method stub
		
	}

	// 현재 팀 리스트에 등록된 팀 갯수는 잘 불러옴
	@Override
	public Long getTeamListCnt(SearchCriteria cri) {
		Long teamCount = teamListMapper.getTeamListCnt(cri);
		return teamCount;
	}
	
	


}
