package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;

/**
 * Servlet implementation class MemberDelAction
 */
@WebServlet("/member_del.do")
public class MemberDelAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//member_del.do?idx=21
		int dix = Integer.parseInt(request.getParameter("idx"));
		
		int res = MemberDAO.getInstance().delete(dix);
		
		String param = "no";
		if(res > 0) {
			param = "yes";
		}
		
		String resultStr = String.format("[{'param':'%s'}]", param);
		
		response.getWriter().println(resultStr);
		
	}

}
