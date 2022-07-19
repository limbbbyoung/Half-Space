package com.halfspace.controller;

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
	
	@PostMapping("/requestNotifi")
	public String requestNotification(NotificationVO vo, String TeamName, Long listno,Model model) {
         
		// 팀 가입 요청시 NotificationType은 "Request Register Team"
		vo.setNot_type("Request Register Team");
		
		// 팀 가입 요청시 ContentType은 0L, 컨텐츠타입은
		// 메인 게시판의 글 번호를 뜻함. 메인 게시판의 글에 대한 
		// 알림 요청시 해당하는 글번호를 ContentType으로 주면 됨
		vo.setNot_content_id(0L);
		
		// 팀 가입요청시 가게 되는 알림 요청에 대한 메세지
		vo.setNot_message(vo.getTarget_mem_id() + "님이 "+ TeamName +"가입 요청을 신청했습니다. 팀 가입을 허락하시겠습니까?");
		
		log.info("보내는 알림에 관련된 정보 : " + vo);
		
		// 팀 가입 요청에 대한 요청 데이터 추가
		service.requestNotifi(vo); 
		
		// 팀 디테일 페이지로 다시 돌아가기 위한 listno 전달
		model.addAttribute("listno", listno);
		
		return "redirect:/team/teamDetail";
	}
		
		// 글 번호를 입력받아서(주소창에서 bno=? 형식으로) 해당 글의 디테일 페이지를 보여주는
		// 로직을 완성해주세요.
		// board/detail.jsp입니다.
		// getBoardList처럼 포워딩해서 화면에 해당 글 하나에 대한 정보만 보여주면 됩니다.
		@RequestMapping(value="/detail",
				method= {RequestMethod.GET, RequestMethod.POST})
		public String boardDetail(@RequestParam(value="bno")Long bno,Model model) {
			System.out.println("detail 실행");
			// MainBoardVO board = service.getDetail(bno);
			// log.info(board);
			// model.addAttribute("board", board );
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
		public String insertBoard(MainBoardVO board) {
			log.info(board);
			// service.insert(board);
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