package com.halfspace.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.halfspace.persistence.SearchCriteria;
import com.halfspace.persistence.TeamAttachVO;
import com.halfspace.persistence.TeamListVO;
import com.halfspace.persistence.TeamVO;

public interface TeamService {

	// 팀에 대한 세부정보를 보기 위한 Service
	public TeamVO teamDetail(Long tno);
	
	// 팀 생성을 위한 Service
	public void teamCreate(TeamVO vo);
	
	// 팀 정보 수정을 위한 Service
	public void teamUpdate(TeamVO vo, TeamListVO teamListVO);
	
	// 팀 해체를 위한 Serivice
	public void teamDelete(Long tno);
	
	// 팀 목록을 보기 위한 Service
	public List<TeamListVO> getTeamList(SearchCriteria cri);
	
	// 팀원수 증가에 대한 Service
	public void updateMemberCnt(Long listno, int amount);
	
	// Pagination을 위한 Service
	public Long getTeamListCnt(SearchCriteria cri);
	
	// DB에 있던 이미지를 다시 글에 표출시키기
	public List<TeamAttachVO> getAttachList(Long tno);

	
}
