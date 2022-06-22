package com.halfspace.service;

import java.util.List;

import com.halfspace.persistence.MainBoardVO;
import com.halfspace.persistence.SearchCriteria;

public interface MainBoardService {
	
	// getList
	public List<MainBoardVO> getList(SearchCriteria cri);
	
	// insert
	public void insert(MainBoardVO vo);
	
	// delete
	public void delete(long bno);
	
	// update
	public void update(MainBoardVO vo);
	
	// detail
	public MainBoardVO getDetail(long bno);
	
	// 전체 글 갯수 가져오기
	public Long getBoardCount(SearchCriteria cri);

}