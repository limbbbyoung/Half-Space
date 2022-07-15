package com.halfspace.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.halfspace.persistence.MainBoardVO;
import com.halfspace.service.CafeService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/cafe/*")
public class CafeController {
	
	@Autowired
	private CafeService service;
	
	@RequestMapping(value="/list",
			method= {RequestMethod.GET, RequestMethod.POST})
							// @RequestParam의 defaultValue를 통해 값이 안들어올때
							// 자동으로 배정할 값을 정할 수 있음
	public String getList(Model model) {
	
		// model.addAttribute();

		return "/cafe/list";
	}
	
	@GetMapping("/insert")
	public String insertBoardForm() {
		return "/mainBoard/insertForm";
	}
	
	@PostMapping("/insert")
	public String insertBoard(MainBoardVO board) {
		log.info(board);
		// redirect를 사용해야 전체 글 목록을 로딩해온 다음 화면을 열어줍니다.
		// 스프링 컨트롤러에서 리다이렉트를 할 때는 
		// 목적주소 앞에 redirect: 을 추가로 붙입니다.
		return "redirect:/mainBoard/list";
	}

}
