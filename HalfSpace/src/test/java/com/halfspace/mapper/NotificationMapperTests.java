package com.halfspace.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.halfspace.persistence.SearchCriteria;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NotificationMapperTests {
	
	@Autowired
	private NotificationMapper mapper;
	
	@Test
	public void getListTest() {
		    
		SearchCriteria cri = new SearchCriteria();
		
		cri.setPage(1);
			
		log.info(mapper.getList(cri));
		} // getListTest end
	
}
