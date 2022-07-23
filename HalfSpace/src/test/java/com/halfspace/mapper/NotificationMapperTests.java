package com.halfspace.mapper;

import java.sql.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.halfspace.persistence.NotificationVO;
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
		
		// Test 코드 작성시 파라미터에 값을 입력하게 하면 
		// 파라미터를 가져오지 못한다고 오류가 뜸
		// 따라서 테스트 코드 내부에서 생성자를 생성해서 사용
		SearchCriteria cri = new SearchCriteria();
		
		cri.setPage(1);
			
		// log.info(mapper.getList(cri));
		} // getListTest end
	
	//@Test
	public void addNotifi() {
		
		NotificationVO vo = new NotificationVO();
		
		vo.setMem_id("user41");
		vo.setTarget_mem_id("user42");
		vo.setNot_type("Request Join Team");
		vo.setNot_content_id(0L);
		vo.setNot_message("user41님 White Team 가입 요청을 신청했습니다. 팀 가입을 허락하시겠습니까?");
		vo.setNot_read_datetime(Date.valueOf("2022-07-18"));
		
		log.info("현재 NotificationVO : " + vo);
		
		mapper.addNotifi(vo);
	}
	
}
