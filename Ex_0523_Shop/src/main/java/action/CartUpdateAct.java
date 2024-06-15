package action;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDAO;
import vo.CartVO;

/**
 * Servlet implementation class CartListUpdate
 */
@WebServlet("/cart_update.do")
public class CartUpdateAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//장바구니 목록 수정에 필요한 값 받기
		int c_idx = Integer.parseInt(request.getParameter("c_idx"));
		int c_cnt = Integer.parseInt(request.getParameter("c_cnt"));
		
		/*
		 * CartVO vo = new CartVO(); vo.setC_cnt(c_cnt); vo.setC_idx(c_idx);
		 * CartDAO.getInstance().Update(vo);
		 */
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("_c_idx", c_idx);
		map.put("_c_cnt", c_cnt);
		
		CartDAO.getInstance().update_cnt(map);
		
		response.sendRedirect("cart_list.do");
	}

}
