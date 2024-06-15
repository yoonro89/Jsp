package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelloServlet
 */
@WebServlet("/Hello.do")
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 서블릿(server + let)
	 	- 서버에서 실행되는 서비스(사용자의 요구사항)를 제공해주는 객체
	 	- 웹 응용프로그램을 만드는 자바기술이며 실행 결과값은 html로 반환
	 	- html의 정적인 문제를 해결할 수 있는 동적인 특징을 갖는다
	 	- 자바로 작성되어 자바의 일반적인 특징을 모두 갖고있다.
	 	- 스레드로 처리
	 */
	protected void service(
			HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		//요청처리 객체 : request [들어온사람의 정보가 저장됨]
		//응답처리 객체 : response
		
		//Hello.do라는 url mapping이 호출되면 가장 먼저 호출되는 메서드
		System.out.println("---HelloServlet, sevice()---");
		
		//요청자 정보(ip)획득
		String ip = request.getRemoteAddr();
		System.out.println(ip + "님이 접속함");
		
		//응답
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		//out.printf("%s님 방문을 환영합니다", ip);
		
		out.println("<html>");
		out.println("<head>");
		out.println("<title>환영합니다</title>");
		out.println("<style> h1{color:red} </style>");
		out.println("</head>");
		
		out.println("<body>");
		out.printf("<h1>%s님 방문을 환영합니다</h1>", ip);
		out.println("</body>");
		out.println("</html>");
		
	}

}
