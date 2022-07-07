package com.halfspace.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.halfspace.persistence.MainBoardVO;
import com.halfspace.persistence.TeamListVO;
import com.halfspace.service.TeamListService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/team")
@Log4j
public class TeamController {

	@Autowired
	private TeamListService service;
	
	@RequestMapping(value="/myteam",
					method= {RequestMethod.GET, RequestMethod.POST})
	public String myteam(@RequestParam(value="listno") Long listno, Model model) {
		System.out.println("myteam으로 가기");
		TeamListVO teamlist = service.get
		log.info(board);
		model.addAttribute("board", board );
		return "/mainBoard/detail";
		
	}
	
}
