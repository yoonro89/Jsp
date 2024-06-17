package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

/**
 * Servlet implementation class BoardReplyAct
 */
@WebServlet("/reply.do")
public class BoardReplyAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//페이지 번호
		String page = request.getParameter("page");
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String pwd = request.getParameter("pwd");
		String ip = request.getRemoteAddr();
		
		
		BoardDAO dao = BoardDAO.getInstance();
		
		//댓글을 작성하고 싶은 게시글의 idx에 해당되는 상세정보를 얻기
		BoardVO baseVO = dao.selectOne(idx);
		
		//가져온 baseVO의 step보다 큰 값을 가진 데이터들의 step을 +1처리
		dao.update_step(baseVO);
		
		//댓글vo
		BoardVO vo = new BoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		vo.setIp(ip);
		//댓글이 들어갈 위치 설정
		vo.setRef(baseVO.getRef());
		vo.setStep(baseVO.getStep()+1);
		vo.setDepth(baseVO.getDepth()+1);
		
		dao.reply(vo);
		response.sendRedirect("list.do?page="+page);
	}

}
