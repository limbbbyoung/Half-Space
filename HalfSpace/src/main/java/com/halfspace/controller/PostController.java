package com.halfspace.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.halfspace.domain.UserVO;
import com.halfspace.persistence.LikeVO;
import com.halfspace.persistence.PageMaker;
import com.halfspace.persistence.PostAttachVO;
import com.halfspace.persistence.PostVO;
import com.halfspace.persistence.SearchCriteria;
import com.halfspace.service.LikeService;
import com.halfspace.service.PostService;
import com.halfspace.service.UserService;

import lombok.extern.log4j.Log4j;

@Controller 
@RequestMapping("/post")
@Log4j
public class PostController {
	
	@Autowired
	private PostService service;
	
	@Autowired
	private UserService userservice;
	
	@Autowired
	private LikeService likeservice;
	
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
		
		Date date = new Date();
		log.info("post controller입니다. 날짜 첫 생성 : " + date);
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
	
	
	@RequestMapping(value="/list",
			method= {RequestMethod.GET, RequestMethod.POST})
	
	public String getList(SearchCriteria cri, Model model) {
	
		if(cri.getPage() == 0) {
			cri.setPage(1);
		}
		
		List<PostVO> postList = service.getList(cri);
		List<PostVO> infoList = service.getInfoList();
		model.addAttribute("postList", postList );
		model.addAttribute("infoList", infoList);
		log.info(postList);
		
		// PageMaker 생성 
		PageMaker pageMaker = new PageMaker();
		
		pageMaker.setCri(cri);
		
		pageMaker.setTotalBoard(service.getPostCount(cri));
		
		log.info(service.getPostCount(cri));
		
		log.info(pageMaker);
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "/post/list";
		
	} // getList END
	
	// post 조회
	@RequestMapping(value="/detail",
			method= {RequestMethod.GET, RequestMethod.POST})
	public String postDetail(@RequestParam(value="pono")Long pono,Model model) {
		
		System.out.println("detail 실행");
		
		PostVO post = service.getDetail(pono);
		UserVO user = userservice.read(post.getWriter());
		// debug
		log.info(post);

		model.addAttribute("post", post);
		model.addAttribute("user", user);
		return "/post/detail";
	
	} // postDetail END
	
	@GetMapping("/insert")
	public String insertPostForm(Principal prin, Model model) {
		
		String userId = prin.getName();
		UserVO user = userservice.read(userId);
		
		model.addAttribute("user", user);
		return "/post/insertForm";
	
	} // insertPostForm END
	
	@PostMapping("/insert")
	public String insertPost(PostVO post) {

		log.info(post);
		
		service.insert(post);
		
		// 첨부파일 정보가 있다면
		log.info("입력될 post 정보 : " + post);
		// post에 첨부파일목록이 존재한다면
		if(post.getAttachList() != null) {
			post.getAttachList().forEach(attach -> log.info(attach));
		}
		
		return "redirect:/post/list";
	} // insertPost END
	
	@PostMapping("/delete")
	public String deletePost(Long pono, SearchCriteria cri, RedirectAttributes rttr) {
		
		List<PostAttachVO> attachList = service.getAttachList(pono);
		
		service.delete(pono);
		// 첨부 리스트가 존재할 때
		if(attachList != null || attachList.size() > 0 ) {
			deleteFiles(attachList);
		}
		
		rttr.addAttribute("pono", pono);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
	
		return "redirect:/post/list";
	
	} // deletPost END
	
	@PostMapping("/updateForm")
	public String updateForm(Long pono, Model model) {
		
		PostVO post = service.getDetail(pono);
		
		model.addAttribute("post", post);
		
		return "/post/updateForm";
	} // updateForm END
	
	@PostMapping("/update")
	public String updatePost(PostVO post, SearchCriteria cri, RedirectAttributes rttr) {
		
		// 디버깅
		log.info("/post/update : " + post);
		log.info("검색어 : " + cri.getKeyword());
		log.info("검색조건 : " + cri.getSearchType());
		log.info("페이지번호 : " + cri.getPage());
		// 서비스 호출
		service.update(post);
		
		rttr.addAttribute("pono", post.getPono());
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
	
		return "redirect:/post/detail?pono=" + post.getPono();
	
	} //  updatePost END
	
	@GetMapping(value="/getAttachList", produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<PostAttachVO>> getAttachList(Long pono){
		
		return new ResponseEntity<>(service.getAttachList(pono), HttpStatus.OK);
	}
 	
	
	
	
} //  PostController END






