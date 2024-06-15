<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//Cookie : 인터넷 사용자가 웹사이트를 방문할 경우 그 사이트가 사용중인 서버에서 클라이언트에게 설치하는 기록정보 파일.
	//이는 사용자가 같은 웹사이트를 방문 할때마다 읽히고, 수시로 갱신된다.
	Cookie cookie = new Cookie("A", "Test_A.jsp");
	response.addCookie(cookie);
%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		A.jsp입니다<br>
		<a href="Test_B.jsp">B로 이동</a>
	</body>
</html>