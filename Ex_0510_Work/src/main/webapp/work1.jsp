<%@page import="vo.DeptVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.DeptDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
DeptDAO dao = DeptDAO.getInstance();
List<DeptVO> d_list = dao.selectList();
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send(num){
				let wtf = document.wtf;;
				wtf.dept_no.value = num;
				
				wtf.action = "work2.jsp";
				wtf.submit();
			}
		</script>
		
	</head>
	
	<body>
		<form name="wtf">
		<table border="1">
			<tr>
				<th>부서번호</th>
				<th>부서명</th>
				<th>부서위치</th>
			</tr>
			<% for( DeptVO vo : d_list ){ %>
			<tr>
				<td><%= vo.getDeptno() %></td>
				
				<td>
				<a href="javascript:send('<%= vo.getDeptno() %>');">
				<%= vo.getDname() %></a>
				</td>
				
				<td><%= vo.getLoc() %></td>
			</tr>
			<% } %>
		</table>
		<input type="hidden" name=dept_no>
		</form>
	</body>
</html>