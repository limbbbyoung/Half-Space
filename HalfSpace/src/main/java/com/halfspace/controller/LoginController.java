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

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.halfspace.domain.AuthVO;
import com.halfspace.domain.UserAttachVO;
import com.halfspace.domain.UserVO;
import com.halfspace.persistence.PostAttachVO;
import com.halfspace.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@RequiredArgsConstructor
@RequestMapping("/login/*")
public class LoginController { // 수업시간에 배운 교안에서는 SecurityController가 되는 Controller임.
	
	@Autowired
	private UserService service;
	
	@Autowired
	private PasswordEncoder pwen;
	
	public Date transFormDate(String year, String month, String day) {
		
		String date = year + "-" + month + "-" + day;
		
		Date d = Date.valueOf(date);
		
		return d;
		
	} // transFormDate END

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
	private void deleteFiles(List<UserAttachVO> attachList) {
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
	
	@PostMapping
	public String login(@Validated @ModelAttribute UserVO user,
			BindingResult bindingResult,
            HttpServletResponse response) {
		
		if (bindingResult.hasErrors()) {
			return "/hsLogin";
		}
		
		// Member loginMember = service.login(user.getUserId(), user.getUserPw());
	   //   log.info("login", loginMember);
		

		return "redirect:/";
	} // login
	

	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_USER')")
	@GetMapping("/user")
	public void doUser(Principal principal) {
		
		log.info(principal.getName());
	
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER')")
	@GetMapping("/manager")
	public String doManager() {
		
		log.info("manager 접속 실행");
		
		return "redirect:/mainBoard/list";
		
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN')")
	@GetMapping("/admin")
	public String doAdmin() {
		
		log.info("admin 접속 실행");
		
		return "redirect:/mainBoard/list";
	}
	
	@PreAuthorize("permitAll")
	@GetMapping("/join")
	public void joinForm() {
		log.info("회원 가입 창 접속");
	}
	
	@PreAuthorize("permitAll")
	@PostMapping("/join")
	public String join(UserVO vo, String[] role, String birthdate_y, String birthdate_m, String birthdate_d,
			String user_phone, String phone1, String phone2, String emailId, String emailDomain, RedirectAttributes rttr) {
		
		// 전화번호 받아오기
		String phoneNum = user_phone + phone1 + phone2;
		log.info(phoneNum);
		vo.setPhoneNum(phoneNum);

		// 생일 가져오기
		Date birthdate = transFormDate(birthdate_y, birthdate_m, birthdate_d);
		log.info(birthdate);
		vo.setBirthdate(birthdate);
		
		// 이메일 가져오기
		String email = emailId + "@" + emailDomain;
		log.info(email);
		vo.setEmail(email);
		
		// vo에 정보들을 잘 받아오는지 체크
				log.info(vo);
				log.info(role);
				
		String beforeCrPw = vo.getUserPw();
		log.info("암호화 전 : " + vo.getUserPw());
		vo.setUserPw(pwen.encode(beforeCrPw));
		log.info("암호화 후 : " + vo.getUserPw());
		
		// null상태인 authList에 빈 ArrayList를 먼저 배정
		vo.setAuthList(new ArrayList<AuthVO>());
		
		// authList는 List<authList>이므로 권한 개수에 맞게 넣어줘야함
		for(int i = 0; i < role.length; i++) {
			vo.getAuthList().add(new AuthVO());
			vo.getAuthList().get(i).setAuth(role[i]);
			vo.getAuthList().get(i).setUserId(vo.getUserId());
		}
		log.info("가져온 vo의 authList : " + vo.getAuthList());
		
		// 첨부파일 정보가 있다면
		log.info("입력될 user 정보 : " + vo);
		// post에 첨부파일목록이 존재한다면
		if(vo.getAttachList() != null) {
			vo.getAttachList().forEach(attach -> log.info(attach));
		}
		
		
		try {
		
			service.insertUser(vo);
			return "/login/joinWelcome";
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		
		
		} // join END
		
		// ajax야 도와줘
		@GetMapping(value="/getAttachList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public ResponseEntity<List<UserAttachVO>> getAttachList(String userId){
			
			return new ResponseEntity<>(service.getAttachList(userId), HttpStatus.OK);
		}
	 	
	


}
