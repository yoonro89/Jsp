package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BoardDAO;
import vo.BoardVO;

/**
 * Servlet implementation class BoardViewAct
 */
@WebServlet("/view.do")
public class BoardViewAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//view.do?idx=21
		int idx = Integer.parseInt( request.getParameter("idx"));
		
		BoardDAO dao = BoardDAO.getInstance();
		
		//상세보기를 위한 게시글 조회
		BoardVO vo = dao.selectOne(idx);
		
		//조회수 무한 증가 방지를 위한 세션
		HttpSession session = request.getSession();
		String show = (String)session.getAttribute("show");
		
		if(show == null) {
			//조회수 증가
			dao.update_readhit(idx);
			session.setAttribute("show", "");
		}
		
		
		//바인딩
		request.setAttribute("vo", vo);
		RequestDispatcher disp = request.getRequestDispatcher("board_view.jsp");
		disp.forward(request, response);
	}

}
