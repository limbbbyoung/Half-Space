package com.ict.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"
})
@Log4j
public class MemberTests {

	@Autowired
	private PasswordEncoder pwen;
	
	@Autowired
	private DataSource ds;
	
	@Test
	public void testCryptDefaultDB() {
		
		String[] idList = {"user00", "manager00", "admin00"};
		
		String sql = "UPDATE usertest SET password = ? WHERE username = ?";
		
		try {
			Connection cno = ds.getConnection();
			
			for(String id : idList) {
				PreparedStatement pstmt = con.preraredStatement(sql);
			}
		}
		
	}
}
