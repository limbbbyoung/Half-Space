package com.halfspace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.halfspace.mapper.CommentMapper;
import com.halfspace.mapper.PostMapper;
import com.halfspace.persistence.CommentVO;

@Service
public class CommentServiceImpl implements CommentService {
	
	// 서비스는 매퍼를 호출하기때문에 매퍼 생성
	@Autowired
	private CommentMapper mapper;
	
	@Autowired
	private PostMapper postmapper;
	
	@Override
	@Transactional
	public void addComment(CommentVO vo) {
		Long pono = vo.getPono();
		
		postmapper.updateCommentCnt(pono, 1);
		
		mapper.create(vo);
	}
	
	@Override
	public List<CommentVO> listComment(Long cno) {
		return mapper.getList(cno);
	}
	
	@Override
	public void modifyComment(CommentVO vo) {
		mapper.update(vo);
	}
	
	@Override
	@Transactional
	public void removeComment(Long cno) {
		Long pono = mapper.getPono(cno);
		postmapper.updateCommentCnt(pono, -1);
		mapper.delete(cno);
	}

}