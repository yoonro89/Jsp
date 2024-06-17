package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentDAO;

/**
 * Servlet implementation class CommDelAct
 */
@WebServlet("/comment_del.do")
public class CommDelAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//comment_del.do?c_idx=15
		int c_idx = Integer.parseInt(request.getParameter("c_idx"));
		int res = CommentDAO.getInstance().comm_del(c_idx); 
		
		String result = "no";
		if( res > 0 ) {
			result = "yes";
		}

		String resultStr = String.format("[{'result':'%s'}]", result);
		response.getWriter().print(resultStr);
	}

}
