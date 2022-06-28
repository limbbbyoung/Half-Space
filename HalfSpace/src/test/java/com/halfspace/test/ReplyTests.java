package com.halfspace.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.halfspace.persistence.ReplyVO;
import com.halfspace.service.ReplyService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReplyTests {
	
	@Autowired
	private ReplyService service;
	
	// 수정기능 테스트
	@Test
	public void updateTest() {
		ReplyVO vo = new ReplyVO();
		vo.setBno(7L);
		vo.setRno(11L);
		vo.setReply_content("수정된 본문");
		vo.setReplyer("수정된 글쓴이");
		service.modifyReply(vo);
	}

}
