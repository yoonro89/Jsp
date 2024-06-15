<%@page import="vo.SawonVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.SawonDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
SawonDAO dao = SawonDAO.getInstance();
List<SawonVO> s_list = dao.selectList(5);
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<table border="1">
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>성별</th>
			</tr>
			
			<% for(SawonVO vo : s_list){ %>
			<tr>
				<td><%= vo.getSabun() %></td>
				<td><%= vo.getSaname() %></td>
				<td><%= vo.getSagen() %></td>
			</tr>
			<%} %>
		</table>
	</body>
</html>