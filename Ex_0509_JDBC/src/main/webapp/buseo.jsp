<%@page import="java.util.ArrayList"%>
<%@page import="vo.SawonVO"%>
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
	String deptno = request.getParameter("deptno");
	
	InitialContext ic = new InitialContext();
	Context ctx = (Context)ic.lookup("java:comp/env");
	DataSource dataSource = (DataSource)ctx.lookup("jdbc/oracle_test");
	Connection conn = dataSource.getConnection();
	
	PreparedStatement pstmt = conn.prepareStatement(
			"select * from sawon where deptno="+deptno);
	ResultSet rs = pstmt.executeQuery();
	List<SawonVO> s_list = new ArrayList<>();
	while(rs.next()){
		SawonVO vo = new SawonVO();
		
		vo.setDeptno( rs.getInt("deptno") );
		vo.setSabun( rs.getInt("sabun") );
		vo.setSajob( rs.getString("sajob") );
		vo.setSaname( rs.getString("saname") );
		
		s_list.add(vo);
		
	}
	
	rs.close();
	pstmt.close();
	conn.close();
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<form>
			<table border="1">
			<caption>각 부서명별 분류</caption>
				<tr>
					<th>부서번호</th>
					<th>사원번호</th>
					<th>직책</th>
					<th>이름</th>
				</tr>
				
				<% for(SawonVO vo : s_list){ %>
				<tr>
					<td><%= vo.getDeptno() %></td>
					<td><%= vo.getSabun() %></td>
					<td><%= vo.getSajob() %></td>
					<td><%= vo.getSaname() %></td>
				</tr>
				<%} %>
			</table>
		</form>
	</body>
</html>