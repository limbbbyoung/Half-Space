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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.halfspace.persistence.MainBoardVO;
import com.halfspace.persistence.PageMaker;
import com.halfspace.persistence.SearchCriteria;
import com.halfspace.persistence.TeamListVO;
import com.halfspace.persistence.TeamVO;
import com.halfspace.service.TeamListService;
import com.halfspace.service.TeamService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/team")
@Log4j
public class TeamController {

	@Autowired
	private TeamListService service;
	
	@Autowired
	private TeamService tservice;
	
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
		
		
		TeamListVO myteam = service.getDetail(listno);
		TeamVO teamList = tservice.teamDetail(listno);
		
		model.addAttribute("teamList", teamList);
		
		log.info("myteam의 info입니다. : " + myteam);
		model.addAttribute("myteam", myteam);
		return "/team/myteam";
		
	}
	
	@PostMapping(value="/teamCreate")
	public String teamCreatePost(TeamListVO vo) {
		
		service.insert(vo);
	
		return "redirect:/team/teamlist";

	
	} // teamCreatePost END
	
	@PostMapping(value="/teamCreateForm")
	public String teamCreateGet() {
		
		return "/team/teamCreateForm";
		
	} // teamCreateGet END
	
	@PostMapping(value="/updateTeam")
	public String updateTeamGet(TeamListVO vo, RedirectAttributes rttr) {
		service.update(vo);
		rttr.addAttribute("listno", vo.getListno());
		return "redirect:/team/myteam";
	}
	
	@PostMapping(value="/updateTeamForm")
	public String updateForm(Long listno, Model model) {
		TeamListVO myteam = service.getDetail(listno);
		
		TeamVO teamvo = tservice.teamDetail(listno);
		model.addAttribute("myteam", myteam);
		model.addAttribute("teamvo", teamvo);
		return "/team/updateTeamForm";
	}
	
	@PostMapping("/delete")
	public String deleteTeam(Long listno) {

		service.delete(listno);
		
		return "redirect:/team/teamlist";
	}
	
	
	
	
}
