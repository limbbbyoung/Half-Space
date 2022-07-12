package com.halfspace.mapper;

import com.halfspace.persistence.TeamVO;

public interface TeamMapper {
	
	// 팀 상세정보를 볼 수 있는 메서드
	public TeamVO teamDetail(Long tno);
	
	// 팀 생성
	public void teamCreate(TeamVO vo);
	
	// 팀 정보 수정
	public void teamUpdate(TeamVO vo);
	
	// 팀 삭제
	public void teamDelete(Long tno);

	// 팀원 추가
	public void addMember(Long tno);

	// 팀원이 팀을 탈퇴할때
	public void delMember(Long tno);

	// 경기수 증가를 위한 메서드
	public void addMatchCnt(Long tno);
	
}
