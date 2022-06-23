package com.halfspace.service;

import java.util.List;

import com.halfspace.persistence.ReplyVO;

public interface ReplyService {
	
		public void addReply(ReplyVO vo);
		
		public List<ReplyVO> listReply(Long bno);
		
		public void modifyReply(ReplyVO vo);
		
		public void removeReply(Long rno);
		

}
