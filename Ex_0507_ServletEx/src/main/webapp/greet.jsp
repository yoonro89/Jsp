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
				let num_pattern = /^[0-9]*$/;
				if( !num_pattern.test(age) ){
					alert("나이는 정수로 입력하시오");
					return;
				}
				
				f.method = "get";
				f.submit();
			}
		</script>
		
	</head>
	
	<body>
		<!-- 서버로 데이터를 전송하고자 한다면 form태그를 사용한다 -->
		<form action="greet.do">
			알고싶은 외국의 인사말은?<br>
			<input type="radio" name="nation" value="kor">한국어<br>
			<input type="radio" name="nation" value="eng">영어<br>
			<input type="radio" name="nation" value="jpn">일본어<br>
			<input type="radio" name="nation" value="chn">중국어<br>
			
			<br>
			나이 : <input name="age"><br>
			
			<input type="button" value="확인" onclick="send(this.form);">
		</form>
	</body>
</html>