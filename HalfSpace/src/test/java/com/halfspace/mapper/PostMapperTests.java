package com.halfspace.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.halfspace.mapper.PostMapper;
import com.halfspace.persistence.PostVO;
import com.halfspace.persistence.SearchCriteria;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PostMapperTests {

	// search criteria 생성 시 필요한 page를 정의해야함.
	
	@Autowired
	private PostMapper mapper;
	
	//@Test
	public void getListTest(SearchCriteria cri) {
		
		log.info(mapper.getList(cri));
	}
	
	//@Test
	public void insertTest() {
		
		PostVO vo = new PostVO();
	
		vo.setTitle("post insertTest title");
		vo.setContent("post insertTest content");
		vo.setCatego("catego");
		vo.setWriter("post insertTest writer");
		mapper.insert(vo);
	}
	
	@Test
	public void deleteTest() {
		mapper.delete(9229L);
	}
	
	//@Test
	public void updateTest() {
		
		PostVO vo = new PostVO();		
		
		vo.setPono(9229L);
		vo.setTitle("updateTest");
		vo.setCatego("updateTest");
		vo.setContent("updateTest");
		vo.setWriter("updateTest");
		
		mapper.update(vo);
	}
	
	//@Test
	public void getDetailTest() {
		mapper.getDetail(1L);
	}
	
	//@Test
	public void getBoardCountTest(SearchCriteria cri) {
		
		mapper.getPostCount(cri);
	}
	
	
}
