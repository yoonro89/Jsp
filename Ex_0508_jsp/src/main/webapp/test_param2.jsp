<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
%>
<!-- JSP Action tag : 각종 속성들을 이용한 객체생성 방법 -->

<!-- PsesonVO p = new PersonVO(); -->
<jsp:useBean id="p" class="vo.PersonVO"></jsp:useBean>

<!-- p.setName(홍길동); -->
<jsp:setProperty property="name" name="p"/>
<jsp:setProperty property="age" name="p"/>
<jsp:setProperty property="tel" name="p"/>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<%= p.getName() %><br>
		<%= p.getAge() %><br>
		<%= p.getTel() %>
	</body>
</html>