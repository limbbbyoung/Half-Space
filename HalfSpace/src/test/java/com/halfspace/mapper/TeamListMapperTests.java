package com.halfspace.mapper;


import java.sql.Connection;
import java.sql.PreparedStatement;

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
public class TeamListMapperTests {
	

	@Autowired
	private TeamListMapper mapper;
	
	@Autowired
	private DataSource ds;
	
	/* 검증이 필요한 로직입니다. 실행하지 마세요
	//@Test
	public void testCreate50Team() {
		
		TeamListVO vo = new TeamListVO();
			
			for(int i = 2; i<=50; i++) {
			
		
				vo.setCoach("user" + i);
				vo.setName("testteam" + i);
				
				mapper.insert(vo);
				
			}
				
			

	} // testCreate50List END
	*/
	
	
	// DataSource로 팀 50개를 생성합니다.
	//@Test
	public void teamListDsInsertTest() {
		
		try {
			
			Connection con = ds.getConnection();
			String sql = "INSERT INTO teamlist(listno, name, coach)	VALUES(teamlist_num.nextval, ?, ?)";
			
			for(int i=2; i<=50; i++) {
				PreparedStatement pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, "testteam" + i);
				pstmt.setString(2, "user" + i);
				
				pstmt.execute();
			}
			
		} catch(Exception e) {
			
			e.printStackTrace();
			
		}
		
	} // teamListDsInsertTest
	
	


}
