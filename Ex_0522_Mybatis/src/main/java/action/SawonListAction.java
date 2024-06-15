package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SawonDAO;
import vo.SawonVO;

/**
 * Servlet implementation class SawonListAction
 */
@WebServlet("/sawonlist.do")
public class SawonListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//sawonlist.do?deptno=10
		//sawonlist.do?deptno=		-> empty
		//sawonlist.do				-> null
		int deptno = 0;
		String str_deptno = request.getParameter("deptno");
		if( str_deptno != null && !str_deptno.isEmpty() ){
			deptno = Integer.parseInt(str_deptno);
		}
		
		List<SawonVO> list = null;
		
		if(deptno == 0) {
			//전체 조회
			list = SawonDAO.getInstance().select();
			
		}else {
			//부서별 조회
			list = SawonDAO.getInstance().select( deptno );
		}
		
		
		//바인딩
		request.setAttribute("list", list);
		
		//포워딩
		RequestDispatcher disp = request.getRequestDispatcher("sawon_list.jsp");
		disp.forward(request, response);
	}

}
