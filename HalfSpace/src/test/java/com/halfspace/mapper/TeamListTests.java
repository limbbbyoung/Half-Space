package com.halfspace.mapper;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.halfspace.persistence.TeamListVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TeamListTests {
	
	@Autowired
	private TeamListMapper mapper;
	
	@Test
	public void testCreate50Team(TeamListVO vo) {
		
		for(Long i=1L; i<=50; i++) {
			
			vo.setListno(i);
			vo.setCoach("user" + i);
			vo.setName("team" + i);
		}
		log.info(vo);
		
		mapper.teamListCreate(vo);		
	} // testCreate50List END
	
	/*
	//@Test
	public void addMemberTest(Long tno) {
		
		 tno = 299L;
		
		mapper.addMember(tno);
	
		log.info(mapper.teamDetail(tno));
	} // addMemberTest END
	
	
	//@Test
	public void deleteMemberTest(Long tno) {
		
		tno = 299L;
		
		mapper.delMember(tno);
		
	}//deleteMemberTest END
	*/

}
