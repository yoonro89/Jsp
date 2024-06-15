<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function modify(f){
				
				//cart_update.do?c_idx=1&c_cnt=5
				f.action = "cart_update.do";
				f.submit();
			}
			
			function del(c_idx){
				location.href="cart_delete.do?c_idx="+c_idx;
			}
		</script>
		
	</head>
	
	<body>
		<jsp:include page="index.jsp"/>
		
		<table align="center" width="600" border="1">
			<caption>장바구니</caption>
			
			<tr>
				<th width="15%">제품번호</th>
				<th width="25%">제품명</th>
				<th>단가</th>
				<th>수량</th>
				<th>금액</th>
				<th width="10%">삭제</th>
			</tr>
			
			<c:forEach var="vo" items="${ list }">
			<tr align="center">
				<td>${ vo.p_num }</td>
				<td>${ vo.p_name }</td>
				
				<td>${ vo.p_saleprice }</td>
				
				<td>
					<form>
						<input type="hidden" name="c_idx" value="${ vo.c_idx }">
						<input name="c_cnt" size="3" align="center" value="${ vo.c_cnt }">
						<input type="button" value="수정" onclick="modify(this.form);">
					</form>
				</td>
				
				<td>${ vo.c_cnt * vo.p_saleprice }</td>
				
				<td>
					<input type="button" value="삭제" onclick="del('${vo.c_idx}');">
				</td>
			</tr>
			</c:forEach>
			
			<c:if test="${ empty list }">
			<tr>
				<td colspan="6" align="center">
					<b>장바구니가 비었습니다</b>
				</td>
			</tr>
			</c:if>
			
			<tr>
				<td colspan="4" align="right">
					총 결제금액
				</td>
				<td colspan="2" align="center">${ total_amount }</td>
			</tr>
			
			
		</table>
		
	</body>
</html>