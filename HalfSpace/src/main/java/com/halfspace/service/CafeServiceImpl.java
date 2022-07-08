package com.halfspace.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.halfspace.mapper.CafeListMapper;
import com.halfspace.persistence.CafeListVO;

@Service
public class CafeServiceImpl implements CafeService{

	@Autowired
	private CafeListMapper mapper;
	
	@Override
	public ArrayList<CafeListVO> getList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addList(CafeListVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void createTable(CafeListVO vo) {
		// TODO Auto-generated method stub
		
	}

}
