package action;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PhotoDAO;

/**
 * Servlet implementation class PhotoDelAction
 */
@WebServlet("/photo_del.do")
public class PhotoDelAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		String filename = request.getParameter("filename");
		
		String web_path = "/upload/";
		ServletContext app = request.getServletContext();
		String path = app.getRealPath(web_path);
		
		//데이터 삭제
		int res = PhotoDAO.getInstance().delete(idx);
		
		if( res > 0 ){
			File f = new File(path, filename);
			
			if(f.exists()){
				f.delete();//물리적으로 이미지 파일을 삭제
			}
		}
		
		response.sendRedirect("list.do");
		
	}

}
