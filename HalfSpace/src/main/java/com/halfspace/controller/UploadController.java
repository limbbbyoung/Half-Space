package com.halfspace.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class UploadController {

	@GetMapping("/uploadForm")
	public void uploadForm() {
		log.info("upload form의로 주소 이동");
	}
 } // Controller END


