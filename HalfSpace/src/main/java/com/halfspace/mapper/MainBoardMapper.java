package com.halfspace.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.halfspace.persistence.MainBoardVO;
import com.halfspace.persistence.SearchCriteria;

public interface MainBoardMapper {
		
		// List
		public List<MainBoardVO> getList(SearchCriteria cri);
		
		// Insert
		public void insert(MainBoardVO vo);
		
		// Delete
		public void delete(Long bno);
		
		// Update
		public void update(MainBoardVO vo);
		
		// Detail
		public MainBoardVO getDetail(Long bno);
		
		// boardCount
		public Long getBoardCount(SearchCriteria cri);
		
		// 조회수 
		public Long addHit(MainBoardVO vo);
		
		// 댓글이 써질때마다 board_tbl의 댓글 개수 업데이트하기
		public void updateReplyCount(@Param("bno") Long bno,
										@Param("amount") int amount);
}
