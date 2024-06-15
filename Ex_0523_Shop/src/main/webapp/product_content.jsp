<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script src="js/httpRequest.js"></script>
		
		<script>
			function addCart(idx, m_idx){
				console.log(idx + "/" + m_idx);
				let url = "cart_insert.do?idx="+idx+"&m_idx="+m_idx;
				sendRequest(url, null, resultFn, "GET");
			}
			
			function resultFn(){
				
				if(xhr.readyState==4 && xhr.status==200){
					
					//[{'result':'yes'}]
					let data = xhr.responseText;
					
					let json = (new Function('return '+data))();
					
					if(json[0].result == 'yes'){
						alert("장바구니에 담았습니다.");
						if(!confirm("장바구니로 이동하시겠습니까?")){
							return;
						}
						location.href="cart_list.do";
					}else{
						alert("이미 장바구니에 담긴 상품입니다");
					}
					
				}
				
			}
		</script>
	</head>
	
	<body>
		<jsp:include page="index.jsp"/>
		
		<table align="center" width="600" border="1">
			<tr>
				<td width="40%">카테고리</td>
				<td>${ vo.category }</td>
			</tr>
			
			<tr>
				<td width="40%">상품번호</td>
				<td>${ vo.p_num }</td>
			</tr>
			
			<tr>
				<td width="40%">상품이름</td>
				<td>${ vo.p_name }</td>
			</tr>
			
			<tr>
				<td width="40%">제조사</td>
				<td>${ vo.p_company }</td>
			</tr>
			
			<tr>
				<td width="40%">가격</td>
				<td>
				원가:<fmt:formatNumber value="${ vo.p_price }"/><br>
				할인가:<fmt:formatNumber value="${ vo.p_saleprice }"/>
				</td>
			</tr>
			
			<tr>
				<td width="40%" colspan="2">상세설명</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<img width="500" src="images/${ vo.p_image_l }">
				</td>
			</tr>
			
			<tr>
				<td colspan="2">${ vo.p_content }</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="장바구니에 담기" onclick="addCart('${vo.idx}', '${1}');">
					<input type="button" value="장바구니 보기" onclick="location.href='cart_list.do'">
				</td>
			</tr>
		</table>
		
	</body>
</html>