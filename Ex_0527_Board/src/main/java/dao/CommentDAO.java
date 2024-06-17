package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.CommentVO;

public class CommentDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static CommentDAO single = null;

	public static CommentDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new CommentDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	SqlSessionFactory factory;
	
	private CommentDAO() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	public int insert(CommentVO vo) {
		SqlSession sqlSession = factory.openSession(true);
		int res = sqlSession.insert("c.comment_insert", vo);
		sqlSession.close();
		return res;
	}
	
	//코멘트 조회
	public List<CommentVO> selectList(Map<String, Object> map){
		SqlSession sqlSession = factory.openSession();
		List<CommentVO> list = sqlSession.selectList("c.comment_list", map);
		sqlSession.close();
		return list;
	}
	
	//페이징을 위한 전체 코멘트의 개수
	public int getRowTotal(Map<String, Object> map) {
		SqlSession sqlSession = factory.openSession();
		int cnt = sqlSession.selectOne("c.comment_idx_count", map);
		sqlSession.close();
		return cnt;
	}
	
	//코멘트 삭제
	public int comm_del(int c_idx){
		SqlSession sqlSession = factory.openSession(true);
		int res = sqlSession.delete("c.comment_delete", c_idx);
		sqlSession.close();
		return res;
	}
}
