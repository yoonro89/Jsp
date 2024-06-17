package action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import vo.BookVO;

/**
 * Servlet implementation class BookListAct
 */
@WebServlet("/list.do")
public class BookListAct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//검색어
		String search_txt = request.getParameter("search_txt");
		
		//네이버 API에 한글을 요청하려면 UTF-8구조로 변환하여 전달해야 한다.
		String search =URLEncoder.encode(search_txt, "UTF-8");
		
		//도서 검색을 위한 url경로
		String urlStr = "https://openapi.naver.com/v1/search/book.json?query="+search+"&start=1&display=10";
		
		URL url = new URL(urlStr);
		HttpURLConnection connection = (HttpURLConnection)url.openConnection();
		
		//발급받은 ID
		connection.setRequestProperty("X-Naver-Client-Id", "YIiQj6KFgqzRq1qBxgxl");
		
		//발급받은 SECRET
		connection.setRequestProperty("X-Naver-Client-Secret", "1AqlbxyAcO");
		
		//connection을 통해 요청한 검색결과를 읽어오자
		BufferedReader br = new BufferedReader(new InputStreamReader( connection.getInputStream() ));
		
		String line = "";
		String resultJson = "";
		
		while( (line = br.readLine()) != null ) {
			resultJson += line;
		}
		
		System.out.println(resultJson);
		
		br.close();
		connection.disconnect();
		//가져온 JSON형식의 문자열을 실제 json으로 변경
		//JSON배열 구조를 가져오는 객체
		JSONArray json_arr = null;
		
		//일반 JSON구조를 가져오는 객체
		JSONObject json_obj = null;
		
		try {
			JSONParser jsonParser = new JSONParser();
			json_obj = (JSONObject)jsonParser.parse(resultJson);
			
			//변환된 json_obj를 통해 items라는 이름의 배열만 추출
			json_arr = (JSONArray)json_obj.get("items");
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		//제목, 저장, 가격, 이미지경로를 vo에 저장한 뒤 list에 적재
		List<BookVO> list = new ArrayList<BookVO>();
		
		for( int i = 0; i < json_arr.size(); i++ ) {
			BookVO vo = new BookVO();
			
			json_obj = (JSONObject)json_arr.get(i);
			String title = (String)json_obj.get("title");
			String image = (String)json_obj.get("image");
			String author = (String)json_obj.get("author");
			String discount = (String)json_obj.get("discount");
			
			vo.setTitle(title);
			vo.setImage(image);
			vo.setAuthor(author);
			vo.setDiscount(discount);
			
			list.add(vo);
			
		}
		
		request.setAttribute("list", list);
		request.setAttribute("search_txt", search_txt);
		
		RequestDispatcher disp = request.getRequestDispatcher("book_search.jsp");
		disp.forward(request, response);
		
	}

}
