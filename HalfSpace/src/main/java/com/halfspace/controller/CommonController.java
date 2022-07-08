package com.halfspace.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/Common")
public class CommonController {

	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		
		log.info("접근 거부 : " + auth);
		
		model.addAttribute("errorMessage", "접근 거부");
		
	} // accessDenied END
	
	@GetMapping("/hsLogin")
	public void loginInput(String error, String logout, Model model) {
		log.info("error 디버깅 : " + error);
		log.info("logout 디버깅 : " + logout);
		
		if (error != null) {
			model.addAttribute("error", "로그인 관련 에러입니다. 계정을 다시 확인해주세요.");
		}
		
		if (logout != null) {
			model.addAttribute("logout", "로그아웃했습니다.");
		}
	} // loginInput END
	
	@GetMapping("/hsLogout")
	public void logoutGet() {
		
		log.info("/hsLogout form으로 이동");
		
	} // logoutGet END
	
	@PostMapping("/hsLogout")
	public void logoutPost() {
		
		log.info("/shLogout Post방식으로 요청 처리");
		
	} // logoutPost END

	
}
