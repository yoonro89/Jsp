package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDAO;
import vo.CartVO;

/**
 * Servlet implementation class CartInsertAct
 */
@WebServlet("/cart_insert.do")
public class CartInsertAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//장바구니에 추가할 상품번호
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		//회원번호
		int m_idx = Integer.parseInt(request.getParameter("m_idx"));
		
		CartVO vo = new CartVO();
		vo.setIdx(idx);
		vo.setM_idx(m_idx);
		
		//이미 장바구니에 같은 상품이 추가되어 있는지를 먼저 확인!(insert를 하기전)
		CartVO res_vo = CartDAO.getInstance().selectOne(vo);
		
		String result = "no";
		if(res_vo == null) {
			result = "yes";
			CartDAO.getInstance().insert(vo);
		}
		
		String resultStr = String.format("[{'result':'%s'}]", result);
		response.getWriter().println(resultStr);
		
	}

}
