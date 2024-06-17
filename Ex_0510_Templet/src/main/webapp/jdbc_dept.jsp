<%@page import="vo.DeptVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.DeptDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	DeptDAO dao = DeptDAO.getInstance();
	List<DeptVO> dept_list = dao.selectList();
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script>
			function send(num){
				
				location.href = "jdbc_sawon.jsp?deptno="+num;
				
			}
		</script>
	</head>
	
	<body>
		<table border="1">
			<caption>부서목록</caption>
			<tr>
				<th>부서번호</th>
				<th>부서이름</th>
				<th>부서위치</th>
			</tr>
			
			<% for( DeptVO vo : dept_list ){ %>
			<tr>
				<td><%= vo.getDeptno() %></td>
				
				<td><a href="javascript:send(<%= vo.getDeptno() %>);">
				<%= vo.getDname() %></a>
				<td><%= vo.getLoc() %></td>
			</tr>
			<%} %>
		</table>
	</body>
</html>