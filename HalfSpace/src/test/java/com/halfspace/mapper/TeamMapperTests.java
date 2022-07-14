package com.halfspace.mapper;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import com.halfspace.mapper.TeamMapper;

import com.halfspace.persistence.SearchCriteria;
import com.halfspace.persistence.TeamListVO;
import com.halfspace.persistence.TeamVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TeamMapperTests {

	@Autowired
	private TeamMapper mapper;
	
	@Autowired
	private DataSource ds;
	
	//@Test
	public void getListTest(SearchCriteria cri) {
		
		//log.info(mapper.getList(cri));
	}
	
	//@Test
	public void createTeamPlz() {
		
		TeamVO vo = new TeamVO();
	
		vo.setName("청암상고33기동문회");
		vo.setCoach("풍덕동피바다");
 		vo.setLogo("123");
		vo.setIntro("Hello");
		
		mapper.teamCreate(vo);

	
		
	} // CreateTeamPlz END

	@Test
	public void testCreate50Team() {
		
		TeamVO vo = new TeamVO();
		
		for(Long i=1L; i<=50; i++) {	
			vo.setTno(i);
			vo.setCoach("user" + i);
			vo.setName("testteam" + i);
			vo.setIntro(i + "번째 팀입니다.");
			mapper.teamCreate(vo);
		}
	}
	
	
	//@Test
	public void deleteTeam() {
		mapper.teamDelete(298L);
	}
	
	
	
	//@Test
	public void updateTeam() {
		
		TeamVO vo = new TeamVO();		
		
		vo.setTno(299L);
		vo.setName("청암상고 간호과 동문회");
		vo.setCoach("풍덕동장도리");
		vo.setLogo("청암상고로고");
		vo.setIntro("청암상고 간호과 졸업생들의 모임입니다.");
		
		mapper.teamUpdate(vo);
	}
	
	
	// @Test
	public void getDetailTest() {
		
		TeamVO vo = new TeamVO();
		
		vo.setTno(5L);
		
		mapper.teamDetail(vo.getTno());
	} // getDetailTest() END
	
	
} // ALL TEST END
	
