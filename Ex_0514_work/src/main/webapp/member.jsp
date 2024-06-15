<%@page import="vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
MemberDAO dao = MemberDAO.getInstance();
List<MemberVO> m_list = dao.selectList();
%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
		
			function add(){
				location.href="insert_m_form.jsp";
			}
			
			function del(idx){
				if( !confirm("회원 정보를 삭제합니다.") ){
					return;
				}
				location.href="m_del.jsp?idx="+idx;
			}
			
			function update(idx, name, id, pwd, email, addr){
				let ff = document.ff;
				
				ff.idx.value = idx;
				ff.name.value = name;
				ff.id.value = id;
				ff.pwd.value = pwd;
				ff.email.value = email;
				ff.addr.value = addr;
				
				ff.action = "update_m_form.jsp";
				ff.submit();
			}
		</script>
		
	</head>
	
	<body>
		<form name="ff">
		<input type="hidden" name="idx">
		<input type="hidden" name="name">
		<input type="hidden" name="id">
		<input type="hidden" name="pwd">
		<input type="hidden" name="email">
		<input type="hidden" name="addr">
		
		<table border="1">
			<caption>::회원목록::</caption>
			<tr>
				<th>회원번호</th>
				<th>이름</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이메일</th>
				<th colspan="3">주소</th>
				
			</tr>
			
			<% for(MemberVO vo : m_list){ %>
			<tr>
				<td><%= vo.getIdx() %></td>
				<td><%= vo.getName() %></td>
				<td><%= vo.getId() %></td>
				<td><%= vo.getPwd() %></td>
				<td><%= vo.getEmail() %></td>
				<td><%= vo.getAddr() %></td>
				
				<td><input type="button" value="삭제" 
				onclick="del('<%= vo.getIdx() %>');"></td>
				
				<td><input type="button" value="수정" 
				onclick="update('<%= vo.getIdx() %>', 
				'<%= vo.getName() %>', 
				'<%= vo.getId() %>', 
				'<%= vo.getPwd() %>',
				'<%= vo.getEmail() %>',
				'<%= vo.getAddr() %>');"></td>
			</tr>
			<% } %>
		</table>
		
		<input type="button" value="추가" onclick="add();">
		</form>
	</body>
</html>