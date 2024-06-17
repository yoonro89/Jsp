<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send(f){
				
				let age = f.age.value;
				let pat = /^[0-9]*$/;
				if( !pat.test(age) ){
					alert("나이는 정수로 입력하세요");
					f.age.focus();
					return;
				}
				
				
				f.submit();
				
			}
		</script>
		
	</head>
	
	<body>
		<form action="regi_success.jsp" method="post">
			ID <input name="id" placeholder="input your id"><br>
			PWD<input name="pwd" type="password"><br>
			AGE<input name="age"><br>
			
			<input type="button" value="가입하기" onclick="send(this.form);">
		</form>
	</body>
</html>