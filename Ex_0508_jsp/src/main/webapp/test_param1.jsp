<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//post로 넘어온 정보는 한글이 모두 깨진다. 이를 방지하는 인코딩 필요
	request.setCharacterEncoding("utf-8");
	
	//test_param1.jsp?name=홍길동&age=20&tel=0101111
	String name = request.getParameter("name");
	int age = Integer.parseInt( request.getParameter("age") );	
	String tel = request.getParameter("tel");

%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<%= name %><br>
		<%= age %><br>
		<%= tel %>
	</body>
</html>