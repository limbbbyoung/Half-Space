package com.halfspace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.halfspace.mapper.CommentMapper;
import com.halfspace.mapper.PostAttachMapper;
import com.halfspace.mapper.PostMapper;
import com.halfspace.persistence.PostAttachVO;
import com.halfspace.persistence.PostVO;
import com.halfspace.persistence.SearchCriteria;

@Repository
@Service
public class PostServiceImpl implements PostService{

	@Autowired
	private PostMapper mapper;
	
	@Autowired
	private PostAttachMapper attachMapper;
	
	@Autowired
	private CommentMapper commentMapper;
	
	@Override
	public List<PostVO> getList(SearchCriteria cri) {

		return mapper.getList(cri);
		
	}

	@Transactional
	@Override
	public void insert(PostVO vo) {
		
		mapper.insert(vo);
		
		// vo에 attachList(이미지 리스트)가 없다면 여기서 insert service 종료
		if(vo.getAttachList() == null || vo.getAttachList().size() <= 0) {
			return;
		}
		
		vo.getAttachList().forEach(attach -> {
			attach.setPono(vo.getPono());
			attachMapper.insert(attach);
		});
		
	}

	@Transactional
	@Override
	public void delete(Long pono) {
		attachMapper.deleteAll(pono);
		commentMapper.deleteAll(pono);
		mapper.delete(pono);
		
	}
	
	@Override
	public void update(PostVO vo) {
		// DB의 해당 pono 이미지들을 모두 삭제
		attachMapper.deleteAll(vo.getPono());
		
		// 첨부파일 리스트가 존재한다면
		// 다시 insert 실행
		if (vo.getAttachList().size() > 0) {
			vo.getAttachList().forEach(attach -> {
				attach.setPono(vo.getPono());
				attachMapper.insert(attach);
			});
		}
		
		mapper.update(vo);
	}

	@Override
	public PostVO getDetail(Long pono) {
		mapper.hit(pono);
		return mapper.getDetail(pono);
		
	}

	@Override
	public Long getPostCount(SearchCriteria cri) {
		
		return mapper.getPostCount(cri);
		
	}

	@Override
	public List<PostAttachVO> getAttachList(Long pono) {
		return attachMapper.findByPono(pono);
	}

	@Override
	public List<PostVO> getInfoList() {

		return mapper.getInfoList();
		
	}



}
