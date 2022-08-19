package com.halfspace.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.halfspace.persistence.CommentVO;
import com.halfspace.persistence.LeagueVO;
import com.halfspace.persistence.TeamVO;
import com.halfspace.service.LeagueService;
import com.halfspace.service.TeamService;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/league")
public class LeagueController {

	@Autowired
	private LeagueService service;
	
	@Autowired
	private TeamService teamservice;
	
	
	@PreAuthorize("hasAnyRole('ROLE_MANAGER, ROLE_ADMIN')")
	@PostMapping(value="/regist", consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> regist(@RequestBody LeagueVO league) {

		log.info("leagueVO 생성" + league);

		ResponseEntity<String> entity = null;
		log.info("여기는 리그컨트롤러에요  : " + league);
		
		try {
			service.insert(league);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		} catch(Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	} // regist END
	
	/*
	@PreAuthorize("hasAnyRole('ROLE_USER, ROLE_MANAGER, ROLE_ADMIN')")
	@GetMapping(value="", consumes="application/json",
							produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<List<LeagueVO>> leagueTree(){
		
	};
	*/
	
	
}
