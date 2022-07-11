package com.halfspace.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;

@Getter
public class HalfSpaceUser extends User{
	
	private static final long serialVersionUID = 1L;
	
	private UserVO user;
	
	public HalfSpaceUser(String username, String password, Collection<? extends GrantedAuthority> auth) {
		super(username, password, auth);
	}
	
	public HalfSpaceUser(UserVO vo) {
		super(vo.getUserId(),

				vo.getUserPw(),
				
				vo.getAuthList().stream().map(author -> 
				
				new SimpleGrantedAuthority(author.getAuth()))
				.collect(Collectors.toList()));
		
		this.user = vo;
	
	}
	

}
