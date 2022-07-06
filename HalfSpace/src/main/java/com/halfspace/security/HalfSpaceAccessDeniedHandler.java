package com.halfspace.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import lombok.extern.log4j.Log4j;
@Log4j
public class HalfSpaceAccessDeniedHandler implements AccessDeniedHandler{

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		// halfSpace 로그인 에러 후에 처리할 코드들을 작성합니다.
		
		log.error("[[[[[[[halfSpace 접근 거부 핸들러 실행");
		log.error("/accessError 페이지로 리다이렉트]]]]]]]]]]" );
		
		
		response.sendRedirect("/accessError");
	}

}
