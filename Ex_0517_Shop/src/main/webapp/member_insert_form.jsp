<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script src="js/httpRequest.js"></script>
		
		<script>
			
			let b_idCheck = false;
			
			function send(f){
				//유효성 생략
				
				//중복체크가 완료되었을 때만 insert허용
				if( !b_idCheck ){
					alert("아이디 중복체크를 먼저 하세요");
					return;
				}
				
				f.action = "insert.do";//서블릿을 호출
				f.method = "post";
				f.submit();
			}
			
			function check_id(){
				let id = document.getElementById("id").value;
				if( id == '' ){
					alert("아이디를 입력하세요");
					return;
				}
				
				let url = "check_id.do";
				let param = "id="+id;
				sendRequest(url, param, resultFn, "post");
				
			}
			
			function resultFn(){
				if( xhr.readyState == 4 && xhr.status == 200 ){
					
					let data = xhr.responseText;
					//alert(data);
					let json = (new Function('return '+data))();
					
					if( json[0].result == 'no' ){
						alert(json[0].id + "은 이미 사용중입니다.");
						return;
					}
					
					alert(json[0].id + "은 사용 가능합니다");
					b_idCheck = true;
					
				}
			}
			
			function che(){
				//입력상자의 값이 변할 때마다 호출되는 메서드
				b_idCheck = false;
			}
		</script>
		
	</head>
	
	<body>
		<form>
			<table border="1" align="center">
				<caption>:::회원가입:::</caption>
				
				<tr>
					<th>아이디</th>
					<td>
						<input name="id" id="id" onchange="che();">
						<input type="button" value="중복체크" onclick="check_id();">
					</td>
				</tr>
				
				<tr>
					<th>비밀번호</th>
					<td>
						<input name="pwd" type="password">
					</td>
				</tr>
				
				<tr>
					<th>이름</th>
					<td>
						<input name="name">
					</td>
				</tr>
				
				<tr>
					<th>이메일</th>
					<td>
						<input name="email">
					</td>
				</tr>
				
				<tr>
					<th>주소</th>
					<td>
						<input name="addr">
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="가입" onclick="send(this.form);">
						<input type="button" value="취소" onclick="history.go(-1);">
					</td>
				</tr>
				
			</table>
		</form>
	</body>
</html>