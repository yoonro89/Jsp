<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send(f){
				//유효성 생략
				f.method = "get";
				f.action = "list.do";
				f.submit();
			}
		</script>
		
		
	</head>
	
	<body>
		<form>
			<input name="search_txt" value="${search_txt}">
			<input type="button" value="검색" onclick="send(this.form);">
		</form>
		
		<c:if test="${ not empty list }">
			
			<table border="1" width="700">
				<caption>도서 검색 결과</caption>
				
				<tr>
					<td>이미지</td>
					<td>설명</td>
				</tr>
				
				<c:forEach var="vo" items="${ list }">
				<tr>
					<td>
						<img src="${ vo.image }">
					</td>
					
					<td>
						<b>${ vo.title }</b><br>
						저자 : ${ vo.author }<br>
						가격 : ${ vo.discount }
					</td>
				</tr>
				</c:forEach>
			</table>
		
		</c:if>
	</body>
</html>
