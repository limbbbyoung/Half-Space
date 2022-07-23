package com.halfspace.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.halfspace.persistence.SearchCriteria;
import com.halfspace.persistence.TeamListVO;
import com.halfspace.persistence.TeamVO;

public interface TeamListMapper {
	
	// 팀 목록
	public List<TeamListVO> getTeamList(SearchCriteria cri);
	
	// 팀 리스트 테이블에 저장된 정보들의 상세 정보를 볼 수 있는 메서드
	public TeamListVO getDetail(Long listno);
	
	// 팀 리스트 추가
	public void addTeamList(TeamVO vo);
	
	// 팀 리스트에 추가된 팀의 listno 가져오기
	public Long getListno(String coach);
	
	// 팀 정보 수정시 팀 리스트 테이블에 등록된 팀 이름과 감독 이름 변경을 위한 메서드
	public void update(TeamListVO vo);
	
	// 팀 해체시 팀 리스트의 정보 삭제를 위한 메서드
	public void delete(Long listno);

	// 팀원 증가시 팀 리스트의 팀원수 증가
	public void updateMemberCnt(@Param("listno") Long listno,
			@Param("amount") int amount);

	// 페이지네이션을 위한 메서드
	public Long getTeamListCnt(SearchCriteria cri);
	
	// 홈에서의 슬라이드바에서 내정보로 가는 버튼 만들기
	public Long getTeamListno(String coach);

}
