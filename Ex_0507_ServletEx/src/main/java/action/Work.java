package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/work.do")
public class Work extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String gender = request.getParameter("gender");
		String blood_type = request.getParameter("blood_type");
		String pr = request.getParameter("pr");
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		out.print("<!DOCTYPE html>");
		out.print("<html><head><title>UserInfomation</title></head>");
		
		out.print("<style>"
				+ "table{border:2px solid black; border-collapse:collapse;} "
				+ "td{padding:10px;}"
				+ " </style>"
				);
		
		out.println("<html>");
		out.println("<body>");
		
		out.println("<table border='1'>");
		
		out.println("<tr>");
		out.println("<td>이름</td>");
		out.println("<td>" + name + "</td>");
		out.println("</tr>");
		
		out.println("<tr>");
		out.println("<td>아이디</td>");
		out.println("<td>" + id + "</td>");
		out.println("</tr>");
		
		out.println("<tr>");
		out.println("<td>비밀번호</td>");
		out.println("<td>" + pw + "</td>");
		out.println("</tr>");
		
		out.println("<tr>");
		out.println("<td>성별</td>");
		out.println("<td>" + gender + "</td>");
		out.println("</tr>");
		
		out.println("<tr>");
		out.println("<td>혈액형</td>");
		out.println("<td>" + blood_type + "</td>");
		out.println("</tr>");
		
		out.println("<tr>");
		out.println("<td>프로필</td>");
		out.println("<td>" + pr + "</td>");
		out.println("</tr>");
		
		out.println("</table>");
		
		out.println("</body>");
		out.println("</html>");
		
	}

}
