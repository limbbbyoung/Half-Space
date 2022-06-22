package com.halfspace.mapper;

import java.util.List;

import com.halfspace.persistence.MainBoardVO;

public interface MainBoardMapper {
		
		// List
		public List<MainBoardVO> getList();
		
		// Insert
		public void insert(MainBoardVO vo);
		
		// Delete
		public void delete(long bno);
		
		// Update
		public void update(MainBoardVO vo);
		
		// Detail
		public MainBoardVO getDetail(long bno);
}
