<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//시간설정이 되어있지 않은 쿠키는 세션쿠키(브라우저가 종료되면 함께 소멸)
	Cookie cookie = new Cookie("B", "Test_B.jsp");
	
	cookie.setMaxAge(60*2);//해당 쿠키를 2분간 영구적으로 보관. (setMaxAge의 값은 초단위다)
	response.addCookie(cookie);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	B.jsp입니다<br>
	<a href="Test_C.jsp">C로 이동</a>
</body>
</html>