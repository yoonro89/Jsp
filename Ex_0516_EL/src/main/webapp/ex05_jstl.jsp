<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.PersonVO"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
<!-- fmt(format) -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  
<!-- c(core) : if, choose, forEach와 같은 제어문을 사용할 수 있도록 하는 라이브러리 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	//JSTL(Jsp Standard Tag Library)
	//if, for문 등의 문법을 편하게 처리할 수 있도록 하는 라이브러리
	Date today = new Date();
	request.setAttribute("today", today);
	
	int money = 2100000000;
	request.setAttribute("money", money);
	
	String[] fruit = {"사과", "배", "포도", "참외"};
	request.setAttribute("f_arr", fruit);
	
	PersonVO p1 = new PersonVO("홍길동", 33);
	PersonVO p2 = new PersonVO("이길동", 22);
	List<PersonVO> p_list = new ArrayList<>();
	p_list.add(p1);
	p_list.add(p2);
	request.setAttribute("list", p_list);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	오늘날짜 : <fmt:formatDate value="${ today }"/><br>
	<fmt:formatDate value="${ today }" pattern="yyyy년 MM월 dd일"/><br>	<!-- 대ㆍ소문자를 구분 -->
	잔고 : <fmt:formatNumber value="${ money }"></fmt:formatNumber><br>
	
	<hr>
	<!-- choose안에는 주석을 달 수 없다 -->
	<c:choose>
		<c:when test="${ param.msg eq 10 }">10</c:when>
		<c:when test="${ param.msg eq 11 }">11</c:when>
		<c:otherwise>둘 다 아니야</c:otherwise>
	</c:choose>
	
	<hr>
	<!-- for( int n = 1; n <= 5; n++ ){} -->
	<c:forEach var="n" begin="1" end="5" step="1">
		
		<c:if test="${ n mod 2 eq 1 }">
			<h3><font color=red>안녕(${ n })</font></h3>
		</c:if>
		
		<c:if test="${ n mod 2 eq 0 }">
			<h3><font color=green>안녕(${ n })</font></h3>
		</c:if>
	</c:forEach>
	
	<hr>
	
	<ul>
		<!-- for(String fruit : f_arr ){ } -->
		<c:forEach var="fruit" items="${ f_arr }">
			<li>${ fruit }</li>
		</c:forEach>
	</ul>
	
	<hr>
	
	<!-- cnt.count : 순번(1부터)
		 cnt.index : index번호(0부터) -->
	<c:forEach var="f" items="${ f_arr }" varStatus="cnt">
		<c:if test="${ cnt.count mod 2 eq 1 }">
			<font color="red">
				index:${cnt.index} / count:${cnt.count} / ${ f }
			</font><br>
		</c:if>
		
		<c:if test="${ cnt.count mod 2 eq 0 }">
			index:${cnt.index} / count:${cnt.count} / ${ f }<br>
		</c:if>
	</c:forEach>
	
	<hr>
	
	<c:forEach var="p" items="${ list }" varStatus="cnt">
		${ cnt.count }.${ p.name }/${ p.age }<br>
	</c:forEach>
</body>
</html>