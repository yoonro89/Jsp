<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send_get(f){
				f.method = "Get";
				f.submit();
			}
			
			function send_post(f){
				f.method = "Post";
				f.submit();
			}
		</script>
		
	</head>
	
	<body>
		<form action="lc.do">
			<input name="name"><br>
			<input type="button" value="Get으로 요청" onclick="send_get(this.form);">
			<input type="button" value="Post로 요청" onclick="send_post(this.form);">
		</form>
	</body>
</html>