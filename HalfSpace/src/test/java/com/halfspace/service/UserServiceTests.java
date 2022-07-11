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
public class UserServiceTests {
	
	@Autowired
	private UserService service;
	
	
	@Test
	public void insertUser() {
		
		Date date = new Date(); // birthdate 값 입력을 위한 Date 생성
		UserVO vo = new UserVO(); 
		
		vo.setUserId("klk4454");
		vo.setUserPw("4454");
		vo.setUserName("사사오사");
		vo.setGender("Y");
		vo.setBirthdate(date);
		vo.setEmail("klk4454@naver.com");
		vo.setAddress("서울 신촌");
		vo.setPhoneNum("01012341234");
		
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
