package com.halfspace.test;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

// oracle 서버 접속 테스트
@Log4j
public class OjdbcConnectionTest {
	
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testConnection() {
		try(Connection con = DriverManager.getConnection(
				"jdbc:oracle:thin:@localhost:1521/XEPDB1",
				"c##mydata",
				"halfspace")){
			log.info(con);
			log.info("c##data 어카운트 접속");
			log.info("정상적으로 연결되었습니다.");
		} catch(Exception e) {
			fail(e.getMessage());
		}
	}
	
	
}
