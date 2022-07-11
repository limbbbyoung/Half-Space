package com.halfspace.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.halfspace.persistence.PageMaker;
import com.halfspace.persistence.SearchCriteria;
import com.halfspace.persistence.TeamListVO;
import com.halfspace.persistence.TeamVO;
import com.halfspace.service.TeamListService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/team")
@Log4j
public class TeamController {

	@Autowired
	private TeamListService service;
	
	
	@RequestMapping(value="/teamlist",
					method= {RequestMethod.GET, RequestMethod.POST})
	public String teamList(SearchCriteria cri, Model model) {
		
		if(cri.getPage() == 0) {
			cri.setPage(1);
		}
		
		List<TeamListVO> teamList = service.teamList(cri);
		
		model.addAttribute("teamList", teamList);
		
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		pageMaker.setTotalBoard(service.getTeamListCnt(cri));
		
		log.info(service.getTeamListCnt(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/team/teamlist";
		
	}
	
	
	@RequestMapping(value="/myteam",
					method= {RequestMethod.GET, RequestMethod.POST})
	public String myteam(@RequestParam(value="listno")Long listno, Model model) {
		
		log.info("listno 어디갔스까 : " + listno);
		
		System.out.println("teamlist service myteam으로 가기");
		
		
		TeamListVO teamListMap = service.teamListMap(listno);

		log.info("teamListMap의 info입니다. : " + teamListMap);
		model.addAttribute("myteam", teamListMap);
		return "/team/myteam";
		
	}
	
	@PostMapping(value="/teamCreate")
	public void teamCreatePost(TeamListVO vo, String[] role) {
		
		vo.setTeamVO(new ArrayList<TeamVO>());
		
		for(int i = 0; i < role.length; i++) {
			vo.getTeamVO().add(new TeamVO());
			vo.getTeamVO().get(i).setTno(vo.getListno());
			vo.getTeamVO().get(i).setCoach(vo.getCoach());
			vo.getTeamVO().get(i).setName(vo.getName());
			
		}
		
		log.info("teamVo 디버깅 : " + vo.getTeamVO());
		log.info("teamlist + team_tbl 디버깅 : " + vo);
		
		service.insert(vo);
		
	} // teamCreatePost END
	
	@GetMapping(value="/teamCreate")
	public String teamCreateGet() {
		
		return "/team/teamCreate";
		
	} // teamCreateGet END
	
}
