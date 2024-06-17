<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send(f){
				f.action = "work2.jsp";
				f.method = 'POST';
				
				let age = f.age.vlaue;
				let pat = /^[0-9]*$/;
				if( !pat.test(age) ){
					alert("정수만 입력해");
					f.age.focus();
					return;
				}
				
				f.submit();
			}
		</script>
		
	</head>
	
	<body>
		<form>
			ID:<input name="id" placeholder="아이디를 입력하세요"><br>
			PWD:<input name="pw" placeholder="비밀번호를 입력하세요"><br>
			AGE:<input name="age" placeholder="나이를 입력하세요"><br>
			<input type="button" value="가입하기" onclick="send(this.form);">
		</form>
	</body>
</html>