<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send(f){
				let photo = f.photo.value;
				if(photo == ''){
					alert("등록할 사진 필수");
					return;
				}
				f.submit();
			}
		</script>
		
	</head>
	
	<body>
		<form method="post"
			  enctype="multipart/form-data"
			  action="insert.do">
		
		
			<table border="1" align="center">
				<caption>:::사진등록:::</caption>
				
				<tr>
					<th>제목</th>
					<td><input name="title"></td>
				</tr>

				<tr>
					<th>비밀번호</th>
					<td><input name="pwd" type="password"></td>
				</tr>
				
				<tr>
					<th>사진</th>
					<td><input name="photo" type="file"></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="등록" onclick="send(this.form);">
						
						<input type="button" value="취소" onclick="history.go(-1);">
						
					</td>
				</tr>
				
			</table>
		</form>
	</body>
</html>