package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;

/**
 * Servlet implementation class MemberListAction
 */
@WebServlet("/member_list.do")
public class MemberListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<MemberVO> list = MemberDAO.getInstance().selectList();
		
		//리퀘스트 영역에 list를 바인딩
		request.setAttribute("list", list);
		
		//바인딩 된 결과를 사용하고자 하는 페이지를 지정(포워딩)
		RequestDispatcher disp = 
				request.getRequestDispatcher("member_list.jsp");
		disp.forward(request, response);
		
	}

}
