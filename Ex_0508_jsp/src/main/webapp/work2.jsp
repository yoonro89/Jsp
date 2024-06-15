<%@page import="vo.WorkInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%!
	List<WorkInfo> uList = new ArrayList<>();
%>
    
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	int age = Integer.parseInt( request.getParameter("age") );
	
	WorkInfo u = new WorkInfo();
	u.setId(id);
	u.setPw(pw);
	u.setAge(age);
	
	uList.add(u);

%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<style>
		table{	border-collapse: collapse;
				text-align: center;}
		tr th, td{padding: 5px 20px;}
		</style>
		
	</head>
	
	<body>
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>비 번</th>
				<th>나 이</th>
			</tr>
			<% 
			for( int i = 0; i < uList.size(); i++ ){
				WorkInfo w = uList.get(i);
			%>
			<tr>
				<td><%= w.getId() %></td>
				<td><%= w.getPw() %></td>
				<td><%= w.getAge() %></td>
			</tr>
			<%} %>
		</table>
		<button onclick="location='work.jsp'">확인</button>
	</body>
</html>