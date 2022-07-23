package com.halfspace.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.halfspace.mapper.NotificationMapper;
import com.halfspace.persistence.Criteria;
import com.halfspace.persistence.NotificationVO;

@Repository
@Service
public class NotificationServiceImpl implements NotificationService{

	@Autowired
	private NotificationMapper mapper;
	
	// 알림 요청, 유저 입장에서는 알림 요청 기능이 있는게 아니라 
	// 어떠한 동작을 수행했을때 자동적으로 알림 요청
	// 예를 들어 팀 가입 요청시 그에 따른 알림을 팀장에게 보내는 것은 자동적으로 되는것
	@Override
	public void requestNotifi(NotificationVO vo) {
		mapper.addNotifi(vo);
		
	}

	@Override
	public List<NotificationVO> getList(String mem_id, Criteria cri) {
		// 유저에게 도착한 알림을 확인하기 위한 List 메서드
		return mapper.getList(mem_id, cri);
	}

	@Override
	public void delete(long notId) {
		// TODO Auto-generated method stub
	}

	@Override
	public Long getNotificationCount(Criteria cri) {
		// Notification 페이지네이션을 위해서 받는 mem_id
		return mapper.getNotificationCount(cri);
	}

}
