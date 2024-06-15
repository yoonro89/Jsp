<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
	//스크립트 릿의 선언부 : 선언부에서 생성한 변수나 메서드는 전역의 개념을 갖는다
	int n = 0;
	
	Random rnd = new Random();
	
	public int plus(int a, int b){
		return a + b;
	}
%>

<%
	//스크립트 릿에서 생성한 변수나 메서드는 지역의 개념
	int random = rnd.nextInt(10) + 1;
	int n2 = 0;
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<% String name = "홍길동"; %>
		<h1><%= name %></h1>
		<p><%= "n++ : " + n++ %></p>	<!-- 전역의 경우 브라우저를 새로고침할 경우 갱신됨 -->
		<p><%= "n2++ : " + n2++ %></p>	<!-- 지역의 경우 브라우저를 새로고침해도 반응 없음 -->
		<p><%= plus(random, random) %></p>
		
	</body>
</html>