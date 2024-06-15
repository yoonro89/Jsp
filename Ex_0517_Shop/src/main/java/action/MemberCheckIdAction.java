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
 * Servlet implementation class MemberCheckIdAction
 */
@WebServlet("/check_id.do")
public class MemberCheckIdAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//check_id.do?id=one
		String id = request.getParameter("id");
		MemberVO vo = MemberDAO.getInstance().selectOne(id);
		
		String res = "no";
		
		if( vo == null ) {
			res = "yes";
		}
		
		//DB를 거쳐 얻어낸 결과를 JSON구조로 묶어서 콜백메서드로 전달
		String resultStr = String.format("[{'result':'%s', 'id':'%s'}]", res, id);
		
		response.getWriter().println(resultStr);
	}

}
