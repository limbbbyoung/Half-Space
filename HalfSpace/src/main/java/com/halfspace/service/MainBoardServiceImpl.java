package com.halfspace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.halfspace.mapper.MainBoardMapper;
import com.halfspace.persistence.MainBoardVO;
import com.halfspace.persistence.SearchCriteria;

@Repository
@Service
public class MainBoardServiceImpl implements MainBoardService{
	
	@Autowired
	private MainBoardMapper mapper;

	@Override
	public List<MainBoardVO> getList(SearchCriteria cri) {
		return mapper.getList(cri);
	}

	@Override
	public void insert(MainBoardVO vo) {
		mapper.insert(vo);
	}

	@Override
	public void delete(long bno) {
		mapper.delete(bno);
	}

	@Override
	public void update(MainBoardVO vo) {
		mapper.update(vo);
	}

	@Override
	public MainBoardVO getDetail(long bno) {
		return mapper.getDetail(bno);
	}

	@Override
	public Long getBoardCount(SearchCriteria cri) {
		Long boardCount = mapper.getBoardCount(cri);
		return boardCount;
	}
	
	
}
