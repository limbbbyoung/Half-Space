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
public class TeamServiceTests{
	
	@Autowired
	private TeamService service;
	
	@Test
	public void TeamCreateServiceTest( ) {
			
		TeamVO vo = new TeamVO();
		
		vo.setName("DB");
		vo.setCoach("user42");
		vo.setIntro("단단한 수비");
		
		service.teamCreate(vo);
	}
}
