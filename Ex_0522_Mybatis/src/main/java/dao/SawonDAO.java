package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.SawonVO;

public class SawonDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static SawonDAO single = null;

	public static SawonDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new SawonDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	SqlSessionFactory factory;
	
	private SawonDAO() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	//사원목록 조회
	public List<SawonVO> select(){
		
		//factory로 부터 알게된 DB로 접근하여 실제로 쿼리문을 실행하거나 결과를 받을 수 있도록 하는 클래스
		SqlSession sqlSession = factory.openSession();
		
		List<SawonVO> list = sqlSession.selectList("s.sawon_list");
		//mybatis를 사용하려면 VO쪽의 변수명이 실제 테이블의 컬럼명과 완전히 일치해야한다.
		sqlSession.close();
		
		return list;
	}
	
	//부서별 사원조회
	public List<SawonVO> select( int deptno ){
		SqlSession sqlSession = factory.openSession();
		List<SawonVO> list = sqlSession.selectList("s.sawon_list_deptno", deptno); 	//보낼 수 있는 파라미터는 1개로 고정된다. 2개이상 안됨.
		sqlSession.close();
		
		return list;
	}
}
