package action;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.ProductDAO;
import vo.ProductVO;

/**
 * Servlet implementation class ProductInsertAct
 */
@WebServlet("/insert.do")
public class ProductInsertAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String web_path = "/images/";
		ServletContext app = request.getServletContext();
		
		//상대경로 → 절대경로
		String path = app.getRealPath(web_path);
		System.out.println("절대경로 : " + path);
		
		MultipartRequest mr = new MultipartRequest(request, 
				path,
				1024*1024*100,
				"utf-8",
				new DefaultFileRenamePolicy());
		
		//업로드 된 파일정보 얻어오기
		String p_image_s = "no_file";
		String p_image_l = "no_file";
		
		File f = mr.getFile("p_image_s");
		if( f != null ) {
			p_image_s = f.getName();//업로드된 실제 파일이름
		}
		
		f = mr.getFile("p_image_l");
		if( f != null ) {
			p_image_l = f.getName();
		}
		
		String category = mr.getParameter("category");
		
		//받아온 정보들을 vo에 저장 (mapper가 받아야할 파라미터가 여러개일 경우 vo로 묶어 보낸다)
		ProductVO vo = new ProductVO();
		vo.setCategory( category );
		vo.setP_num(mr.getParameter("p_num"));
		vo.setP_name(mr.getParameter("p_name"));
		vo.setP_company( mr.getParameter("p_company") );
		vo.setP_price( Integer.parseInt( mr.getParameter("p_price")) );
		vo.setP_saleprice( Integer.parseInt( mr.getParameter("p_saleprice")) );
		vo.setP_image_s(p_image_s);
		vo.setP_image_l(p_image_l);
		vo.setP_content(mr.getParameter("p_content"));
		
		ProductDAO.getInstance().insert(vo);
		
		response.sendRedirect("list.do?category=" + category); 
		
	}//service()

}//ㅅ
