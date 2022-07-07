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

	//@Test
	public void testCreate300Team() {
		try {
			Connection con = ds.getConnection();
			String sql = "INSERT INTO team_tbl(tno, name, coach, logo, intro) "
					+ "VALUES(team_num.nextval, ?, ?, ?, ?)";

		
			for (int i=1; i<=300; i++) {
				PreparedStatement pstmt = con.prepareStatement(sql);
				
				
					pstmt.setString(1, "team" + i);
					pstmt.setString(2, "coach" + i);
					pstmt.setString(3, "테스트팀" + i);
					pstmt.setString(4, "테스트로고" + i);
					
								pstmt.execute();
			}
		}catch(Exception e) {
			e.printStackTrace();
		} // testCreate100Team END
	
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
	
	
	//@Test
	public void getDetailTest() {
		
		TeamVO vo = new TeamVO();
		
		vo.setTno(299L);
		
		mapper.teamDetail(vo.getTno());
	} // getDetailTest() END
	
	
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
	
	
	
	
} // ALL TEST END
	
