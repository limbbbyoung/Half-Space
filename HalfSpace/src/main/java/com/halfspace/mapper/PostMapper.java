package com.halfspace.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.halfspace.persistence.PostVO;
import com.halfspace.persistence.SearchCriteria;

public interface PostMapper {

	public List<PostVO> getList(SearchCriteria cri);

	public List<PostVO> getRankingList();
	
	public void insert(PostVO vo);
	
	public void delete(Long pono);
	
	public void update(PostVO vo);
	
	public PostVO getDetail(Long pono);
	
	public Long getPostCount(SearchCriteria cri);
	
	public void updateCommentCnt(@Param("pono") Long pono,
								@Param("amount") int amount);
	
	public List<PostVO> getInfoList();
	
	public void hit(Long pono);
	
	public Long getLikeCnt(Long pono);
	

}
