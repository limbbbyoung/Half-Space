package com.halfspace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.halfspace.mapper.LeagueMapper;
import com.halfspace.persistence.LeagueVO;

@Repository
@Service
public class ManagerServiceImpl implements ManagerService{

	@Autowired
	private LeagueMapper mapper;
	
	@Override
	public List<LeagueVO> getList( ) {
		// TODO Auto-generated method stub
		return mapper.round16Tree();
	}

	@Override
	public void insert(LeagueVO vo) {
		mapper.insert(vo);
	}

	@Override
	public void delete(long tno) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(LeagueVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public LeagueVO getDetail(long tno) {
		// TODO Auto-generated method stub
		return null;
	}

}
