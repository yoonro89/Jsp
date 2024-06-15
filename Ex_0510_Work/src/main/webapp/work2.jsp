<%@page import="vo.SawonVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.SawonDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
int dept_no = Integer.parseInt(request.getParameter("dept_no"));
SawonDAO dao = SawonDAO.getInstance();
List<SawonVO> s_list = dao.selectList(dept_no); 
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<form>
		<table border="">
			<tr>
				<th>부서번호</th>
				<th>사원번호</th>
				<th>직책</th>
				<th>이름</th>
			</tr>
			<% for( SawonVO vo : s_list ){ %>
			<tr>
				<td><%= vo.getDeptno() %></td>
				<td><%= vo.getSaname() %></td>
				<td><%= vo.getSajob() %></td>
				<td><%= vo.getSaname() %></td>
			</tr>
			<% } %>
		</table>
		</form>
	</body>
</html>