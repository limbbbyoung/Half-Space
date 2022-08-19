package com.halfspace.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.halfspace.persistence.Criteria;
import com.halfspace.persistence.MainBoardVO;
import com.halfspace.persistence.NotificationVO;
import com.halfspace.persistence.PageMaker;
import com.halfspace.persistence.ReplyVO;
import com.halfspace.persistence.SearchCriteria;
import com.halfspace.service.MainBoardService;
import com.halfspace.service.NotificationService;
import com.halfspace.service.ReplyService;

import lombok.extern.log4j.Log4j;

@Controller 
@RequestMapping("/notification")
@Log4j
public class NotificationController {
	
	// 컨트롤러가 Service를 호출
	@Autowired
	private NotificationService service;
	
	// 알림 목록 불러오기
	@RequestMapping(value="/notificationList",
			method= {RequestMethod.GET, RequestMethod.POST})
							// @RequestParam의 defaultValue를 통해 값이 안들어올때
							// 자동으로 배정할 값을 정할 수 있음
	public String getList(Principal prin, Criteria cri, Model model) {
		// page 파라미터값이 주어지지 않을때 default 1
		if(cri.getPage() == 0) {
			cri.setPage(1);
		}
		List<NotificationVO> notificationList = service.getList(prin.getName(), cri);
		model.addAttribute("notificationList", notificationList );
		// PageMaker 생성 
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalBoard(service.getNotificationCount());
		log.info(service.getNotificationCount());
		model.addAttribute("pagesMaker", pageMaker);
		return "/notification/notificationList";
	}
	
	@PostMapping("/requestNotifi")
	public String requestNotification(NotificationVO vo, String TeamName, Long listno, int page,Model model) {
         
		// 팀 가입 요청시 NotificationType은 "Request Register Team"
		vo.setNot_type("Request Register Team");
		
		// 팀 가입 요청시 ContentType은 0L, 컨텐츠타입은
		// 메인 게시판의 글 번호를 뜻함. 메인 게시판의 글에 대한 
		// 알림 요청시 해당하는 글번호를 ContentType으로 주면 됨
		vo.setNot_content_id(0L);
		
		// 팀 가입요청시 가게 되는 알림 요청에 대한 메세지
		vo.setNot_message(vo.getTarget_mem_id() + "님이 "+ TeamName + "가입 요청을 신청했습니다. 팀 가입을 허락하시겠습니까?");
		
		log.info("보내는 알림에 관련된 정보 : " + vo);
		
		// 팀 가입 요청에 대한 요청 데이터 추가
		service.requestNotifi(vo); 
		
		// 팀 디테일 페이지로 다시 돌아가기 위한 listno 전달
		model.addAttribute("listno", listno);
		model.addAttribute("page", page);
		
		return "redirect:/team/teamDetail";
	}
		
		// 글 번호를 입력받아서(주소창에서 bno=? 형식으로) 해당 글의 디테일 페이지를 보여주는
		// 로직을 완성해주세요.
		// board/detail.jsp입니다.
		// getBoardList처럼 포워딩해서 화면에 해당 글 하나에 대한 정보만 보여주면 됩니다.
		@RequestMapping(value="/detail",
				method= {RequestMethod.GET, RequestMethod.POST})
		public String notiDetail(@RequestParam(value="not_id")Long not_id,Model model) {
			System.out.println("notiDetail 실행");
			
			return "/notification/detail";
		}
		
		// 글삭제 post방식으로 처리하도록 합니다.
		@PostMapping("/delete")
		public String deleteBoard(Long bno, SearchCriteria cri, RedirectAttributes rttr) {
			// 삭제 후 리스트로 돌아갈 수 있도록 내부 로직을 만들어주시고
			// 디테일 페이지에 삭제 요청을 넣을 수 있는 폼을 만들어주세요.
			service.delete(bno);
			
			rttr.addAttribute("page", cri.getPage());
			rttr.addAttribute("searchType", cri.getSearchType());
			rttr.addAttribute("keyword", cri.getKeyword());
			return "redirect:/mainBoard/list";
		}
		
		// 글 수정 로직
		@PostMapping("/updateForm")
		public String updateForm(Long bno, Model model) {
			// MainBoardVO board = service.getDetail(bno);
			// model.addAttribute("board", board);
			return "/mainBoard/updateForm";
		}
		
		@PostMapping("/update")
		public String udateBoard(MainBoardVO board, SearchCriteria cri, RedirectAttributes rttr) {
			log.info("수정로직입니다." + board);
			log.info("검색어 : " + cri.getKeyword());
			log.info("검색조건 : " + cri.getSearchType());
			log.info("페이지번호 : " + cri.getPage());
			// service.update(board);
			
			// rttr.addAttribute("파라미터명", "전달자료")
			// 는 호출되면 redirect 주소 뒤에 파라미터를 붙여줍니다.
			// rttr.addFlashAttribute()는 넘어간 페이지에서 파라미터를
			// 쓸 수 있도록 전달하는 것으로 둘의 역할이 다르니 주의해주세요.
			rttr.addAttribute("bno", board.getBno());
			rttr.addAttribute("page", cri.getPage());
			rttr.addAttribute("searchType", cri.getSearchType());
			rttr.addAttribute("keyword", cri.getKeyword());
			return "redirect:/mainBoard/detail";
		}
		
		@GetMapping("/welcomeHome")
		public String welcomeHome() {
			
			return "/mainBoard/welcomeHome";
		}
}
