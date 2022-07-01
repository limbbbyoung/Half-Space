package com.halfspace.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.halfspace.persistence.CommentVO;
import com.halfspace.service.CommentService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/comment")
public class CommentController {

	@Autowired
	private CommentService service;
	
	@PostMapping(value="", consumes="application/json",
							produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> register(@RequestBody CommentVO vo) {
		
		ResponseEntity<String> entity = null;
		
		try {
			service.addComment(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	} //  register END
	
	@GetMapping(value="/all/{pono}",
				produces = {MediaType.APPLICATION_ATOM_XML_VALUE,
							MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<CommentVO>> list (
				@PathVariable("pono") Long pono) {
		
		ResponseEntity<List<CommentVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(
					service.listComment(pono), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	} // list END

	@DeleteMapping(value="/{cno}",
				produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove (
				@PathVariable("cno") Long cno) {
		
		ResponseEntity<String> entity = null;
		
		try {
			service.removeComment(cno);
			entity = new ResponseEntity<String>(
					"SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(
					e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	} // remove END
	
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH},
					value="/{cno}",
					consumes="application/json",
					produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(
			@RequestBody CommentVO vo,
			@PathVariable("cno") Long cno){
		
		ResponseEntity<String> entity = null;
		
		try {
			vo.setCno(cno);
			
			service.modifyComment(vo);
			
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
			log.info("여기는 컨트롤러 : " + vo);
			
		} catch (Exception e) {
			e.printStackTrace();
			log.info("여기는 컨트롤러 : " + vo);
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	} // modify END
}
