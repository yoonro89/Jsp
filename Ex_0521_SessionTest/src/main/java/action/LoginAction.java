package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import vo.MemberVO;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/login.do")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		MemberVO user = MemberDAO.getInstance().selectOne(id);
		
		String param = "";
		String resultStr = "";
		
		//id가 존재하지 않을때
		if( user == null ){
			param = "no_id";
			resultStr = String.format("[{'param':'%s'}]", param);
			response.getWriter().println(resultStr);
			return;
		}
		
		//비밀번호 일치 여부
		if( !user.getPwd().equals(pwd )){
			param = "no_pwd";
			resultStr = String.format("[{'param':'%s'}]", param);
			response.getWriter().println(resultStr);
			return;
		}
		
		//아이디와 비밀번호에 문제가 없다면 세션에 user객체 저장
		//세션은 서버자체의 메모리를 사용하기 때문에, 많을 수록 브라우저를 느리게 만드므로
		//꼭 필요한 곳에서만 쓸 수 있도록 하자!!!
		HttpSession session = request.getSession();
		session.setAttribute("user", user);		//어디서도 조회가 가능하기 떄문에 포워딩이 필요없다
		
		//로그인 성공한 상태
		param = "clear";
		resultStr = String.format("[{'param':'%s'}]", param);
		response.getWriter().println(resultStr);
	}

}
