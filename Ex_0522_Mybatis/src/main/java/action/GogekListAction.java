package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GogekDAO;
import vo.GogekVO;

/**
 * Servlet implementation class GogekListAction
 */
@WebServlet("/gogeklist.do")
public class GogekListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String search = request.getParameter("search");
		String search_res = "";
		if( search != null && !search.isEmpty() ) {
			search_res = search; 
		}
		
		List<GogekVO> gogek_list = null;
		if(search_res.equals("") ) {
			//전체 고객 조회
			gogek_list = GogekDAO.getInstance().selectGogek();
		}else {
			gogek_list = GogekDAO.getInstance().selectGogek(search_res);
		}
		
		request.setAttribute("list", gogek_list);
		RequestDispatcher disp = request.getRequestDispatcher("gogek_list.jsp");
		disp.forward(request, response);
	}

}
