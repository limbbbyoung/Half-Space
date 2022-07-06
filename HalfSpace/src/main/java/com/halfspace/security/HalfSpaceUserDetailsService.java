package com.halfspace.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.halfspace.domain.HalfSpaceUser;
import com.halfspace.domain.UserVO;
import com.halfspace.mapper.UserMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class HalfSpaceUserDetailsService implements UserDetailsService{

	
	@Autowired
	private UserMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	
		log.warn("username 디버깅 : " + username);
		
		UserVO vo = mapper.read(username);
	
		log.warn("vo 디버깅 : " + vo);
		
		return vo == null? null : new HalfSpaceUser(vo);
		
		
	}

}
