package com.halfspace.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.halfspace.domain.AuthVO;
import com.halfspace.domain.UserVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
@Log4j
public class SecurityServiceTests {
	
	@Autowired
	private SecurityService service;
	
	
	@Test
	public void insertUser() {
		
		UserVO vo = new UserVO();
		
		vo.setUserId("klk2254");
		vo.setUserPw("2254");
		vo.setUserName("이이오사");
		vo.setGender("Y");
		vo.setBirthdate(LocalDate.now());
		vo.setEmail("klk2254@naver.com");
		vo.setAddress("경기도");
		vo.setPhoneNum("01010001000");
		
		AuthVO authvo = new AuthVO();
		String authvoId = vo.getUserId();
		authvo.setUserId(authvoId);
		authvo.setAuth("ROLE_ADMIN");
		List<AuthVO> list = new ArrayList();
		list.add(authvo);
		
		vo.setAuthList(list);
		
		service.insertUser(vo);
		
	}
		
}
