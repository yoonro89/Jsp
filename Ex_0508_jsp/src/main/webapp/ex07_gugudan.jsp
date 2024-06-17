<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<style>
			table{border:2px solid black;
					border-collapse:collapse;}
			td{ width:100px;
				text-align:center;}
		</style>
		
	</head>
	
	<body>
		<table border="1">
		<caption>구구단</caption>
		
		<% 
		for(int i = 1; i < 10; i++){ 
		%>
		<tr>
			<% for( int j = 2; j < 10; j++){ %>
			<td>
			<!-- < %= j + "X" + i + "=" + i*j %> -->
			<% String str = String.format("%d X %d = %d", j, i, i*j); %>
			<%= str %>
			</td>
			<%} %>
		</tr>
		<%} %>
		</table>
	</body>
</html>