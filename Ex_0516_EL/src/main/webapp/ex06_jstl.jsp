<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>forEach로 구구단 생성</title>
	</head>
	
	<body>
		<table border="1">
			<c:forEach var="i" begin="1" end="9">
			<!-- step 속성을 생략할 경우 1로 진행됨 -->
				<tr>
					<c:forEach var="j" begin="2" end="9">
						<td>${j}X${i}=${i*j}</td>
					</c:forEach>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>