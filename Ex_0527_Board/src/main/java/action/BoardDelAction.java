package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;

/**
 * Servlet implementation class BoardDelAction
 */
@WebServlet("/del.do")
public class BoardDelAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//삭제(된 것 처럼 업데이트)를 위한 idx수신
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		int res = BoardDAO.getInstance().del_update(idx);
		
		String resultStr = "";
		String result = "no";
		
		if( res == 1 ) {
			result = "yes";
		}
		
		resultStr = String.format("[{'result':'%s'}]", result);
		response.getWriter().print(resultStr);
		
	}

}
