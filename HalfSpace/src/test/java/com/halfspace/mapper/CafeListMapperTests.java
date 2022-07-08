package com.halfspace.mapper;

import java.util.ArrayList;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.halfspace.persistence.CafeListVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CafeListMapperTests {
	
	@Autowired
	private CafeListMapper mapper;
	
	//@Test
	public void getListTest() {
		log.info(mapper.getList());
	}
	
	@Test 
	public void createTableTest() {
		
		CafeListVO vo = new CafeListVO();
		
		ArrayList<CafeListVO> ArrayList = mapper.getList();
		
		log.info(ArrayList);
		
		vo = ArrayList.get(0);
		
	    log.info("현재 받아오는 VO : " + vo);
	    
	    mapper.createTable(vo);
		
	}

}
