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

import dao.PhotoDAO;
import vo.PhotoVO;

/**
 * Servlet implementation class PhotoInsertAction
 */
@WebServlet("/insert.do")
public class PhotoInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String web_path = "/upload/";
		ServletContext app = request.getServletContext();
		
		//상대경로 → 절대경로
		String path = app.getRealPath(web_path);
		System.out.println("절대경로 : " + path);
		
		//파일을 포함하고 있는 파라미터 수신을 위한 객체
		MultipartRequest mr = new MultipartRequest(
							request, 
							path,
							1024 * 1024 * 100,
							"utf-8",
							new DefaultFileRenamePolicy());
		
		String filename = "no_file";
		//업로드된 파일정보 획득
		File f = mr.getFile("photo");
		
		if( f != null ){
			filename = f.getName();
		}
		
		//파일 이외의 일반 파라미터 수신
		String title = mr.getParameter("title");
		String pwd = mr.getParameter("pwd");
		String ip = request.getRemoteAddr();
		
		PhotoVO vo = new PhotoVO();
		vo.setTitle(title);
		vo.setFilename(filename);
		vo.setPwd(pwd);
		vo.setIp(ip);
		
		PhotoDAO.getInstance().insert(vo);
		
		response.sendRedirect("list.do");
		
	}

}
