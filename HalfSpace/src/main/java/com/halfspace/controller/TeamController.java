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
import com.halfspace.service.TeamService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/team")
@Log4j
public class TeamController {

	@Autowired
	private TeamService service;
	
	@RequestMapping(value="/teamlist",
					method= {RequestMethod.GET, RequestMethod.POST})
	public String teamList(SearchCriteria cri, Model model) {
		// page 파라미터값이 주어지지 않을때 default 1
		if(cri.getPage() == 0) {
			cri.setPage(1);
		}
		// 팀 리스트를 불러와서 List에 저장
		List<TeamListVO> teamList = service.getTeamList(cri);
		
		// model 객체에 데이터를 담아서 JSP 페이지에 전송
		model.addAttribute("teamList", teamList);
		
		// 페이지네이션을 위한 PageMaker 생성자 생성
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		pageMaker.setTotalBoard(service.getTeamListCnt(cri));
		
		log.info("팀 리스트에 등록 팀 갯수 : " + service.getTeamListCnt(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/team/teamlist";
		
	}
	
	@RequestMapping(value="/teamDetail",
					method= {RequestMethod.GET, RequestMethod.POST})
	public String teamDetail(@RequestParam(value="listno")Long listno, Model model) {
		
		TeamVO myteam = service.teamDetail(listno);
		
		log.info("팀의 정보 : " + myteam);
		
		model.addAttribute("myteam", myteam);
		
		return "/team/teamDetail";
		
	}
	
	@GetMapping(value="/teamCreate")
	public String teamCreateForm() {
		
		return "/team/teamCreateForm";
		
	} // teamCreateForm END

	@PostMapping(value="/teamCreate")
	public String teamCreate(TeamVO vo) {
		log.info(vo);
		
		service.teamCreate(vo);
	
		return "redirect:/team/teamlist";
	} // teamCreate END
	
	@PostMapping(value="/updateTeamForm")
	public String updateForm(Long tno, Model model) {
		
		TeamVO team = service.teamDetail(tno);
		model.addAttribute("team", team);
		return "/team/updateTeamForm";
	}
	
	@PostMapping(value="/updateTeam")
	public String updateTeamForm(TeamVO vo, RedirectAttributes rttr) {
		service.teamUpdate(vo);
		rttr.addAttribute("tno", vo.getTno());
		return "redirect:/team/teamDetail";
	}
	
	@PostMapping("/delete")
	public String deleteTeam(Long rno) {

		service.teamDelete(rno);
		
		return "redirect:/team/teamlist";
	}
	
	
	
	
}
