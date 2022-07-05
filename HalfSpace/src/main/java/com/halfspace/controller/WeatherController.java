package com.halfspace.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/weather/*")
@Controller
public class WeatherController {
	
	@GetMapping("/today")
	public void getToday() {
		log.info("모든 유저가 사용가능하도록 날씨정보 제공");
	}

}
