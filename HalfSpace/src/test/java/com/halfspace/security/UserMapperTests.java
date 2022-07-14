package com.halfspace.security;

import java.sql.Date;
import java.util.ArrayList;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.halfspace.domain.AuthVO;
import com.halfspace.domain.UserVO;
import com.halfspace.mapper.UserMapper;
import com.halfspace.service.UserService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
})
@Log4j
public class UserMapperTests {

	@Autowired
	private UserMapper mapper;
	
	
	private PasswordEncoder pwen;
	
	//@Test
	public void testRead() {
		UserVO vo = mapper.read("user1000");
		log.info(vo.getAuthList());

	}
	
	//@Test
	public void joinTestAuthList() {
		
		String[] role = {"ROLE_USER", "ROLE_MANAGER", "ROLE_ADMIN"};
		
		UserVO vo = new UserVO();
		
		
		vo.setUserName("테스트유저1000");
		vo.setUserId("user1000");
		vo.setUserPw("1000");
		vo.setBirthdate(Date.valueOf("1999-09-19"));
		vo.setGender("Y");
		vo.setEmail("dsadsadasd");
		vo.setPhoneNum("01012341234");
		vo.setAddress("123131231");
		

		
		vo.setAuthList(new ArrayList<AuthVO>());
		
		for(int i=0; i < role.length; i++) {
			vo.getAuthList().add(new AuthVO());
			vo.getAuthList().get(i).setAuth(role[i]);
			vo.getAuthList().get(i).setUserId(vo.getUserId());
		}
		
		log.info("authList를 보여주세요 : " + vo.getAuthList());
		
		
		
	} //joinTest END
	
	
	
	//@Test
	public void dateTest() {
		String day = "1999-10-09";
		log.info(Date.valueOf(day));
	}
}
