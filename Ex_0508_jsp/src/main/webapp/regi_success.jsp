<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
	List<UserVO> arr = new ArrayList<>();
%>

<%
	request.setCharacterEncoding("utf-8");

	//regi_success.jsp?id=aaa&pwd=1234&age=20
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	int age = Integer.parseInt( request.getParameter("age") );
	
	UserVO vo = new UserVO(id, pwd, age);
	arr.add(vo);

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
				<th>아이디</th>
				<th>비밀번호</th>
				<th>나	이</th>
			</tr>
			
			<% for( int i = 0; i < arr.size(); i++){ %>
			<tr>
				<td><%= arr.get(i).getId() %></td>
				<td><%= arr.get(i).getPwd() %></td>
				<td><%= arr.get(i).getAge() %></td>
			</tr>
			<%} %>
		</table>
		
		<input type="button" value="확인" onclick="location.href='ex06_test_join.jsp'">
		
	</body>
</html>