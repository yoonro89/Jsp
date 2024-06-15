<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String[] fruit = {"사과", "배", "참외", "토마토"};
	//●사과
	//●배
	//●참외
	//●토마토
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<ul>
			<% for(int i = 0; i < fruit.length; i++ ){ %>
			
				<li><%= fruit[i] %></li>
				
			<% } %>
		</ul>
	</body>
</html>