package com.halfspace.mapper;

import java.util.List;

import com.halfspace.persistence.ReplyVO;

public interface ReplyMapper {
	
	// 특정 게시판 bno번 글의 전체 댓글 목록 가져오기
	public List<ReplyVO> getList(Long bno);
	
	// 댓글 생성
	public void create(ReplyVO vo);

	// 댓글 수정
	public void update(ReplyVO vo);
	
	// 댓글 삭제
	public void delete(Long rno);
	
	// 댓글번호(rno)입력시 해당 댓글이 속한 글번호(bno)를 리턴 받는 쿼리문
	public Long getBno(Long rno);
	
	public void deleteAll(Long bno);

}
