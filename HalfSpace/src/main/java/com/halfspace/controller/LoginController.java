package com.halfspace.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.halfspace.domain.AuthVO;
import com.halfspace.domain.HalfSpaceUser;
import com.halfspace.domain.UserVO;
import com.halfspace.service.SecurityService;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/login/*")
public class LoginController { // 수업시간에 배운 교안에서는 SecurityController가 되는 Controller임.

	@Autowired
	private SecurityService service;
	
	@Autowired
	private PasswordEncoder pwen;
 	
	@PreAuthorize("permitAll")
	@GetMapping("/all")
	public void doAll() {
		
		log.info("all 접속 실행");
		
	}

	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_USER')")
	@GetMapping("/user")
	public void doUser() {
		
		log.info("user 접속 실행");
		
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')")
	@GetMapping("/manager")
	public void doManager() {
		
		log.info("manager 접속 실행");
		
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
	@GetMapping("/admin")
	public void doAdmin() {
		
		log.info("admin 접속 실행");
		
	}
	
	@PreAuthorize("permitAll")
	@GetMapping("/join")
	public void joinForm() {
		log.info("회원 가입 창 접속");
	}
	
	@PreAuthorize("permitAll")
	@PostMapping("/join")
	public void join(UserVO vo, String[] role){
		
		String beforeCrPw = vo.getUserPw();
		log.info("암호화 전 : " + vo.getUserPw());
		vo.setUserPw(pwen.encode(beforeCrPw));
		log.info("암호화 후 : " + vo.getUserPw());
		
		// null상태인 authList에 빈 ArrayList를 먼저 배정
		vo.setAuthList(new ArrayList<AuthVO>());
		
		// authList는 List<authList>이므로 권한 개수에 맞게 넣어줘야함
		for(int i = 0; i < role.length; i++) {
			vo.getAuthList().add(new AuthVO());
			vo.getAuthList().get(i).setAuth(role[i]);
			vo.getAuthList().get(i).setUserId(vo.getUserId());
		}
		log.info(vo.getAuthList());
		
		service.insertUser(vo);
	}


}
