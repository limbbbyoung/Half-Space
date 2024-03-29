package com.halfspace.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "mainBoard/welcomeHome";
	}
	
	    // ajax_reply 사용을 위한 테스트
		@GetMapping("/test/replyTest")
		public void ajaxTest() {
			
		}
		
		@GetMapping("/comment/commentTest")
		public void ajaxCommentTest() {
			
		}
		
		// 실시간 소캣채팅을 위한 접속 컨트롤러
		@GetMapping("/chatting")
		public String chat(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception{
			return "chat";
		}
	
}
