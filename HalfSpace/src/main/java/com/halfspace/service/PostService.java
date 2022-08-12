package com.halfspace.service;

import java.util.List;

import com.halfspace.persistence.PostAttachVO;
import com.halfspace.persistence.PostVO;
import com.halfspace.persistence.SearchCriteria;

public interface PostService {

	public List<PostVO> getList(SearchCriteria cri);
	
	public void insert(PostVO vo);
	
	public void delete(Long pono);
	
	public void update(PostVO vo);
	
	public PostVO getDetail(Long pono);
	
	public Long getPostCount(SearchCriteria cri);
	
	// post 번호 pono 입력시 해당 글번호에 연동된 첨부파일 목록 가져오기
	public List<PostAttachVO> getAttachList(Long pono);

	public List<PostVO> getInfoList();

}
