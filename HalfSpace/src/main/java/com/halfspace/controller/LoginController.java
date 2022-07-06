package com.halfspace.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequestMapping("/login/*")
public class LoginController {

	@GetMapping("/all")
	public void doAll() {
		
		log.info("all 접속 실행");
		
	}

	
	@GetMapping("/user")
	public void doUser() {
		
		log.info("user 접속 실행");
		
	}
	
	@GetMapping("/manager")
	public void doManager() {
		
		log.info("manager 접속 실행");
		
	}
	
	@GetMapping("/admin")
	public void doAdmin() {
		
		log.info("admin 접속 실행");
		
	}


}
