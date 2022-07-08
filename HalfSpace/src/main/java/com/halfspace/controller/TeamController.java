package com.halfspace.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.halfspace.persistence.MainBoardVO;
import com.halfspace.persistence.PageMaker;
import com.halfspace.persistence.SearchCriteria;
import com.halfspace.persistence.TeamListVO;
import com.halfspace.service.TeamListService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/team")
@Log4j
public class TeamController {

	@Autowired
	private TeamListService service;
	
	/*
	@RequestMapping(value="/teamlist")
					method= {RequestMethod.GET, RequestMethod.POST})
	public String teamList(SearchCriteria cri, Model model) {
		
		if(cri.getPage() == 0) {
			cri.setPage(1);
		}
		
		List<TeamListVO> teamList = service.getList(cri);
		
		model.addAttribute("teamList", teamList);
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		pageMaker.setTotalBoard(service.get);
		
	}
	*/
	
	@RequestMapping(value="/detail",
					method= {RequestMethod.GET, RequestMethod.POST})
	public String myteam(@RequestParam(value="listno") Long listno, Model model) {
		System.out.println("teamlist service getDetail으로 가기");
		TeamListVO teamList = service.getDetail(listno);
		log.info(teamList);
		model.addAttribute("teamList", teamList );
		return "/team/detail"  ;
		
	}
	
}
