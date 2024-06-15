<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	MemberDAO dao = MemberDAO.getInstance();
	MemberVO vo = dao.selectOne(idx);
%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function send(f){
				//유효성체크 생략
				f.action = "update_result.jsp";
				f.method = "post";
				f.submit();
			}
		</script>
		
	</head>
	
	<body>
		<form>
			<table border="1">
				<caption>:::회원 정보 수정:::</caption>
				
				<tr>
					<th>이름</th>
					<td><input name="name" value="<%=vo.getName()%>"></td>
				</tr>
				
				<tr>
					<th>아이디</th>
					<td><input name="id" value="<%=vo.getId()%>"></td>
				</tr>
				
				<tr>
					<th>비밀번호</th>
					<td><input name="pwd" 
						type="password"
						value="<%=vo.getPwd()%>"></td>
				</tr>
				
				<tr>
					<th>이메일</th>
					<td><input name="email" value="<%=vo.getEmail()%>"></td>
				</tr>
				
				<tr>
					<th>주소</th>
					<td><input name="addr" value="<%=vo.getAddr()%>"></td>
				</tr>
				
			</table>
			
			<input type="button" value="확인" onclick="send(this.form);">
			<input type="button" value="취소" onclick="history.go(-1);">
			<input type="hidden" name="idx" value="<%=idx%>">
		</form>
	</body>
</html>