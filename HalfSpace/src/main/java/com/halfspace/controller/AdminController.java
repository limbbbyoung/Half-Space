package com.halfspace.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.halfspace.domain.UserVO;
import com.halfspace.persistence.MainBoardVO;
import com.halfspace.persistence.PageMaker;
import com.halfspace.persistence.SearchCriteria;
import com.halfspace.service.AdminService;
import com.halfspace.service.UserService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
public class AdminController {

	@Autowired
	private AdminService aservice;
	
	@Autowired
	private UserService uservice;
	
	@Autowired
	private PasswordEncoder pwen;
 	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
	@RequestMapping(value="/userlist",
			method= {RequestMethod.GET, RequestMethod.POST})
	public String getList(SearchCriteria cri, Model model) {
		if(cri.getPage() == 0) {
			cri.setPage(1);
		}
		List<UserVO> userList = aservice.getUserList(cri);
		
		model.addAttribute("userList", userList );
		 
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalBoard(aservice.getUserCnt(cri));
		log.info(aservice.getUserCnt(cri));
		model.addAttribute("pageMaker", pageMaker);
		return "/admin/userlist";
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
	@RequestMapping(value="/userdetail",
			method= {RequestMethod.GET, RequestMethod.POST})
	public String adminReadUserDetail(@RequestParam(value="userId")String userId, Model model) {
		
		System.out.println("controller 에서 admin 권한으로 user read 실행");
		UserVO user = uservice.read(userId);
		log.info("user read map 디버깅 : " + user);
		model.addAttribute("user", user);
		return "/admin/userdetail";
		
	} // adminReadUserDetail END
}
