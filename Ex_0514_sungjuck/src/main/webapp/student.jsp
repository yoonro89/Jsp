<%@page import="vo.SjVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.SjDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
SjDAO dao = SjDAO.getInstance();
List<SjVO> sj_list = dao.selectList();
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
		 function add(){
			 location.href="inset_sj_form.jsp";
		 }
		 
		 function del(no){
			 if( !confirm("정말 삭제 합니까?") ){
				 return;
			 }
			 location.href="sung_del.jsp?no="+no;
		 }
		 
		 function update(no, name, kor, eng, mat){
			 let ff = document.ff;
			 
			 ff.no.value = no;
			 ff.name.value = name;
			 ff.kor.value = kor;
			 ff.eng.value = eng;
			 ff.mat.value = mat;
			 
			 ff.action = "update_form.jsp";
			 ff.submit();
		 }
		</script>
		
	</head>
	
	<body>
		<form name="ff">
		<input type="hidden" name="no">
		<input type="hidden" name="name">
		<input type="hidden" name="kor">
		<input type="hidden" name="eng">
		<input type="hidden" name="mat">
	
		<table border="1">
			<caption>학생정보</caption>
			<tr>
			 	<th>번호</th>
			 	<th>이름</th>
			 	<th>국어</th>
			 	<th>영어</th>
			 	<th>수학</th>
			 	<th>총점</th>
			 	<th>평균</th>
			 	<th>등수</th>
			 	<th>비고</th>
			</tr>
			
			<% for(SjVO vo : sj_list){ %>
			<tr>
			 	<td><%= vo.getNo() %></td>
			 	<td><%= vo.getName() %></td>
			 	<td><%= vo.getKor() %></td>
			 	<td><%= vo.getEng() %></td>
			 	<td><%= vo.getMat() %></td>
			 	<td><%= vo.getTot() %></td>
			 	<td><%= vo.getAvg() %></td>
			 	<td><%= vo.getRank() %></td>
			 	
			 	<td>
				 	<input type="button" value="삭제" 
				 	onClick="del('<%=vo.getNo()%>');">
				 	
				 	<input type="button" value="수정" 
				 	onClick="update('<%=vo.getNo()%>', 
				 	'<%= vo.getName() %>', 
				 	'<%= vo.getKor() %>', 
				 	'<%= vo.getEng() %>', 
				 	'<%= vo.getMat() %>');">
			 	</td>
			</tr>
			<%} %>
			
			<tr>
			<td colspan="9" align="right">
				<input type="button" value="학생추가" onclick="add();">
			</td>
			</tr>
		</table>
		
		</form>
	</body>
</html>