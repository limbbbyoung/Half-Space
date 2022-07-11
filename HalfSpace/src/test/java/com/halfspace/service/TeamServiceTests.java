package com.halfspace.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.function.Function;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.ui.Model;

import com.halfspace.domain.AuthVO;
import com.halfspace.mapper.TeamListMapper;
import com.halfspace.persistence.TeamListVO;
import com.halfspace.persistence.TeamVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml"
})
@Log4j
public class TeamServiceTests {

	@Autowired
	private TeamListService service;
	
	@Autowired
	private TeamListMapper mapper;
	
	//@Test
	public void testCreate50Team() {
		TeamListVO vo = new TeamListVO();
		
		 vo.setTeamVO(new ArrayList<TeamVO>());
		 
			for(Long i = 1L; i<=50; i++) {
				vo.setListno(i);
				vo.setCoach("user" + i);
				vo.setName("testteam" + i);
				vo.getTeamVO().add(new TeamVO());
				vo.getTeamVO().get(i.intValue()).setTno(i);
				vo.getTeamVO().get(i.intValue()).setCoach(vo.getCoach());
				vo.getTeamVO().get(i.intValue()).setName(vo.getName());
				vo.getTeamVO().get(i.intValue()).setIntro("testteam" + i + " 입니다. 안녕하세요!");
				vo.getTeamVO().get(i.intValue()).setLogo("testteam" + i + "로고 입니다.");
				
				service.insert(vo);
				
			}
				
	} // testCreate50List END
	
	@Test
	public void TeamReadServiceTest( ) {
		
		TeamListVO vo = service.teamListMap(1L);
		
		vo.getTeamVO();
		
		log.info(vo.getTeamVO());
		
		
		
		
	} // TeamReadServiceTest END
}
