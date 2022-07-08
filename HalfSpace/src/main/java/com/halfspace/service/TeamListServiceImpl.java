package com.halfspace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.halfspace.mapper.TeamListMapper;
import com.halfspace.persistence.SearchCriteria;
import com.halfspace.persistence.TeamListVO;

@Repository
@Service
public class TeamListServiceImpl implements TeamListService{

	@Autowired
	private TeamListMapper mapper;

	@Override
	public List<TeamListVO> getList(SearchCriteria cri) {
		
		return null;
	}

	@Override
	public TeamListVO myteam(Long listno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(TeamListVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Long listno) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Long listno) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateMemberCnt(Long listno) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Long getTeamListCnt(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
