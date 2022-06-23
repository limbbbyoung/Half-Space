package com.halfspace.mapper;

import java.util.List;

import com.halfspace.persistence.CommentVO;

public interface CommentMapper {
	
	// 특정 게시판 bno번 글의 전체 댓글 목록 가져오기
	public List<CommentVO> getList(Long cno);
	
	public void create(CommentVO vo);
	
	public void update(CommentVO vo);
	
	public void delete(Long cno);

}
