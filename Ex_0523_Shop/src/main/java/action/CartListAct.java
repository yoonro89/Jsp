package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDAO;
import vo.CartVO;

/**
 * Servlet implementation class CartListAct
 */
@WebServlet("/cart_list.do")
public class CartListAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//현재 로그인되어 있는 회원의 번호가 1이라고 가정
		int m_idx = 1;
		
		//장바구니 목록 조회
		List<CartVO> list = CartDAO.getInstance().select(m_idx);
		int total_amount = CartDAO.getInstance().selectTotalAmount(m_idx);
		
		
		//바인딩
		request.setAttribute("list", list);
		request.setAttribute("total_amount", total_amount);
		
		RequestDispatcher disp = request.getRequestDispatcher("cartList.jsp");
		disp.forward(request, response);
		
	}

}
