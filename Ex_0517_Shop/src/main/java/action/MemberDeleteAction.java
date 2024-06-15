package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;

/**
 * Servlet implementation class MemberDeleteAction
 */
@WebServlet("/del.do")
public class MemberDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//del.do?idx=
		int idx = Integer.parseInt(request.getParameter("idx"));
		int vo = MemberDAO.getInstance().delete(idx);
		
		response.sendRedirect("member_list.jsp");
		
	}

}
