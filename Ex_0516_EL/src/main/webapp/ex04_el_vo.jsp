<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.PersonVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	PersonVO p1 = new PersonVO("홍길동", 30);
	request.setAttribute("p1", p1);
	
	PersonVO p2 = new PersonVO("2길동", 25);
	PersonVO p3 = new PersonVO("3길동", 35);
	List<PersonVO> arr = new ArrayList<>();
	arr.add(p2);
	arr.add(p3);
	request.setAttribute("arr", arr);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이름 : ${ p1.name } / 나이 : ${ p1.age }<br>	<!-- vo의 파라미터를 호출할 경우, 해당 파라미터의 getter가 무조건 존재해야함 -->
	${ arr[0].name } / ${ arr[0].age }<br>
</body>
</html>