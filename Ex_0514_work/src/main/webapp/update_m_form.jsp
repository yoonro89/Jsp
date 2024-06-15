<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
int idx = Integer.parseInt(request.getParameter("idx"));
String name = request.getParameter("name");
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String email = request.getParameter("email");
String addr = request.getParameter("addr");
%>
 
    
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
				
				f.action = "m_update.jsp";
				f.submit();
			}
		</script>
		
	</head>
	
	<body>
		<form>
			<input type="hidden" name="idx" value="<%=idx%>">
			<table border="1">
				<caption>:::정보수정:::</caption>
				<tr>
					<th>이름</th>
					<td><input name="name" value="<%=name%>"></td>
				</tr>
				
				<tr>
					<th>아이디</th>
					<td><input name="id" value="<%=id%>"></td>
				</tr>
				
				<tr>
					<th>비밀번호</th>
					<td><input name="pwd" value="<%=pwd%>"></td>
				</tr>
				
				<tr>
					<th>이메일</th>
					<td><input name="email" value="<%=email%>"></td>
				</tr>
				
				<tr>
					<th>주소</th>
					<td><input name="addr" value="<%=addr%>"></td>
				</tr>
				
				<tr>
				<td colspan="2">
					<input type="button" value="수정완료" onclick="send(this.form);">
					<input type="button" value="취소" onclick="history.go(-1);">
					<!-- location.href='sutdent.jsp'을 사용하지 않고 ↑를 사용(이전페이지) -->
				</td>
			</tr>
			</table>
		</form>
	</body>
</html>