package com.halfspace.service;

import java.util.List;

import com.halfspace.persistence.CommentVO;

public interface CommentService {
	
	public void addComment(CommentVO vo);
	
	public List<CommentVO> listComment(Long cno);
	
	public void modifyComment(CommentVO vo);
	
	public void removeComment(Long cno);

}