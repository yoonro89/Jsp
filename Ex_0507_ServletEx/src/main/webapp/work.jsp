<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send(f){
				f.action = "work.do";
				f.submit();
			}
		</script>
		
	</head>
	
	<body>
		<form action="work.do">
			<input name="name" placeholder="이름을 입력해주세요"><br>
			<input name="id" placeholder="아이디를 입력해주세요"><br>
			<input name="pw" placeholder="비밀번호를 입력해주세요"><br>
			<br>
			<div>성별 :
			<input type="radio" name="gender" value="남자" checked="checked">
			남자
			<input type="radio" name="gender" value="여자">
			여자
			</div><br>
			
			<div>혈액형:<br>
			<input type="checkbox" name="blood_type" value="A">A 
			<input type="checkbox" name="blood_type" value="AB">AB 
			<input type="checkbox" name="blood_type" value="B">B 
			<input type="checkbox" name="blood_type" value="O">O 
			</div><br>
			
			<input type="text" name="pr" placeholder="프로필 입력란"><br>
			<br>
			<input type="button" value="전송" onclick="send(this.form);">
		</form>
	</body>
</html>