<%@page import="vo.SjVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.SjDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String name = request.getParameter("name");
int no = Integer.parseInt( request.getParameter("no") );
int kor = Integer.parseInt( request.getParameter("kor") );
int eng = Integer.parseInt( request.getParameter("eng") );
int mat = Integer.parseInt( request.getParameter("mat") );
%>
    
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
				
				f.action = "sung_update.jsp";
				f.submit();
			}
		</script>
	</head>
	
	<body>
		<form>
			<input type="hidden" name="no" value="<%=no%>">
			
			<table border="1">
				<caption>:::정보 수정:::</caption>
				<tr>
					<th>이름</th>
					<td><input name="name" value="<%=name%>"></td>
				</tr>
				
				<tr>
					<th>국어</th>
					<td><input name="kor" value="<%=kor%>"></td>
				</tr>
				
				<tr>
					<th>영어</th>
					<td><input name="eng" value="<%=eng%>"></td>
				</tr>
				
				<tr>
					<th>수학</th>
					<td><input name="mat" value="<%=mat%>"></td>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="button" value="수정완료" onclick="send(this.form);">
						<input type="button" value="취소" onclick="history.go(-1);">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>