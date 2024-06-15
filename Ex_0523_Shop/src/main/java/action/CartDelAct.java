package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDAO;

/**
 * Servlet implementation class CartDelAct
 */
@WebServlet("/cart_delete.do")
public class CartDelAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//지우고싶은 상품 번호
		int c_idx = Integer.parseInt(request.getParameter("c_idx"));
		
		//DB에서 해당 장바구니 상품 삭제
		CartDAO.getInstance().delete(c_idx);
		
		//장바구니 목록으로 복귀
		response.sendRedirect("cart_list.do");
		
	}

}
