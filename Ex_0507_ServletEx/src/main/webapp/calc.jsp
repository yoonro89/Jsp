<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send(f){

				let num1 = f.num1.value;
				let num2 = f.num2.value;
				
				let num_p = /^[0-9]*$/
				if( !num_p.test(num1) || !num_p.test(num2) ){
					alert("숫자는 정수만!!");
					return;
				}
				
				f.action = 'calc.do';
				f.submit();
			}
		</script>
		
	</head>
	
	<body>
		<form action="calc.do">
			수1 : <input name="num1"><br>
			수2 : <input name="num2"><br>
			<input type="button" value="확인" onclick="send(this.form);">
		</form>
	</body>
</html>