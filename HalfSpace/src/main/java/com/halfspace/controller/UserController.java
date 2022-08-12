package com.halfspace.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.halfspace.domain.AuthVO;
import com.halfspace.domain.UserAttachVO;
import com.halfspace.domain.UserVO;
import com.halfspace.persistence.PostAttachVO;
import com.halfspace.service.UserService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
public class UserController {


	@Autowired
	private UserService service;
	
	@Autowired
	private PasswordEncoder pwen;
	
	// 파일 업로드 보조 메서드
	private boolean checkImageType(File file) {
		
		try {
			String contentType = Files.probeContentType(file.toPath());
			
			return contentType.startsWith("image");
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		return false;
		
		
	} // checkImageType END
	
	// 폴더 가져오기 메서드
	private String getFoleder() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		java.util.Date date = new java.util.Date();
		log.info("user controller입니다. 날짜 첫 생성 : " + date);
		String str = sdf.format(date);
		log.info("format된 날짜 return 대기 중 : " + str);
		return str.replace("_", File.separator);
		
	} // getFolder END
	
	// file 삭제 보조 메서드
	private void deleteFiles(List<PostAttachVO> attachList) {
		// 파일이 없다면 메서드 종료
		if(attachList == null || attachList.size()==0) {
			return;
		}
		
		log.info(attachList);
		// attachList 하나씩 forEach로 반복 로직
		attachList.forEach(attach -> {
			
			try {
				
				Path file = Paths.get("C:\\upload_data\\temp\\"+ attach.getUploadPath() + "\\" + attach.getUuid()
							+ "_" + attach.getFileName());
				
				Files.deleteIfExists(file);
				
				// fileType이 이미지일 때
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:\\upload_data\\temp\\" + attach.getUploadPath() +
								"\\s_" + attach.getUuid() + "_" + attach.getFileName());
				
					Files.delete(thumbNail);
				}
				
			}catch (Exception e) {
				log.error(e.getMessage());
			} // try~catch END
			
		}); // forEach END
		
	} // deleteFiles END
	
	
	@PreAuthorize("hasAnyRole('ROLE_USER, ROLE_MANAGER, ROLE_ADMIN')")
	@RequestMapping(value="/mypage",
			method= {RequestMethod.GET, RequestMethod.POST})
	public String userMypage(Principal prin, Model model) {
		
		String userId = prin.getName();
		
		System.out.println("controller 에서 user 권한으로 user read 실행");
		UserVO user = service.read(userId);
		log.info("user read map 디버깅 : " + user);

	
		model.addAttribute("user", user);
		
		return "/user/mypage";
		
	} // userMypage END
	
	@PreAuthorize("hasAnyRole('ROLE_USER, ROLE_MANAGER, ROLE_ADMIN')")
	@RequestMapping(value= "/updateForm", method= {RequestMethod.GET, RequestMethod.POST})
	public String updateForm(Principal prin, Model model) {
		
		String userId = prin.getName();
		
		UserVO user = service.read(userId);
		
		model.addAttribute("user", user);
		
		return "/user/updateForm";
	} // updateForm END
	
	@PreAuthorize("hasAnyRole('ROLE_USER, ROLE_MANAGER, ROLE_ADMIN')")
	@PostMapping("/update")
	public String userUpdate(UserVO user, String[] role) {
		log.info(user);
		log.info(role);
		
		String beforeCrPw = user.getUserPw();	
		user.setUserPw(pwen.encode(beforeCrPw));
	
		user.setAuthList(new ArrayList<AuthVO>());
		
		// authList는 List<authList>이므로 권한 개수에 맞게 넣어줘야함
		for(int i = 0; i < role.length; i++) {
			user.getAuthList().add(new AuthVO());
			user.getAuthList().get(i).setAuth(role[i]);
			user.getAuthList().get(i).setUserId(user.getUserId());
		}
		log.info("user권한 authList : " + user.getAuthList());
		
		try {
		
			service.updateUser(user);
			return "redirect:/user/mypage";
			
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:/user/mypage";
		}
		
	} // userUpdate END
	
	// ajax야 도와줘
	@GetMapping(value="/getAttachList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<UserAttachVO>> getAttachList(String userId){
		log.info("제발 uid야 와줘");
		log.info(userId);
		return new ResponseEntity<>(service.getAttachList(userId), HttpStatus.OK);
	} // getAttachList END
 	
	/*
	//비밀번호 복호화를 위한 ajax REST 통신 컨트롤러 생성 중
	@PostMapping(value="/userPwTest", 
			produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<String> userPwTest(String userPw) {
		if(pwen.matches(userPw, user.getUserPw())) {
			model.addAttribute("user", user);
			model.addAttribute("userPw", userPw);
			return new ResponseEntity<>(, HttpStatus.OK);
		}
		return "#";

	} // userPwTest END
	*/

	/*
	@PreAuthorize("hasAnyRole('ROLE_USER, ROLE_MANAGER, ROLE_ADMIN')")
	@RequestMapping(value="/requestManagerForm",
			method= {RequestMethod.GET, RequestMethod.POST})
	public String requestManagerForm(Principal prin, Model model) {

		String userId = prin.getName();
		
		UserVO user = service.read(userId);
		
		model.addAttribute("user", user);
		
		return "/user/requestManagerForm";
	
	} // requestManagerForm END
	*/
}
