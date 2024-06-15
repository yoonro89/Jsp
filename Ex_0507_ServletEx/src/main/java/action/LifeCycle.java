package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LifeCycle
 */
@WebServlet("/lc.do")
public class LifeCycle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LifeCycle() {  
        System.out.println("--1. 생성자--");
    }

	public void init(ServletConfig config) throws ServletException {
		//브라우저 정보 초기화
		System.out.println("--2. init()--");
	}
	
	public void destroy() {
		//현재 서블릿의 정보가 변경될 때 호출
		System.out.println("--4. destroy()--");
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("--3. service--");
		
		super.service(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("--3.1 doGet()--");
		
		String name = request.getParameter("name");
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("<body>");
		out.printf("이름 : %s", name);
		out.println("</body>");
		out.println("</html>");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("--3.2 doPost()--");
		response.setContentType("text/html; charset=UTF-8");
		
		//post형식으로 한글 데이터가 넘어오면 깨져서 표시됨
		//한글 깨짐을 방지하기 위해 문자인코딩 설정을 utf-8로 지정해줘야 한다
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		PrintWriter out = response.getWriter();
		
		
		out.println("<html>");
		out.println("<body>");
		out.printf("이름 : %s", name);
		out.println("</body>");
		out.println("</html>");
		
	}

}
