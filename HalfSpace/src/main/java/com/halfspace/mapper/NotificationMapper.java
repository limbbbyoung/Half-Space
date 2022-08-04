package com.halfspace.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.halfspace.persistence.Criteria;
import com.halfspace.persistence.NotificationVO;

public interface NotificationMapper {
	
	
	// getList 각 유저에게 알림을 뜨게 하기 위해서 필요한 getList
	public List<NotificationVO> getList(@Param("mem_id") String mem_id, @Param("page")int page);
	
	// Insert 어떠한 동작시 알림을 보내기 위한 Insert(구현완료)
	public void addNotifi(NotificationVO vo);
	
	// Delete 어떠한 동작에 대한 취소시 알림을 삭제하기 위한 Delete
	public void delete(long notId);
	
	// NotificationCount 페이지네이션을 위한 알림의 데이터 개수 받아오기
	public Long getNotificationCount();

}
