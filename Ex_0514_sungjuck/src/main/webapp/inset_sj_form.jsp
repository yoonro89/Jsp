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
			let kor = f.kor.value;
			let eng = f.eng.value;
			let mat = f.mat.value;
			
			//유효성 체크
			if( name.trim() == '' ){
				alert("이름을 입력하세요");
				return;
			}
			
			let number = /^[0-9]*$/;
			if( !number.test(kor) || kor < 0 || kor > 100 || kor == '' ){
				alert("성적은 0 ~ 100점 사이로 입력하세요")
				return;
			}
			if( !number.test(eng) || eng < 0 || eng > 100 || eng == '' ){
				alert("성적은 0 ~ 100점 사이로 입력하세요")
				return;
			}
			if( !number.test(mat) || mat < 0 || mat > 100 || mat == '' ){
				alert("성적은 0 ~ 100점 사이로 입력하세요")
				return;
			}
			
			f.action = "sung_register.jsp";
			f.submit();
			
		}//send();
		
		</script>
		
	</head>
	
	<body>
		<form>
			<table border="1">
				<caption>:::성적추가:::</caption>
				<tr>
					<th>이름</th>
					<td><input name="name"></td>
				</tr>
				
				<tr>
					<th>국어</th>
					<td><input name="kor"></td>
				</tr>
				
				<tr>
					<th>영어</th>
					<td><input name="eng"></td>
				</tr>
				
				<tr>
					<th>수학</th>
					<td><input name="mat"></td>
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