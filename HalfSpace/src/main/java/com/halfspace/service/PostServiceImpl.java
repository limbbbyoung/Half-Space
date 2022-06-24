package com.halfspace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.halfspace.mapper.PostMapper;
import com.halfspace.persistence.PostVO;
import com.halfspace.persistence.SearchCriteria;

@Repository
@Service
public class PostServiceImpl implements PostService{

	@Autowired
	private PostMapper mapper;
	
	@Override
	public List<PostVO> getList(SearchCriteria cri) {

		return mapper.getList(cri);
		
	}

	@Override
	public void insert(PostVO vo) {
		
		mapper.insert(vo);
		
	}

	@Override
	public void delete(Long pono) {
		
		mapper.delete(pono);
		
	}

	@Override
	public void update(PostVO vo) {
		
		mapper.update(vo);
		
	}

	@Override
	public PostVO getDetail(Long pono) {
		
		return mapper.getDetail(pono);
		
	}

	@Override
	public Long getPostCount(SearchCriteria cri) {
		
		return mapper.getPostCount(cri);
		
	}

}
