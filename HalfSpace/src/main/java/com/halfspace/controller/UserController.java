package com.halfspace.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.halfspace.domain.AuthVO;
import com.halfspace.domain.UserVO;
import com.halfspace.service.UserService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
public class UserController {


	@Autowired
	private UserService service;
	
	@Autowired
	private PasswordEncoder pwen;
	
	@PreAuthorize("hasAnyRole('ROLE_USER, ROLE_MANAGER, ROLE_ADMIN')")
	@RequestMapping(value="/mypage",
			method= {RequestMethod.GET, RequestMethod.POST})
	public String userMypage(@RequestParam(value="userId")String userId, Model model) {
		
		System.out.println("controller 에서 user 권한으로 user read 실행");
		UserVO user = service.read(userId);
		log.info("user read map 디버깅 : " + user);
		model.addAttribute("user", user);
		
		return "/user/mypage";
		
	} // userMypage END
	
	@PreAuthorize("hasAnyRole('ROLE_USER, ROLE_MANAGER, ROLE_ADMIN')")
	@PostMapping("/updateForm")
	public String updateForm(String userId, Model model) {
		
		UserVO user = service.read(userId);
		
		model.addAttribute("user", user);
		
		return "/user/updateForm";
	} // updateForm END
	
	@PreAuthorize("hasAnyRole('ROLE_USER, ROLE_MANAGER, ROLE_ADMIN')")
	@PostMapping("/update")
	public String userUpdate(UserVO user, String[] role) {
		log.info(user);
		log.info(role);
		
		String beforeCrPw = user.getUserPw();	
		user.setUserPw(pwen.encode(beforeCrPw));
	
		user.setAuthList(new ArrayList<AuthVO>());
		
		// authList는 List<authList>이므로 권한 개수에 맞게 넣어줘야함
		for(int i = 0; i < role.length; i++) {
			user.getAuthList().add(new AuthVO());
			user.getAuthList().get(i).setAuth(role[i]);
			user.getAuthList().get(i).setUserId(user.getUserId());
		}
		log.info("user권한 authList : " + user.getAuthList());
		
		try {
		
			service.updateUser(user);
			return "/user/mypage";
			
		}catch(Exception e) {
			e.printStackTrace();
			return "/user/mypage";
		}
		
	} // userUpdate END
	
	
	
	
	

}
