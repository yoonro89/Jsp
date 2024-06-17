package action;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class FileUploadAction
 */
@WebServlet("/upload.do")
public class FileUploadAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//String path = "c:/upload";
		String web_path = "/upload/";	//webapp/upload 	(절대경로와 연결되어있는)상대경로를 찾음
		
		//현재 프로젝트 정보를 가진 객체
		ServletContext application = request.getServletContext();
		
		//상대경로 → 절대경로로 변환
		String path = application.getRealPath(web_path);
		
		System.out.println("절대경로 : " +path);
		
		//최대 업로드 용량 100Mb
		int max_size = 1024 * 1024 * 100;
		
		//파일을 포함한 업로드를 처리하는 객체
		MultipartRequest mr = new MultipartRequest(
								request, 
								path, 
								max_size, 
								"utf-8", 
								new DefaultFileRenamePolicy());//동일파일명정책 : 동일명의 파일을 자동으로 개명
		
		//업로드 된 파일정보 얻어오기
		String filename = "no_file";
		
		//photo파라미터를 File형식으로 수신
		File f = mr.getFile("photo");
		
		if( f != null ){
			filename = f.getName();//업로드된 파일명
		}
		
		//파일 이외의 파라미터 수신
		//아래와 같이 수신 시도하면 오류남
		//String title = request.getParameter("title");
		String title = mr.getParameter("title");
		
		//title과 filename을 바인딩
		request.setAttribute("title", title);
		request.setAttribute("filename", filename);
		
		RequestDispatcher disp =
					request.getRequestDispatcher("result.jsp");
		disp.forward(request, response);
	}

}
