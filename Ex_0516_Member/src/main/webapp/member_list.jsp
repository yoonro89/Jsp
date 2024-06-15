<%@page import="vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
MemberDAO dao = MemberDAO.getInstance();
List<MemberVO> member_list = dao.selectList();
%>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function del(idx){
				if( !confirm("정말로 삭제 하시겠습니까?") ){
					return;
				}
				location.href="member_del.jsp?idx="+idx;
			}
			
			function modify(idx){
				location.href="modify_user.jsp?idx="+idx;
			}
			
		</script>
		
	</head>
	
	<body>
		<form>
			<table border="1">
				<caption>:::회원목록:::</caption>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이메일</th>
					<th colspan="2">주소</th>
				</tr>
				
				<% for(MemberVO vo : member_list){ %>
				<tr>
					<td><%=vo.getIdx() %></td>
					<td><%=vo.getName() %></td>
					<td><%=vo.getId() %></td>
					<td><%=vo.getPwd() %></td>
					<td><%=vo.getEmail() %></td>
					<td><%=vo.getAddr() %></td>
					<td>
						<input type="button" value="삭제" onclick="del('<%=vo.getIdx()%>');">
						<input type="button" value="수정" onclick="modify('<%=vo.getIdx()%>');">
					</td>
				</tr>
				<%} %>
			</table>
			
			<input type="button" value="추가" onclick="location.href='insert_form.jsp'">
		</form>
	</body>
</html>