<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send(f){
				let name = f.name.value;
				if( name == '' ){
					alert("이름을 입력하세요");
					return;
				}
				
				f.action = "member.do";
				f.submit();
				
			}
		</script>
		
	</head>
	
	<body>
		<form>
	
		이름 : <input name="name"><br>
		아이디 : <input name="id"><br>
		비밀번호 : <input type="password" name="pwd"> <br>
		성별 : <input type="radio" name="gender" value="남자" checked="checked">남자
		<input type="radio" name="gender" value="여자">여자 <br>
		혈액형 : 
		<select name="blood">
			<option value="A">A형</option>
			<option value="b">B형</option>
			<option value="O">O형</option>
			<option value="AB">AB형</option>
		</select> <br>
		자기소개 <br>
		<textarea name="profile" rows="5" cols="40"></textarea> <br>
		
		<hr>
		
		친구
		<input name="friend"><br>
		<input name="friend"><br>
		<input name="friend"><br>
		<input name="friend"><br>
		<!-- name 속성이 같을 경우 "&friend=dd&friend=aa&..."으로 같은 name 속성으로 파라미터를 보내기 때문에
			서블릿에서 배열의 형태로 받아야할 필요가 생김 -->
		<input type="button" value="전송" onclick="send(this.form);">
		
		</form>
	</body>
</html>