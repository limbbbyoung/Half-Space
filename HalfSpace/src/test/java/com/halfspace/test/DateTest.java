package com.halfspace.test;

import java.sql.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class DateTest {

	@Test 
	public void dateTransFormyyyyMMdd() {
		
		Date birthdate = Date.valueOf("19990101");
		
		log.info(birthdate);
		
		System.out.println(birthdate);
	} // transFormDate END
}
