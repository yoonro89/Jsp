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
			let id = f.id.value;
			let pwd = f.pwd.value;
			let email = f.email.value;
			let addr = f.addr.value;
			
			if(name.trim() == ''){
				alert("이름을 입력하세요");
				f.name.focus();
				return;
			}
			if(id.trim() == ''){
				alert("아이디를 입력하세요");
				f.id.focus();
				return;
			}
			if(pwd.trim() == ''){
				alert("비밀번호를 입력하세요");
				f.pwd.focus();
				return;
			}
			
			f.action = "m_register.jsp";
			f.submit();
		}
		</script>
		
	</head>
	
	<body>
		<form>
			<table border="1">
				<caption>:::회원추가:::</caption>
				<tr>
					<th>이름</th>
					<td><input name="name"></td>
				</tr>
				
				<tr>
					<th>아이디</th>
					<td><input name="id"></td>
				</tr>
				
				<tr>
					<th>비밀번호</th>
					<td><input name="pwd"></td>
				</tr>
				
				<tr>
					<th>이메일</th>
					<td><input name="email"></td>
				</tr>
				
				<tr>
					<th>주소</th>
					<td><input name="addr"></td>
				</tr>
				
				<tr>
				<td colspan="2">
					<input type="button" value="등록" onclick="send(this.form);">
					<input type="button" value="취소" onclick="history.go(-1);">
					<!-- location.href='sutdent.jsp'을 사용하지 않고 ↑를 사용(이전페이지) -->
				</td>
			</tr>
			</table>
		</form>
	</body>
</html>