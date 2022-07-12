package com.halfspace.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.halfspace.mapper.TeamListMapper;
import com.halfspace.persistence.SearchCriteria;
import com.halfspace.persistence.TeamListVO;

@Repository
@Service
public class TeamListServiceImpl implements TeamListService{

	@Autowired
	private TeamListMapper mapper;
	

	@Override
	public List<TeamListVO> teamList(SearchCriteria cri) {
		
		return mapper.teamList(cri);
	}

	@Override
	public TeamListVO getDetail(Long listno) {
		return mapper.getDetail(listno);
	}



	@Override
	public void delete(Long listno) {
		mapper.delete(listno);
		
	}

	@Override
	public void update(TeamListVO vo) {
		mapper.update(vo);
		
	}

	@Override
	public void updateMemberCnt(Long listno, int amount) {
		mapper.updateMemberCnt(listno, amount);
		
	}

	@Override
	public Long getTeamListCnt(SearchCriteria cri) {
		
		return mapper.getTeamListCnt(cri);
	}

	@Override
	public void insert(TeamListVO vo) {
		mapper.insertTeamList(vo);
	}


	
}
