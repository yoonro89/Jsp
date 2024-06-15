package action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDAO;
import vo.ProductVO;

/**
 * Servlet implementation class ProductViewAct
 */
@WebServlet("/view.do")
public class ProductViewAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//view.do?idx=1
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		ProductVO vo = ProductDAO.getInstance().selectOne(idx);
		
		//바인딩
		request.setAttribute("vo", vo);
		
		//포워딩
		RequestDispatcher disp = request.getRequestDispatcher("product_content.jsp"); 
		disp.forward(request, response);
		
	}

}
