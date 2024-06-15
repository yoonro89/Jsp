<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Map<String, String> map = new HashMap<>();
	map.put("name", "hong gil dong");
	map.put("age", "20");
	map.put("tel", "010");
	map.put("pwd", "1234");
	
	//EL표기법으로 값을 가져오기 위해 request영역에 map을 저장함
	request.setAttribute("map1", map);
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이름 : ${ requestScope.map1.get("name") }<br>
	나이 : ${ map1.get('age') }<br>
	전화 : ${ map1['tel'] }<br>
	비번 : ${ map1.pwd }<br>	<!-- ← 가장 많이 사용하는 형태 -->
</body>
</html>