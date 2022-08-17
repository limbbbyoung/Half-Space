package com.halfspace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.halfspace.mapper.LeagueMapper;
import com.halfspace.persistence.LeagueVO;

@Repository
@Service
public class LeagueServiceImpl implements LeagueService{

	@Autowired
	private LeagueMapper mapper;
	

	@Override
	public void insert(LeagueVO vo) {
		mapper.insert(vo);
	}


	@Override
	public LeagueVO detail(Long tno) {
	
		return mapper.detail(tno);
	}


	@Override
	public void qualifying(LeagueVO vo) {
		mapper.qualifying(vo);
	}


	@Override
	public List<LeagueVO> round16Tree() {
	
		return mapper.round16Tree();
	}


	@Override
	public void update(LeagueVO vo) {
		mapper.update(vo);
		mapper.updatePoints(vo);
	}


	@Override
	public void delete(Long tno) {
		mapper.delete(tno);
	}


	@Override
	public List<LeagueVO> leagueList() {
		
		return mapper.leagueList();
	}

}
