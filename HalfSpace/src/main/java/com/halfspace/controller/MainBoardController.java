package com.halfspace.controller;


import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.halfspace.persistence.MainBoardVO;
import com.halfspace.persistence.NotificationVO;
import com.halfspace.persistence.PageMaker;
import com.halfspace.persistence.SearchCriteria;
import com.halfspace.service.MainBoardService;
import com.halfspace.service.NotificationService;

import lombok.extern.log4j.Log4j;

@Controller 
@RequestMapping("/mainBoard")
@Log4j
public class MainBoardController {
	
	// 컨트롤러가 Service를 호출합니다.
	@Autowired
	private MainBoardService service;
	
	// 알림을 위해서 알림 서비스 객체 생성
	@Autowired
	private NotificationService notiService;
	
	// /mainBoard/list 주소로 게시물 전체의 목록을 표현하는 컨트롤러를 만들어주세요.
	@RequestMapping(value="/list",
			method= {RequestMethod.GET, RequestMethod.POST})
							// @RequestParam의 defaultValue를 통해 값이 안들어올때
							// 자동으로 배정할 값을 정할 수 있음
	public String getList(Principal prin, SearchCriteria cri, Model model) {
		// page 파라미터값이 주어지지 않을때 default 1
		if(cri.getPage() == 0) {
			cri.setPage(1);
		}
		// Main 글 조회
		List<MainBoardVO> boardList = service.getList(cri);
		model.addAttribute("boardList", boardList );
		// 알림 조회, 로그인 안한 유저들의 접근 또한 가능하도록 설정
		if(prin != null) {
		List<NotificationVO> notificationList = notiService.getList(prin.getName(), cri);
		model.addAttribute("notificationList", notificationList );
		}
		// PageMaker 생성 
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalBoard(service.getBoardCount(cri));
		// 알림의 페이지 카운트
		pageMaker.setTotalBoard(notiService.getNotificationCount());
		log.info(service.getBoardCount(cri));
		// 알림 목록 디버깅
		log.info(notiService.getNotificationCount());
		model.addAttribute("pageMaker", pageMaker);
		return "/mainBoard/list";
	}
	
	// 글 번호를 입력받아서(주소창에서 bno=? 형식으로) 해당 글의 디테일 페이지를 보여주는
	// 로직을 완성해주세요.
	// board/detail.jsp입니다.
	// getBoardList처럼 포워딩해서 화면에 해당 글 하나에 대한 정보만 보여주면 됩니다.
	@RequestMapping(value="/detail",
			method= {RequestMethod.GET, RequestMethod.POST})
	public String boardDetail(@RequestParam(value="bno")Long bno,Model model) {
		System.out.println("detail 실행");
		MainBoardVO board = service.getDetail(bno);
		log.info(board);
		model.addAttribute("board", board );
		return "/mainBoard/detail";
	}
	
	// 글쓰기는 말 그대로 글을 써주는 로직인데
	// 폼으로 연결되는 페이지가 하나 있어야하고
	// 그 다음 폼에서 날려주는 로직을 처리해주는 페이지가 하나 더 있어야 합니다.
	// /board/insert 를 get방식으로 접속시 
	// boardForm.jsp로 연결되도록 만들어주세요.
	@GetMapping("/insert")
	public String insertBoardForm() {
		return "/mainBoard/insertForm";
	}
	
	@PostMapping("/insert")
	public String insertBoard(MainBoardVO board) { //, @RequestParam Time gamedateTime
		// log.info("경기 시간 : " + gamedateTime);
		log.info("받아온 MainBoardVO : " + board);
		
		service.insert(board);
		// redirect를 사용해야 전체 글 목록을 로딩해온 다음 화면을 열어줍니다.
		// 스프링 컨트롤러에서 리다이렉트를 할 때는 
		// 목적주소 앞에 redirect: 을 추가로 붙입니다.
		return "redirect:/mainBoard/list";
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
		MainBoardVO board = service.getDetail(bno);
		model.addAttribute("board", board);
		return "/mainBoard/updateForm";
	}
	
	@PostMapping("/update")
	public String udateBoard(MainBoardVO board, SearchCriteria cri, RedirectAttributes rttr) {
		log.info("수정로직입니다." + board);
		log.info("검색어 : " + cri.getKeyword());
		log.info("검색조건 : " + cri.getSearchType());
		log.info("페이지번호 : " + cri.getPage());
		service.update(board);
		
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






