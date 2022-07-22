package com.halfspace.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.halfspace.mapper.TeamListMapper;
import com.halfspace.persistence.PageMaker;
import com.halfspace.persistence.SearchCriteria;
import com.halfspace.persistence.TeamAttachVO;
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
	
	@Autowired
	private TeamListMapper mapper;
	
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
		
		// 팀 상세정보 페이지에 보여줄 내 팀 정보
		TeamVO myteam = service.teamDetail(listno);
		log.info("팀의 정보 : " + myteam);
		
		// 창단일에 대한 정보를 보여주기 위해 TeamListVO 불러오기
		TeamListVO listInMyteam = mapper.getDetail(listno);
		log.info("팀 리스트에 등록된 내 팀 정보 : " + listInMyteam);
		
		// 사용자가 보기 좋게 바꾸기 위해 날짜 format
		Date regdate = listInMyteam.getRegdate();
		log.info("포맷 지정 전 : " + regdate);
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일"); 
        //원하는 데이터 포맷 지정
		String strRegDate = simpleDateFormat.format(regdate); 
        //지정한 포맷으로 변환 
		log.info("포맷 지정 후 : " + strRegDate);
		
		// TeamVO 전송
		model.addAttribute("myteam", myteam);
		// TeamListVO 전송
		model.addAttribute("listInMyteam", listInMyteam);
		// 날짜 formatting 후 해당 날짜 전송
		model.addAttribute("strRegDate", strRegDate);
		
		return "/team/teamDetail";
		
	}
	
	@GetMapping(value="/teamCreateForm")
	public String teamCreateForm() {
		
		return "/team/teamCreateForm";
		
	} // teamCreateForm END

	@PostMapping(value="/teamCreate")
	public String teamCreate(TeamVO vo){ // CRUD 에서의 INSERT가 되는 기능
		
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
		log.info("updateService를 위해 받아오는 VO : " + vo);
		
		// tno 전달이 안되므로 직접적으로 listno를 생성하여
		// TeamListMapper쪽의 수정로직을 실행
		TeamListVO teamListVO = mapper.getDetail(vo.getTno());
		log.info(teamListVO);
		
		// 업데이트 로직 실행
		service.teamUpdate(vo, teamListVO);
		
		// 원래있던 디테일 페이졸 가기 위해 listno 파라미터 전송
		rttr.addAttribute("listno", vo.getTno());
		
		return "redirect:/team/teamDetail";
	}
	
	@PostMapping("/delete")
	public String deleteTeam(@RequestParam(value="tno") Long tno) {
		log.info("현재 받아오는 팀 정보의 팀 번호  : " + tno);
		
		service.teamDelete(tno);
		
		return "redirect:/team/teamlist";
	}
	
	@GetMapping(value="/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<TeamAttachVO>> getAttachList(Long tno){
		
		return new ResponseEntity<>(service.getAttachList(tno), HttpStatus.OK);
	} // getAttachList end
	
		// 파일 폴더에서 첨부 파일에 대한 데이터 삭제를 위한 메서드, 삭제 보조 메서드
		private void deleteFiles(List<TeamAttachVO> attachList) {
			
			if(attachList == null || attachList.size() == 0) {
				return;
			}
			
			log.info(attachList);
			
			attachList.forEach(attach -> {
				try {
					Path file = Paths.get("C:\\upload_data\\temp\\" + attach.getUploadPath() + 
										"\\" + attach.getUuid() + "_" + attach.getFileName());
					
					Files.deleteIfExists(file);
					
					if(Files.probeContentType(file).startsWith("image")) {
						
						Path thumbNail = Paths.get("C:\\upload_data\\temp\\" + attach.getUploadPath()
													+ "\\s_" + attach.getUuid() + "_" + attach.getFileName());
						
						Files.delete(thumbNail);
					}
				} catch(Exception e) {
					log.error(e.getMessage());
				}// end catch
			}); // end foreach
		} // deleteFiles END
}
