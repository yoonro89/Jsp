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
		
		//쵀대 업로드 용량을 지정(바이트 단위) : 여기선 100메가로 설정
		int max_size = 1024 * 1024 * 100;
		
		//파일을 포함한 업로드를 처리하는 객체
		MultipartRequest mr = new MultipartRequest(
			//MultipartRequest(이하 멀파리)는 라이브러리에 cos.jar가 없으면 사용할 수 없다.
								request,	//넘어온 파라미터를 수신(request의 역할) 해서 멀파리에게 위임
								path, 		//파일 저장 경로
								max_size, 	//최대 용량
								"utf-8", 	//멀파리를 사용하는 경우 한글깨짐처리를 여기서 함.
								new DefaultFileRenamePolicy());
											//동일파일명정책 : 동일명의 파일을 자동으로 개명
		
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
