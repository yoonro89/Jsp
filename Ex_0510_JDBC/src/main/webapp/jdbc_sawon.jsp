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
	InitialContext ic = new InitialContext();
	
	Context ctx = (Context)ic.lookup("java:comp/env");
	
	DataSource dataSource = (DataSource)ctx.lookup("jdbc/oracle_test");
	
	Connection conn = dataSource.getConnection();
	
	String sql = "select * from sawon";
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
					border:2px solid black;}
			tr th, td{ padding: 5px;}
		</style>
		
		<script>
			function send(f){
				//f.action = "res_sawon.jsp";
				//f.submit();
				location.href="res_sawon.jsp?dept_sel="+f.dept_sel.value;
			}
			
			function send2( no, name ){
				let ff = document.ff;
				
				ff.sabun.value = no;
				ff.saname.value = name;
				
				ff.action = "res_gogek.jsp";
				ff.submit();
			}
		</script>
		
	</head>
	
	<body>
	
		<form name="ff">
		
		<select name="dept_sel">
			<option value="10">총무부</option>
			<option value="20">영업부</option>
			<option value="30">전산실</option>
			<option value="40">관리부</option>
			<option value="50">경리부</option>
		</select>
		<input type="button" value="확인" onclick="send(this.form);">
		
		<table border="1">
				<tr>
					<th>사번</th>
					<th>이름</th>
					<th>직책</th>
					<th>급여</th>
				</tr>
				<% for( SawonVO vo : sawon_list ){ %>
				<tr>
					<td><%= vo.getSabun() %></td>
					
					<td>
						<a href="javascript:send2('<%=vo.getSabun() %>', 
						'<%=vo.getSaname()%>');">
						<%= vo.getSaname() %></a>
					</td>
					
					<td><%= vo.getSajob() %></td>
					<td><%= vo.getSapay() %></td>
				</tr>
				<%} %>
		</table>
		<input type="hidden" name="sabun">
		<input type="hidden" name="saname">
		</form>
	</body>
</html>














