<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send(f){
				//유효성 체크 생략
				
				f.submit();
			}
		</script>
		
	</head>
	
	<body>
		<jsp:include page="index.jsp"/>
		
		<form method="post" enctype="multipart/form-data" action="insert.do">
			
			<table align="center" width="600" border="1">
				<tr>
					<td width=30%>제품 카테고리</td>
					<td>
						<select name="category">
							<option value="">카테고리 선택</option>
							<option value="com001">컴퓨터</option>
							<option value="ele002">생활가전</option>
							<option value="sp003">스포츠</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<td>모델명</td>
					<td><input name="p_num"></td>
				</tr>
				<tr>
					<td>제품명</td>
					<td><input name="p_name"></td>
				</tr>
				<tr>
					<td>제조사</td>
					<td><input name="p_company"></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input name="p_price"></td>
				</tr>
				<tr>
					<td>할인가</td>
					<td><input name="p_saleprice"></td>
				</tr>
				<tr>
					<td>상세설명</td>
					<td>
						<textarea name="p_content" rows="5" cols="60" 
						style="resize:none"></textarea>
					</td>
				</tr>
				<tr>
					<td>작은사진</td>
					<td><input type="file" name="p_image_s"></td>
				</tr>
				<tr>
					<td>큰사진</td>
					<td><input type="file" name="p_image_l"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="등록" onclick="send(this.form);">
					</td>
				</tr>
			</table>
			
		</form>
		
	</body>
</html>