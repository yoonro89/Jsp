<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.demo-01 {
	font-size: 150%;
	transition-property: font-size;
	transition-duration: 2s;
}

.demo-01:hover {
	font-size: 200%;
}

.demo-02 {
	font-size: 120%;
	color: blue;
	transition-duration: 2s;
}

.demo-02:hover {
	font-size: 200%;
	color: red;
}
</style>
</head>
<body>
	<h1 class="demo-01">transition-property</h1>
	<br>
	<h1 class="demo-02">transition-duration</h1>
</body>
</html>