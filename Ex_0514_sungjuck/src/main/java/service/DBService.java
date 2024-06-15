package service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBService {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static DBService single = null;

	public static DBService getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new DBService();
		//생성된 객체정보를 반환
		return single;
	}
	
	DataSource ds;
	
	public DBService() {	//private로 만들시 외부에서는 new DBService();로 접근을 할 수 없다.

		try {
			InitialContext ic = new InitialContext();
			Context ctx = (Context)ic.lookup("java:comp/env");
			ds = (DataSource)ctx.lookup("jdbc/oracle_test");
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}//생성자
	
	public Connection getConnection() {
		Connection conn = null;
		
		try {
			conn = ds.getConnection();	//데이터베이스 연결까지만 관장하는 객체
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return conn;
		
	}
	
}
