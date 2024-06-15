<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Cookie cookie = new Cookie("C", "Test_C.jsp");
	response.addCookie(cookie);
%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	C.jsp입니다<br>
	<a href="Test_A.jsp">A로 이동</a>
</body>
</html>