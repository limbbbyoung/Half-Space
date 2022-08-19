package com.halfspace.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.halfspace.persistence.CommentVO;
import com.halfspace.persistence.LeagueVO;
import com.halfspace.service.LeagueService;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/league")
public class LeagueController {

	@Autowired
	private LeagueService service;

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
	
	@PreAuthorize("hasAnyRole('ROLE_MANAGER, ROLE_ADMIN')")
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
				value="/{round}/{tno}",
				consumes="application/json",
				produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> qualifying(
		@RequestBody LeagueVO league,
		@PathVariable("tno") Long tno, @PathVariable("round") String round){
	
	ResponseEntity<String> entity = null;
	
	try {
		league.setTno(tno);
		league.setRound(round);
		service.update(league);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		
		log.info("여기는 컨트롤러 : " + league);
		
	} catch (Exception e) {
		e.printStackTrace();
		log.info("여기는 컨트롤러 : " + league);
		entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	}
	return entity;
	} // qualifying END	
	
	@PreAuthorize("hasAnyRole('ROLE_MANAGER, ROLE_ADMIN')")
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
			value="/update",
			consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> update(
		@RequestBody LeagueVO league){
	
	ResponseEntity<String> entity = null;
	
	try {
		service.update(league);
		entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		
		log.info("여기는 컨트롤러 : " + league);
		
	} catch (Exception e) {
		e.printStackTrace();
		log.info("여기는 컨트롤러 : " + league);
		entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	}
	return entity;
	} // update END	

	
	
}
