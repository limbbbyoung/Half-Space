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
public class UserTests {

	@Autowired
	private PasswordEncoder pwen;
	
	@Autowired
	private DataSource ds;
	
	//@Test
	public void testCryptDefaultDB() {
		
		String[] idList = {"user00", "manager00", "admin00"};
		
		String sql = "UPDATE usertest SET password = ? WHERE username = ?";
		
		try {
			Connection con = ds.getConnection();
			
			for(String id : idList) {
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(1, pwen.encode("pw00"));
				pstmt.setString(2, id);
				pstmt.executeUpdate();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	} // testCryptDefaultDB END
	
	//@Test
	public void testCreateUser00() {
		try {
		
			Connection con = ds.getConnection();
			String sql = "INSERT INTO user_tbl(userid, userpw, username, gender, birthdate, email, phone_num, address) "
					+ "VALUES(?, ?, ?, ?, TO_DATE(?, 'YYYYMMDD'), ?, ?, ?)";

			PreparedStatement pstmt = con.prepareStatement(sql);
			
			pstmt.setString(2, pwen.encode("pw" + 00));
				
				pstmt.setString(1, "user0");
				pstmt.setString(3, "유저0");
				pstmt.setString(4, "Y");
				pstmt.setString(5, "19990909");
				pstmt.setString(6, "이메일");
				pstmt.setString(7, "00000000000");
				pstmt.setString(8, "주소");

				pstmt.execute();
				
		}catch(Exception e) {
			e.printStackTrace();
		}
	} // createUser00 END
	
	
	
	//@Test
	public void testCryptUserDB() {
		try {
			Connection con = ds.getConnection();
			String sql = "INSERT INTO user_tbl(userid, userpw, username, gender, birthdate, email, phone_num, address) "
					+ "VALUES(?, ?, ?, ?, TO_DATE(?, 'YYYYMMDD'), ?, ?, ?)";

		
			for (int i=1; i<=50; i++) {
				PreparedStatement pstmt = con.prepareStatement(sql);
				
				pstmt.setString(2, pwen.encode("pw" + i));
				
				if(i <= 15) {
					
					pstmt.setString(1, "user" + i);
					pstmt.setString(3, "유저" + i);
					pstmt.setString(4, "Y");
					pstmt.setString(5, "19990909");
					pstmt.setString(6, "이메일");
					pstmt.setString(7, "00000000000");
					pstmt.setString(8, "주소");

				} else if(i <= 30) {

					pstmt.setString(1, "user" + i);
					pstmt.setString(3, "유저" + i);
					pstmt.setString(4, "N");
					pstmt.setString(5, "19990909");
					pstmt.setString(6, "이메일");
					pstmt.setString(7, "00000000000");
					pstmt.setString(8, "주소");

				} else if(i <= 40) {
					pstmt.setString(1, "user" + i);
					pstmt.setString(3, "매니저" + i);
					pstmt.setString(4, "Y");
					pstmt.setString(5, "19990909");
					pstmt.setString(6, "이메일");
					pstmt.setString(7, "00000000000");
					pstmt.setString(8, "주소");

				} else if(i <= 50) {
					pstmt.setString(1, "user" + i);
					pstmt.setString(3, "운영자" + i);
					pstmt.setString(4, "Y");
					pstmt.setString(5, "19990909");
					pstmt.setString(6, "이메일");
					pstmt.setString(7, "00000000000");
					pstmt.setString(8, "주소");

				}
				
				pstmt.execute();
			}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
	} // testCryptUserDB() END
	
	@Test
	public void testInsertAuth() {
		try {
			Connection con = ds.getConnection();
			String sql ="INSERT INTO user_auth(userid, auth) VALUES(?,?)";
			
			for (int i=1; i<=50; i++) {
				PreparedStatement pstmt = con.prepareStatement(sql);
				
				if(i <= 30) {
					pstmt.setString(1, "user" + i);
					pstmt.setString(2, "ROLE_USER");
				} else if(i <= 40) {
					pstmt.setString(1, "user" + i);
					pstmt.setString(2, "ROLE_MANAGER");
				} else if(i <= 50) {
					pstmt.setString(1, "user" + i);
					pstmt.setString(2, "ROLE_ADMIN");
				}
				
				pstmt.execute();
			} // for END
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	} //testInsertAuth END

}
