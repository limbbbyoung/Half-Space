package com.halfspace.mapper;

import java.util.List;

import com.halfspace.persistence.NotificationVO;
import com.halfspace.persistence.SearchCriteria;

public interface NotificationMapper {
	
	
	// getList 각 유저에게 알림을 뜨게 하기 위해서 필요한 getList
	public List<NotificationVO> getList(SearchCriteria cri);
	
	// Insert 어떠한 동작시 알림을 보내기 위한 Insert
	public void addNotifi(NotificationVO vo);
	
	// Delete 어떠한 동작에 대한 취소시 알림을 삭제하기 위한 Delete
	public void delete(long notId);
	
	// NotificationCount 페이지네이션을 위한 알림의 데이터 개수 받아오기
	public Long getNotificationCount(SearchCriteria cri);

}
