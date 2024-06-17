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
import javax.servlet.http.HttpSession;

import dao.BoardDAO;
import util.Common;
import util.Paging;
import vo.BoardVO;

/**
 * Servlet implementation class BoardListAct
 */
@WebServlet("/list.do")
public class BoardListAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//list.do?page=2
		int nowPage = 1;
		String page = request.getParameter("page");
		if( page != null && !page.isEmpty() ) {
			nowPage = Integer.parseInt(page);
		}
		
		//한 페이지에 표시되는 게시물의 시작과 끝 번호를 계산
		//?page=2
		int start = (nowPage - 1) * Common.Board.BLOCKLIST + 1;
		int end = start + Common.Board.BLOCKLIST - 1;
		
		//start, end변수를 Map에 저장
		Map<String, Object>map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		//검색어 관련 파라미터 수신
		//list.do?search=name&&search_text=abc&&page=2
		String search = request.getParameter("search");
		String search_text = request.getParameter("search_text");
		
		//검색할 내용이 있는 경우
		if(search != null && !search.equals("all")) {
			switch( search ) {
			case "name_subject_content":
				map.put("name", search_text);
				map.put("subject", search_text);
				map.put("content", search_text);
				break;
			case "name":
				map.put("name", search_text);
				break;
			case "subject":
				map.put("subject", search_text);
				break;
			case "content":
				map.put("content", search_text);
				break;
			}//switch()
		}
		
		
		//전체 목록 가져오기
		List<BoardVO> list = BoardDAO.getInstance().selectList(map);
		
		//전체 게시글 수 가져오기
		int row_total = BoardDAO.getInstance().getRowTotal(map);//검색된 결과에 따라 게시글의 수가 달라지기 때문에 파라미터 map을 넘겨야함
		
		//페이지 메뉴 생성
		String search_param = String.format("search=%s&search_text=%s", search, search_text);
		
		String pageMenu = Paging.getPaging("list.do", nowPage, row_total, 
				search_param,
				Common.Board.BLOCKLIST, 
				Common.Board.BLOCKPAGE);
		
		//list객체 바인딩 및 포워딩
		request.setAttribute("list", list);
		request.setAttribute("pageMenu", pageMenu);
		
		//조회수 증가를 위해 기록된 show정보를 삭제
		HttpSession session = request.getSession();
		session.removeAttribute("show");
		
		RequestDispatcher disp = request.getRequestDispatcher("board_list.jsp");
		disp.forward(request, response);
		
	}

}
