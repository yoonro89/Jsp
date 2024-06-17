package action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentDAO;
import util.Common;
import util.Paging;
import vo.CommentVO;

/**
 * Servlet implementation class CommListAct
 */
@WebServlet("/comment_list.do")
public class CommListAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//코멘트의 페이징 처리
		int nowPage = 1;
		String page = request.getParameter("page");
		
		if( page != null && !page.isEmpty() ) {
			nowPage = Integer.parseInt(page);
		}
		
		int start = (nowPage - 1) * Common.Comment.BLOCKLIST + 1;
		int end = start + Common.Comment.BLOCKLIST - 1;
		
		
		//메인 게시글 번호
		int idx = Integer.parseInt(request.getParameter("idx"));

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("idx", idx);
		map.put("start", start);
		map.put("end", end);
		
		List<CommentVO> list = CommentDAO.getInstance().selectList(map);
		int row_total = CommentDAO.getInstance().getRowTotal(map);
		
		//코멘트 페이지 메뉴
		String pageMenu = Paging.getPaging("comment_list.do", nowPage, row_total, 
							Common.Comment.BLOCKLIST, Common.Comment.BLOCKPAGE);
		
		request.setAttribute("list", list);
		request.setAttribute("pageMenu", pageMenu);
		
		RequestDispatcher disp = 
				request.getRequestDispatcher("comment_list.jsp");
		disp.forward(request, response);
		
	}

}
