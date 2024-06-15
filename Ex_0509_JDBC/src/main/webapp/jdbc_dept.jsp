<%@page import="vo.DeptVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//톰캣이 참조할 JNDI를 검색할 준비
	InitialContext ic = new InitialContext();

	//Resource위치 검색
	Context ctx = (Context)ic.lookup("java:comp/env");
	
	//사용할 resource가져오기
	DataSource dataSource = (DataSource)ctx.lookup("jdbc/oracle_test");
	
	//DB연결 객체 얻어오기
	Connection conn = dataSource.getConnection();
	
	System.out.println("--get connection--");
	
	//쿼리문 준비
	String sql = "select * from dept";
	
	//위의 sql문장을 통해 table에 접근
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	//DB에서 필요한 정보를 조회
	ResultSet rs = pstmt.executeQuery();
	
	//부서목록을 저장할 List
	List<DeptVO> dept_list = new ArrayList<>();
	while( rs.next() ){ //다음 row로 내려가는 코드
		DeptVO vo = new DeptVO();
	
		//DB의 컬럼별로 값을 꺼내서 vo에 저장
		vo.setDeptno( rs.getInt("deptno") );
		vo.setDname( rs.getString("dname") );
		vo.setLoc( rs.getString("loc") );
		
		dept_list.add(vo);
	
	}
	
	System.out.println(dept_list.size());
	
	//DB접근을 위해 사용한 모든 객체들은 역순으로 닫는다
	rs.close();
	pstmt.close();
	conn.close();
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send(data){
				let f = document.f;
				let hid = f.deptno;
				hid.value = data;
				
				f.action = "buseo.jsp";
				f.submit();
			}
		</script>
		
	</head>
	
	<body>
		<form name="f">
		
		<input type="hidden" name="deptno">
	
		<table border="1">
			<caption>부서목록</caption>
				<tr>
					<th>부서번호</th>
					<th>부서명</th>
					<th>부서위치</th>
				</tr>
				
				<% for( DeptVO vo : dept_list ){ %>
				<tr>
					<td><%= vo.getDeptno() %></td>
					
					<td>
						<a href="javascript:send('<%= vo.getDeptno() %>');">
						<%= vo.getDname() %>
						</a>
					</td>
					
					<td><%= vo.getLoc() %></td>
				</tr>
				<%} %>
				
		</table>
		
		</form>
	</body>
</html>















