package com.halfspace.service;

import java.util.ArrayList;

import com.halfspace.persistence.CafeListVO;

public interface CafeService {
	
	public ArrayList<CafeListVO> getList();
	
	// cafelist Insert(카페 목록에 새로운 카페 추가)
	public void addList(CafeListVO vo);
	
	// 카페 생성하기 CREATE
	public void createTable(CafeListVO vo);

}
