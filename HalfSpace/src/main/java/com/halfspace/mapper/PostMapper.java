package com.halfspace.mapper;

import java.util.List;

import com.halfspace.persistence.PostVO;
import com.halfspace.persistence.SearchCriteria;

public interface PostMapper {

	public List<PostVO> getList(SearchCriteria cri);

	public void insert(PostVO vo);
	
	public void delete(Long pono);
	
	public void update(PostVO vo);
	
	public PostVO getDetail(Long pono);
	
	public Long getPostCount(SearchCriteria cri);

}
