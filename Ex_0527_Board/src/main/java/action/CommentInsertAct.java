package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentDAO;
import vo.CommentVO;

/**
 * Servlet implementation class CommentInsertAct
 */
@WebServlet("/comment_insert.do")
public class CommentInsertAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		//코멘트 작성을 위한 메인글의 idx
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		String name = request.getParameter("name");
		String content = request.getParameter("content");
		String pwd = request.getParameter("pwd");
		
		CommentVO vo = new CommentVO();
		vo.setIdx(idx);
		vo.setName(name);
		vo.setContent(content);
		vo.setPwd(pwd);
		
		int res = CommentDAO.getInstance().insert(vo);
		
		String result = "no";
		if( res > 0 ) {
			result = "yes";
		}
		
		String resultStr = String.format("[{'result':'%s'}]", result);
		response.getWriter().print(resultStr);
		
	}

}
