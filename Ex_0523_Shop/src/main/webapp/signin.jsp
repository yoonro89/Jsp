<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<hr width="600" color="navy">
		
		<center>
			<font size="4" color="maroon">
				<b>My SHOPPING CENTER</b>
			</font>
		</center>

		<hr width="600" color="navy">
		
		<form>
			<table border="1" align="center">
				<caption>&lt&lt&lt《&nbsp로그인&nbsp》&gt&gt&gt</caption>
				
				<tr>
					<th>아이디</th>
					<td><input name="id"></td>
				</tr>
				
				<tr>
					<th>비밀번호</th>
					<td><input name="pwd" type="password"></td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="로그인"
								onclick="send(this.form);">
						<input type="button" value="회원가입"
								onclick="signUp(this.form)">
					</td>
				</tr>
				
			</table>
		</form>
		
		<br>
		<hr width="600" color="navy">
		<br>
		<hr width="600" color="navy">
	</body>
</html>