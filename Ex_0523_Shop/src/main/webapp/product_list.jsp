<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<style>
			.regi{width:600px;
				  text-align:right;
				  margin:5px auto;}
		</style>
		
	</head>
	
	<body>
		<jsp:include page="index.jsp"/>
		
		<div class="regi">
			<input id="reg" type="button" value="상품 등록하기" 
				   onclick="location.href='product_reg_form.jsp'">
		</div>
		
		<table width="600" align="center" border="1">
			<tr>
				<th>모델명</th>
				<th width="20%">이미지</th>
				<th width="30%">제품명</th>
				<th width="20%">가격</th>
				<th width="20%">비고</th>
			</tr>
			
			
			<c:forEach var="vo" items="${ list }">
			<tr align="center">
				<td>${ vo.p_num }</td>
				<td>
					<img src="images/${ vo.p_image_s }" width="100" height="90">
				</td>
				
				<td>
					<a href="view.do?idx=${ vo.idx }">${ vo.p_name }</a>
				</td>
				
				<td>
					할인가:<fmt:formatNumber value="${ vo.p_saleprice }"/>원<br>
					<font color="red">(${ vo.sale_rate }% 할인)</font>
				</td>
				
				<td>
					원가:<fmt:formatNumber value="${ vo.p_price }"/>원
				</td>
			</tr>
			</c:forEach>
			
		</table>
	</body>
</html>