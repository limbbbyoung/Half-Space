package com.halfspace.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.halfspace.persistence.LikeVO;
import com.halfspace.service.LikeService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/like")
public class LikeController {

	@Autowired
	private LikeService likeservice;
	
	@PostMapping(value="", consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> likey(@RequestBody LikeVO vo){

		ResponseEntity<String> entity = null;
		log.info("여기는 컨트롤러에요 vo : " + vo);
		try {
			likeservice.likey(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		} catch(Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	} // END likey
	
	@DeleteMapping(value="/delete/{userId}/{pono}",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> unlikey(
			@PathVariable("userId") String userId, @PathVariable("pono") Long pono){
		
		ResponseEntity<String> entity = null;
		
		try {
			
			likeservice.unlikey(userId, pono);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch(Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	} // END unlikey							

	@GetMapping(value="/{pono}/{userId}",
			// 
			produces= {MediaType.APPLICATION_XML_VALUE,
						MediaType.APPLICATION_JSON_UTF8_VALUE})
			public ResponseEntity<LikeVO> getLike(
						@PathVariable("pono") Long pono, @PathVariable("userId") String userId) {									
							
					ResponseEntity<LikeVO> entity = null;
		
					try {
			
						LikeVO like = likeservice.getLike(userId, pono);
						log.info("여기는 getLike Ajax 입니다. : " + like);
						
						entity = new ResponseEntity<>(like, HttpStatus.OK);
						log.info("엔티티님 제발요");
						log.info(entity);
					
					} catch(Exception e) {
						e.printStackTrace();
						entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
					}
					return entity;
			} // getLike END
	


}
