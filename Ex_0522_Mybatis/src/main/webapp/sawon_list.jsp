<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<script>
			function find(){
				let deptno = document.getElementById("deptno").value;
				location.href="sawonlist.do?deptno="+deptno;
			}
			
			window.onload = function(){
				let deptno = document.getElementById("deptno");
				let dept_array = [0, 10, 20, 30, 40, 50];
				
				for( let i = 0; i < dept_array.length; i++ ){
					if( '${param.deptno}' == dept_array[i] ){
						deptno[i].selected = true;
						break;
					}
				}
			}
			
		</script>
		
	</head>
	
	<body>
		<div align="center">
		
		<select id="deptno">
		<option value="0">:::부서를 선택하세요:::</option>
		<option value="10">총무부</option>
		<option value="20">영업부</option>
		<option value="30">전산실</option>
		<option value="40">관리부</option>
		<option value="50">경리부</option>
		</select>
		
		<input type="button" value="검색" onclick="find();">
		
		</div>
		<table border="1" align="center">
			<caption>사원목록</caption>
			
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>성병</th>
				<th>부서번호</th>
				<th>직책</th>
				<th>입사일</th>
				<th>상사번호</th>
				<th>급여</th>
			</tr>
			
			<c:forEach var="vo" items="${ list }">
			<tr>
				<td>${ vo.sabun }</td>
				<td>${ vo.saname }</td>
				<td>${ vo.sagen }</td>
				<td>${ vo.deptno }</td>
				<td>${ vo.sajob }</td>
				
				<td>
				${ fn:split(vo.sahire, ' ')[0] }
				</td>
				
				<td>${ vo.samgr }</td>
				<td>${ vo.sapay }</td>
			</tr>
			</c:forEach>
		</table>
	</body>
</html>