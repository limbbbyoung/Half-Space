package com.halfspace.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	
	// b크립트 암호화
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	//
	@Autowired 
	private HalfSpaceAccessDeniedHandler webAccessDeniedHandler;


}
