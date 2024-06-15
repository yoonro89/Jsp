<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send1(f){
				//유효성체크 했다치고
				
				f.action = "test_param1.jsp";
				f.method = 'POST';
				f.submit();
			}
			
			function send2(f){
				f.action = "test_param2.jsp";
				f.method = 'POST';
				f.submit();
			}
		</script>
		
	</head>
	
	<body>
		<form>
			이름<input name="name"><br>
			나이<input name="age"><br>
			전화<input name="tel"><br>
			
			<input type="button" value="낱개로 전송" onclick="send1(this.form);">
			<input type="button" value="객체로 전송" onclick="send2(this.form);">
			
		</form>
	</body>
</html>