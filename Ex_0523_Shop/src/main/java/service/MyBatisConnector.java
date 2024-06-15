package service;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MyBatisConnector {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static MyBatisConnector single = null;

	public static MyBatisConnector getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new MyBatisConnector();
		//생성된 객체정보를 반환
		return single;
	}
	
	//어떤 DB로 접속할 것인가, mapper로 누구를 참조할 것인가 등을 감지하는 클래스
	SqlSessionFactory factory = null;
	
	private MyBatisConnector() {
		try {
			//sqlMapConfig.xml
			Reader reader = Resources.getResourceAsReader("config/mybatis/sqlMapConfig.xml");		//보통 Resource하면 참조 파일이라고 생각하면 편함
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public SqlSessionFactory getSqlSessionFactory() {
		return factory;
	}
	
}
