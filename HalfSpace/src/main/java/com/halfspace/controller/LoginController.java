package com.halfspace.controller;

import java.security.Principal;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.halfspace.domain.AuthVO;
import com.halfspace.domain.UserVO;
import com.halfspace.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequiredArgsConstructor
@RequestMapping("/login/*")
public class LoginController { // 수업시간에 배운 교안에서는 SecurityController가 되는 Controller임.
	
	@Autowired
	private UserService service;
	
	@Autowired
	private PasswordEncoder pwen;
	
	
	@PostMapping
	public String login(@Validated @ModelAttribute UserVO user,
			BindingResult bindingResult,
            HttpServletResponse response) {
		
		if (bindingResult.hasErrors()) {
			return "/hsLogin";
		}
		
		// Member loginMember = service.login(user.getUserId(), user.getUserPw());
	   //   log.info("login", loginMember);
		

		return "redirect:/";
	} // login
	

	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_USER')")
	@GetMapping("/user")
	public void doUser(Principal principal) {
		
		log.info(principal.getName());
	
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')")
	@GetMapping("/manager")
	public String doManager() {
		
		log.info("manager 접속 실행");
		
		return "redirect:/mainBoard/list";
		
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
	@GetMapping("/admin")
	public String doAdmin() {
		
		log.info("admin 접속 실행");
		
		return "redirect:/mainBoard/list";
	}
	
	@PreAuthorize("permitAll")
	@GetMapping("/join")
	public void joinForm() {
		log.info("회원 가입 창 접속");
	}
	
	@PreAuthorize("permitAll")
	@PostMapping("/join")
	public String join(UserVO vo, String[] role, RedirectAttributes rttr) {
		// vo에 정보들을 잘 받아오는지 체크
		log.info(vo);
		log.info(role);
		
		// 전화번호 받아오기
		//String phoneNum = ph1 + ph2 + ph3;
		//log.info(phoneNum);
		//vo.setPhoneNum(phoneNum);

		// 주소값 받아오기
		//String address = address1 + address2 + address3;
		//log.info(address);
		//vo.setAddress(address);
		
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
		log.info("가져온 vo의 authList : " + vo.getAuthList());
		
		try {
		
			service.insertUser(vo);
			return "/login/joinWelcome";
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
		
		} // join END
	
	


}
