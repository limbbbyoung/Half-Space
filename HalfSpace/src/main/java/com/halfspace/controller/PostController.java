package com.halfspace.controller;

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

import com.halfspace.persistence.PageMaker;
import com.halfspace.persistence.PostVO;
import com.halfspace.persistence.SearchCriteria;
import com.halfspace.service.PostService;

import lombok.extern.log4j.Log4j;

@Controller 
@RequestMapping("/post")
@Log4j
public class PostController {
	
	@Autowired
	private PostService service;
	
	@RequestMapping(value="/list",
			method= {RequestMethod.GET, RequestMethod.POST})
	
	public String getList(SearchCriteria cri, Model model) {
	
		if(cri.getPage() == 0) {
			cri.setPage(1);
		}
		
		List<PostVO> postList = service.getList(cri);
		
		model.addAttribute("postList", postList );
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
	public String postDetail(@RequestParam(value="pono")Long bno,Model model) {
		
		System.out.println("detail 실행");
		
		PostVO post = service.getDetail(bno);
		// debug
		log.info(post);
		
		model.addAttribute("post", post);
		
		return "/post/detail";
	
	} // postDetail END
	
	@GetMapping("/insert")
	public String insertPostForm() {
		
		return "/post/insertForm";
	
	} // insertPostForm END
	
	@PostMapping("/insert")
	public String insertPost(PostVO post) {

		log.info(post);
		
		service.insert(post);
		
		return "redirect:/post/list";
	} // insertPost END
	
	@PostMapping("/delete")
	public String deletePost(Long pono, SearchCriteria cri, RedirectAttributes rttr) {
		
		service.delete(pono);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
	
		return "redirect:/post/list";
	
	} // deletPost END
	
	@PostMapping("/postForm")
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
	
		return "redirect:/post/detail";
	
	} //  updatePost END
	
	
	
} //  PostController END






