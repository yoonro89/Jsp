<%@page import="java.util.ArrayList"%>
<%@page import="vo.PersonVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//DB에서 유저 정보를 가져왔다고 가정하여, ArrayList에 저장
	List<PersonVO> pList = new ArrayList<>();
	
	PersonVO p1 = new PersonVO();
	p1.setName("홍길동");
	p1.setAge(20);
	p1.setTel("01011111111");
	
	PersonVO p2 = new PersonVO();
	p2.setName("박길순");
	p2.setAge(22);
	p2.setTel("01122222222");
	
	pList.add(p1);
	pList.add(p2);
	
%>    
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<table border="1">
			<caption>:::개인정보 목록:::</caption>
			<tr>
				<th>이름</th>
				<th>나이</th>
				<th>전화번호</th>
			</tr>
			
			<% 
			for(int i = 0; i < pList.size(); i++ ){
				PersonVO p = pList.get(i); 
			%>
			<tr>
				<td><%= p.getName() %></td>
				<td><%= p.getAge() %></td>
				<td><%= p.getTel() %></td>
			</tr>
			<% } %>
		</table>
	</body>
</html>