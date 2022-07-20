package com.halfspace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.halfspace.mapper.MainBoardMapper;
import com.halfspace.mapper.ReplyMapper;
import com.halfspace.persistence.MainBoardVO;
import com.halfspace.persistence.SearchCriteria;
import com.sun.tools.javac.util.Log;

@Repository
@Service
public class MainBoardServiceImpl implements MainBoardService{
	
	@Autowired
	private MainBoardMapper mapper;
	
	@Autowired
	private ReplyMapper replyMapper;

	@Override
	public List<MainBoardVO> getList(SearchCriteria cri) {
		return mapper.getList(cri);
	}

	@Override
	public void insert(MainBoardVO vo) {
		mapper.insert(vo);
	}

	@Transactional
	@Override
	public void delete(long bno) {
	    
		replyMapper.deleteAll(bno);
		
		mapper.delete(bno);
		
	}

	@Override
	public void update(MainBoardVO vo) {
		mapper.update(vo);
	}

	@Transactional
	@Override
	public MainBoardVO getDetail(long bno) {

		// 글의 상세정보 불러오기
		MainBoardVO vo = mapper.getDetail(bno);
		 
		// 글의 상세페이지로 접속시 조회수 증가
		mapper.addHit(vo);
		
		return vo;
	}

	@Override
	public Long getBoardCount(SearchCriteria cri) {
		Long boardCount = mapper.getBoardCount(cri);
		return boardCount;
	}
	
	
}
