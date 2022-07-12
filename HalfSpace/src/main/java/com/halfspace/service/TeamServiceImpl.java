package com.halfspace.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.halfspace.mapper.TeamListMapper;
import com.halfspace.mapper.TeamMapper;
import com.halfspace.persistence.SearchCriteria;
import com.halfspace.persistence.TeamVO;

@Service
public class TeamServiceImpl implements TeamService {
	
	@Autowired
	private TeamMapper mapper;
	
	@Autowired
	private TeamListMapper listmapper;
	
	@Override
	public TeamVO teamDetail(Long listno) {
		return mapper.teamDetail(listno);
	}
	
	@Override
	public void teamCreate(TeamVO vo) {
		mapper.teamCreate(vo);
	}
	
	@Override
	public void teamUpdate(TeamVO vo) {
		mapper.teamUpdate(vo);
	}
	
	@Override
	public void teamDelete(Long tno) {
		mapper.teamDelete(tno);
	}



}
