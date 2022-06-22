package com.halfspace.mapper;

import java.util.List;

import com.halfspace.persistence.MainBoardVO;
import com.halfspace.persistence.SearchCriteria;

public interface MainBoardMapper {
		
		// List
		public List<MainBoardVO> getList(SearchCriteria cri);
		
		// Insert
		public void insert(MainBoardVO vo);
		
		// Delete
		public void delete(long bno);
		
		// Update
		public void update(MainBoardVO vo);
		
		// Detail
		public MainBoardVO getDetail(long bno);
		
		// boardCount
		public Long getBoardCount(SearchCriteria cri);
}
