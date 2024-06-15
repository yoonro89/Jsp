package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/sub.do")
public class Mybirth extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String year = request.getParameter("year");
		String age = request.getParameter("age");
		String season = request.getParameter("season");
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		
		
		
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		
		out.println("<table border='1'>");
		
		out.println("<tr>");
		out.println("<th>출생년도</th>");
		out.println("<td>" + year + "</td>");
		out.println("</tr>");
		
		out.println("<tr>");
		out.println("<th>나이</th>");
		out.println("<td>" + age + "</td>");
		out.println("</tr>");
		
		out.println("<tr>");
		out.println("<th>계절</th>");
		out.println("<td>" + season + "</td>");
		out.println("</tr>");
		
		out.println("</table>");
		
		out.println("</body>");
		out.println("</html>");
		
	}

}
