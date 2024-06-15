package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GreetServlet
 */
@WebServlet("/greet.do")
public class GreetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//greet.do?nation=kor&age=22
		
		//클라이언트(greet.jsp)에서 넘어온 파라미터 정보를 수신
		//클라이언트가 넘겨준 파라미터는 대부분 String타입으로 받아야 한다
		//파일전송과 같은 예외적인 경우에 char[]형태로 넘어오는 경우가 있긴 하나,
		//int, char, boolean등으로 넘어오는 경우는 아예 없다.
		String nation = request.getParameter("nation");
		String msg = "";
		
		String age = request.getParameter("age");
		
		//잘못된 형식의 파라미터
		//1) greet.do?nation=	: nation = ""이거나, nation=isEmpty()인 상태
		//2) greet.do? 			: nation=null인 상태
		
		if( nation == null || nation.isEmpty() ) {
			nation = "kor";
		}
		
		if( nation.equals("kor") ) {
			msg = "안녕하세요";
			
		}else if(nation.equals("eng")) {
			msg = "Hello";
			
		}else if(nation.equals("jpn")) {
			msg = "おはようございます";
			
		}else if(nation.equals("chn")) {
			msg = "早上好";
		}
		
		//응답처리객체로 결과를 html형태로 출력
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("<body>");
		out.printf("%s<br>", msg);
		out.printf("나이 : %s", age);
		out.println("<br><a href='greet.jsp'>다시보기</a>");
		out.println("</body>");
		out.println("</html>");
		
	}

}
