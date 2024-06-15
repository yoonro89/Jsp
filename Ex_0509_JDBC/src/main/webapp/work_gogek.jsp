<%@page import="java.util.ArrayList"%>
<%@page import="vo.GogekVO"%>
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
	String sabun = request.getParameter("sabun");
	String saname = request.getParameter("saname");

	InitialContext ic = new InitialContext();
	Context ctx = (Context)ic.lookup("java:comp/env");
	DataSource dataSource = (DataSource)ctx.lookup("jdbc/oracle_test");
	Connection conn = dataSource.getConnection();
	
	String sql = "select * from gogek where godam="+sabun; 
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	List<GogekVO> gogek_list = new ArrayList<>();
	while( rs.next() ){
		GogekVO vo = new GogekVO();
		
		
		vo.setGobun( rs.getInt("gobun") );
		vo.setGoname( rs.getString("goname") );
		vo.setGoaddr( rs.getString("goaddr") );
		
		gogek_list.add(vo);
		
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
			tr th, td{text-align:center;
					  width:100px;
					  padding: 10px;}
			tr .num{width:70px;}
			tr .ju{width:200px;}
		</style>
		
	</head>
	
	<body>
		<table border="1">
			<caption><%= saname %>의 고객정보</caption>
			<tr>
				<th class="num">번호</th>
				<th>이름</th>
				<th>주소</th>
			</tr>
			
			<% for(GogekVO vo : gogek_list ){ %>
			<tr>
				<td class="num"><%= vo.getGobun() %></td>
				<td><%= vo.getGoname() %></td>
				<td><%= vo.getGoaddr() %></td>
			</tr>
			<%} %>
			
		</table>
	</body>
</html>