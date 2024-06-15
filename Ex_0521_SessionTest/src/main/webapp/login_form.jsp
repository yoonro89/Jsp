<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script src="js/httpRequest.js"></script>
		
		<script>
			function send(f){
				//encodeURIComponent() :
				//특수문자가 포함된 파라미터를 전달하기 위한 메서드
				let url = "login.do";
				let param = "id=" + f.id.value +
							"&pwd=" + encodeURIComponent(f.pwd.value);
				
				sendRequest(url, param, resultFn, "post");
				
			}
			
			function resultFn(){
				if(xhr.readyState == 4 && xhr.status == 200){
					//[{'param':'no_id'}]
					let data = xhr.responseText;
					
					let json = (new Function('return '+data))(); 
					
					if(json[0].param == 'no_id'){
						alert("아이디가 존재하지 않습니다");
					}else if(json[0].param == 'no_pwd'){
						alert("비밀번호 불일치!!")
					}else{
						location.href="main_content.jsp";
					}
				}
			}
		</script>
		
	</head>
	
	<body>
		<form>
			<table border="1" align="center">
				<caption>:::로그인:::</caption>
				
				<tr>
					<th>아이디</th>
					<td><input name="id"></td>
				</tr>
				
				<tr>
					<th>비밀번호</th>
					<td><input name="pwd" type="password"></td>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="button" value="로그인"
								onclick="send(this.form);">
					</td>
				</tr>
				
			</table>
		</form>
	</body>
</html>