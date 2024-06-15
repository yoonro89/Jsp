package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.CartVO;

public class CartDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static CartDAO single = null;

	public static CartDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new CartDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	SqlSessionFactory factory;
	private CartDAO() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	//회원별 장바구니 목록
	public List<CartVO> select(int m_idx){
		SqlSession sqlSession = factory.openSession();
		List<CartVO> list = sqlSession.selectList("c.cart_list", m_idx);
		sqlSession.close();
		return list;
	}
	
	//회원별 장바구니 상품 가격의 총계
	public int selectTotalAmount(int m_idx) {
		SqlSession sqlSession = factory.openSession();
		int total = sqlSession.selectOne("c.cart_total_amount", m_idx);
		sqlSession.close();
		return total;
	}
	
	//장바구니 상품 수량 수정
	public int update_cnt(Map<String, Integer> map){
		SqlSession sqlSession = factory.openSession(true);//()안에 true가 들어있는 의미 → auto commit (insert, delete, update에 대해선 잊지말고 사용하자)
		int res = sqlSession.update("c.cart_cnt_update", map);
		sqlSession.close();
		return res;
	}
	
	//장바구니 상품 삭제
	public int delete(int c_idx) {
		SqlSession sqlSession = factory.openSession(true);
		int res = sqlSession.delete("c.cart_idx_del", c_idx);
		sqlSession.close();
		return res;
	}
	
	//장바구니에 이미 등록된 상품인지 조회
	public CartVO selectOne(CartVO vo) {
		SqlSession sqlSession = factory.openSession();
		CartVO resVO = sqlSession.selectOne("c.cart_one", vo);
		sqlSession.close();
		return resVO;
	}
	
	//장바구니에 새 항목 추가
	public int insert(CartVO vo) {
		SqlSession sqlSession = factory.openSession(true);
		int res = sqlSession.insert("c.cart_insert", vo);
		sqlSession.close();
		return res;
	}
}
