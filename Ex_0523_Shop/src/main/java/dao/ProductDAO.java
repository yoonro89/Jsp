package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.ProductVO;

public class ProductDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static ProductDAO single = null;

	public static ProductDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new ProductDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	SqlSessionFactory factory;
	private ProductDAO() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	//카테고리별 목록조회
	public List<ProductVO> select(String category){
		SqlSession sqlSession = factory.openSession();
		List<ProductVO> list = sqlSession.selectList("p.product_list", category);
		sqlSession.close();
		return list;
	}
	
	//상품 추가
	public int insert(ProductVO vo) {
		
		SqlSession sqlSession = factory.openSession(true);
		int cnt = sqlSession.insert("p.product_insert", vo);
		//sqlSession.commit(); 대신 
		//factory.openSession(true); ←생성자에 true넝어줘도 됨
		sqlSession.close();
		return cnt;
	}
	
	//상세보기 게시글 조회
	public ProductVO selectOne(int idx) {
		SqlSession sqlSession = factory.openSession();
		ProductVO vo = sqlSession.selectOne("p.product_content", idx);
		sqlSession.close();
		return vo;
	}
}
