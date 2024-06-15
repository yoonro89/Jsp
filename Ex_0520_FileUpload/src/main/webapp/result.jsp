<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- jsp에서는 외부 경로로 접근할 수 없다. -->
	<!-- 절대경로와 상대경로 
		 절대경로 : 클라이언트가 이미지 업로드 하기 위한 곳
		 상대경로 : 개발자가 사용할 이미지를 업로드한 곳 -->
	제목 : ${ title }<br>
	<img src="upload/${ filename }" width="200">
</body>
</html>