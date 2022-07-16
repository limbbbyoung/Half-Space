package com.halfspace.service;

import java.util.List;

import com.halfspace.persistence.NotificationVO;
import com.halfspace.persistence.SearchCriteria;

public interface NotificationService {
	
	// 알림 보내기...팀 요청을 위해서 알림 기능을 만들지만 
	// 내 글의 댓글이 달리거나 내가 단 댓글에 댓글이 달리거나 여러가지 경우를 
	// 생각해서 알림을 적용할 수 있는 부분은 적용하기
	public void requestNotifi(NotificationVO vo);
	
	// 내정보에서 알림 버튼 클릭시 알림 목록 보여주기
	public List<NotificationVO> getList(SearchCriteria cri);
	
	// 요청 취소시 알림 삭제
	public void delete(long notId);
	
	// user에게 해당하는 알림 가져오기
	public Long getNotificationCount(SearchCriteria cri);


}
