package com.halfspace.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.halfspace.mapper.TeamListMapper;

@Repository
@Service
public class TeamListServiceImpl implements TeamListService{

	@Autowired
	private TeamListMapper mapper;
	
}
