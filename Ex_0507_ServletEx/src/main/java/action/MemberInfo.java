package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member.do")
public class MemberInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		//member.do?name=hong&id=abc.....
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String gender = request.getParameter("gender");
		String blood = request.getParameter("blood");
		String profile = request.getParameter("profile");
		
		//친구정보 배열로 받기
		String[] friends = request.getParameterValues("friend");
		String fri_str = "";
		for( String f : friends ) {
			fri_str += f + " ";
		}
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");

		out.printf("이름 : %s<br>", name);
		out.printf("아이디 : %s<br>", id);
		out.printf("비밀번호 : %s<br>", pwd);
		out.printf("성병 : %s<br>", gender);
		out.printf("혈액형 : %s<br>", blood);
		out.printf("친구 : %s<br>", fri_str);
		out.printf("프로필 : <pre>%s</pre><br>", profile);
		
		
		out.println("</body>");
		out.println("</html>");
		
	}

}
