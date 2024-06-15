<%@page import="vo.DeptVO"%>
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
	
	String sqll = "select * from dept";
	PreparedStatement pstmtt = conn.prepareStatement(sqll);
	ResultSet rss = pstmtt.executeQuery();
	
	List<DeptVO> dept_list = new ArrayList<>();
	while( rss.next() ){ 
		DeptVO voo = new DeptVO();
		
		voo.setDeptno( rss.getInt("deptno") );
		voo.setDname( rss.getString("dname") );
	
		dept_list.add(voo);
	
	}
	
	rss.close();
	pstmtt.close();
	
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
			tr th{text-align:center;
					  width:50px;
					  padding: 3px;}
		</style>
		
		<script>
			function send(f){
				f.action = "work_sawon.jsp";
				f.submit();
			}
			
			function gogo( no, name ){
				let ff = document.ff;
				
				ff.sabun.value = no;
				ff.saname.value = name;
				
				ff.action = "work_gogek.jsp";
				ff.submit();
			}
		</script>
		
	</head>
	
	<body>
		<form name="ff">
			
			<select name="selsel">
			<% for( DeptVO vo : dept_list ){ %>
				<option value="<%=vo.getDeptno() %>"><%= vo.getDname() %></option>
			<%} %>
			</select>
			
			<input type="button" value="확인" onclick="send(this.form);"><br>
			
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
					<a href="javascript:gogo('<%= vo.getSabun() %>', 
					'<%= vo.getSaname() %>');">
					<%= vo.getSaname() %>
					</a>
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






















