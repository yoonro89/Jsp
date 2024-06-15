<%@page import="vo.SawonVO"%>
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

	String deptno = request.getParameter("deptno");

	InitialContext ic = new InitialContext();
	
	Context ctx = (Context)ic.lookup("java:comp/env");
	
	DataSource dataSource = (DataSource)ctx.lookup("jdbc/oracle_test");
	
	Connection conn = dataSource.getConnection();
	
	String sql = "select * from sawon where deptno="+deptno;
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	List<SawonVO> sawon_list = new ArrayList<>();
	while( rs.next() ){
		SawonVO vo = new SawonVO();
		
		vo.setSabun( rs.getInt("sabun") );
		vo.setSaname( rs.getString("saname") );
		vo.setSajob( rs.getString("sajob") );
		vo.setSapay( rs.getInt("sapay") );
		
		sawon_list.add(vo);
		
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
		
		<style>
			table{	border-collapse:collapse;
					border:1px solid black;}
			caption{}
		</style>
		
	</head>
	
	<body>
		<table border="1">
			<caption>사원목록</caption>
				<tr>
					<th>사번</th>
					<th>이름</th>
					<th>직책</th>
					<th>급여</th>
				</tr>
				<% for( SawonVO vo : sawon_list ){ %>
				<tr>
					<td><%= vo.getSabun() %></td>
					<td><%= vo.getSaname() %></td>
					<td><%= vo.getSajob() %></td>
					<td><%= vo.getSapay() %></td>
				</tr>
				<%} %>
		</table>
	</body>
</html>














